protocol PaymentGateway {
    func receivePayment(amount: Double)
    var totalPayments: Double {get}
}

final class PayPal: PaymentGateway {
    private var total = 0.0

    func receivePayment(amount: Double) {
        total += amount
    }

    var totalPayments: Double {
        print("Total payments received via PayPal: \(total)")
        return total
    }
}

final class Stripe: PaymentGateway {
    private var total = 0.0

    func receivePayment(amount: Double) {
        total += amount
    }

    var totalPayments: Double {
        print("Total payments received via Stripe: \(total)")
        return total
    }
}

let paypal = PayPal()
paypal.receivePayment(amount: 100)
paypal.receivePayment(amount: 200)
paypal.receivePayment(amount: 499)

let stripe = Stripe()
stripe.receivePayment(amount: 5.99)
stripe.receivePayment(amount: 25)
stripe.receivePayment(amount: 9.99)

var total = 0.0
var paymentGateways: [PaymentGateway] = [paypal, stripe]

final class KoFiPayments {
    var payments = 0.0

    func paid(value: Double, currency: String) {
        payments += value
        print("Paid \(currency)\(value) via Ko-fi Payments")
    }

    func fulfilledTransactions() -> Double {
        return payments
    }
}

extension KoFiPayments: PaymentGateway {
    func receivePayment(amount: Double) {
        paid(value: amount, currency: "USD")
    }

    var totalPayments: Double {
        let total = payments
        print("Total payments received via Ko-fi Payments: \(total)")
        return total
    }
}


let kofiPayments = KoFiPayments()
kofiPayments.receivePayment(amount: 120)
paymentGateways.append(kofiPayments)

for gateway in paymentGateways {
    total += gateway.totalPayments
}
print(total)
