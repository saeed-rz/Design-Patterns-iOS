//
//  AppConfig.swift
//  Singleton-iOS
//
//  Created by Saeed on 4/14/20.
//  Copyright © 2020 Aquila. All rights reserved.
//

import Foundation

final public class AppConfig{
    
    public static let shared = AppConfig()
    
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    private var configs: [String: Any] = ["BaseUrl":"medium.com", "UserName": "saeedrz"]
    
    private init(){
        
    }
    
    public func string(forKey key: String) -> String? {
        var result: String?
        concurrentQueue.sync {
            result = configs[key] as? String
        }
        return result
    }
    
    public func int(forKey key: String) -> Int? {
        var result: Int?
        concurrentQueue.sync {
            result = configs[key] as? Int
        }
        return result
    }
    
    public func set(value: Any, forKey key: String) {
        concurrentQueue.async( flags: .barrier ) {
            self.configs[key] = value
        }
    }
}
