//
//  UITextField+Extension.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/14/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(1.5)
        border.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.insertSublayer(border, at: 0)
        self.layer.masksToBounds = true
    }
}
