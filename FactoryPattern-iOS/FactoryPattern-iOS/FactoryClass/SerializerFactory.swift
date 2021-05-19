//
//  SerializerFactory.swift
//  FactoryPattern-iOS
//
//  Created by Saeed on 5/19/21.
//

import Foundation

struct SerializerFactory {
    static func makeSerializer(_ type: SerializerType) -> Serializable? {
        let result: Serializable?
        
        switch type {
        case .json:
            result = JSONSerializer()
        case .plist:
            result = PropertyListSerializer()
        case .xml:
            result = XMLSerializer()
        }

        return result
    }
}
