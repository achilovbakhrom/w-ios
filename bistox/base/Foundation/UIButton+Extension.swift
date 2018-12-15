//
//  UIButton+Extensions.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/11/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    static func makeBistoxButton() -> UIButton {
        let result = UIButton()
        result.backgroundColor = cyanColor
        return UIButton()
    }
}

extension UIButton {
    static func makeKeyboardButton(num: Int) -> UIButton {
        let numberAttribute = NSAttributedString(string: "\(num)  ", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 25)])
        let lettersAttribute = NSMutableAttributedString(string: num.lettersFor(), attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)])
        let attributedText = NSMutableAttributedString()
        attributedText.append(numberAttribute)
        attributedText.append(lettersAttribute)
        let result = UIButton(frame: .zero)
        result.setAttributedTitle(attributedText, for: .normal)
        return result
    }
}
