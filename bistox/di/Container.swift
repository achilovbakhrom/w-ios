//
//  Container.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/23/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation


class Container {
    
    var prototypes = [AnyObject]()
    
    func register<T>(type: ItemType, argName: String = "", withName: String = "", item: @escaping (_ args: AnyObject...) -> T) {
        
    }
    
    func inject(named: String = "") {
        
    }
    
}

enum ItemType {
    case prototype, singleton
}
