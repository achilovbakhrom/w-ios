//
//  UserDefaults+Extensions.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/11/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
extension UserDefaults {
    
    private func save<T>(forKey: String, item: T) {
        self.set(item, forKey: forKey)
        self.synchronize()
    }
    
    private func get<T>(forKey: String) -> T {
        return self.get(forKey: forKey) as T
    }
    
}
