//
//  AppDelegate+Extension.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/23/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var container: Container {
        get {
            return self.container
        }
        set(newValue) {
            self.container = newValue
        }
    }
    
}
