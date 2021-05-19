//
//  FactoryPattern_iOSTests.swift
//  FactoryPattern-iOSTests
//
//  Created by Saeed on 5/19/21.
//

import XCTest

class FactoryPattern_iOSTests: XCTestCase {

    func testExample() throws {
        let jsonSerializer = SerializerFactory.makeSerializer(.json)

        XCTAssertEqual(jsonSerializer!.serialize(), "JSONSerializer serialize()")

        let pListSerializer = SerializerFactory.makeSerializer(.plist)

        XCTAssertEqual(pListSerializer!.serialize(), "PropertyListSerializer serialize()")

        let xmlSerializer = SerializerFactory.makeSerializer(.xml)

        XCTAssertEqual(xmlSerializer!.serialize(), "XMLSerializer serialize()")
    }

}
