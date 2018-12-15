//
//  NSError+Extension.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/12/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation

extension NSError {
    static func simpleError(domain: String) -> NSError {
        return NSError(domain: domain, code: 0, userInfo: nil)
    }
}
