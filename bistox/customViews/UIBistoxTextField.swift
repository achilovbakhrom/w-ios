//
//  UIBistoxTextField.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/14/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

class UIBistoxTextField: UIView, UITextFieldDelegate {
    
    var placeHolderLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = cyanColor
        return label
    }()
    var textField: UITextField = {
        var textField = UITextField(frame: .zero)
        textField.placeholder = ""
        textField.textColor = UIColor.white
        textField.textAlignment = .center
        textField.tintColor = UIColor.white
        return textField
    }()
    var text: String? {
        didSet {
            textField.text = text
        }
    }
    var isSecretInput = false {
        didSet {
            textField.isSecureTextEntry = isSecretInput
        }
    }
    var placeHolderText: String? {
        didSet {
            placeHolderLabel.text = placeHolderText
            self.layoutSubviews()
        }
    }
    var placeHolderTextColor: UIColor = cyanColor {
        didSet {
            placeHolderLabel.textColor = placeHolderTextColor
        }
    }
    
    var fontSize: CGFloat = 18 {
        didSet {
            placeHolderLabel.font = UIFont.systemFont(ofSize: fontSize)
            textField.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    var isAnimating = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        textField.font = UIFont.systemFont(ofSize: fontSize)
        placeHolderLabel.font = UIFont.systemFont(ofSize: fontSize)
        placeHolderLabel.textColor = placeHolderTextColor
        textField.delegate = self
        addSubview(textField)
        addSubview(placeHolderLabel)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) { // focused
        if textField.text?.isEmpty ?? false {
            animateLabelUp()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) { // lost focus
        if textField.text?.isEmpty ?? false {
            animateLabelDown()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isAnimating {
            self.snp.makeConstraints { make in
                make.height.equalTo("A".heightOfString(usingFont: UIFont.systemFont(ofSize: fontSize))*2.0)
                make.width.greaterThanOrEqualTo(((placeHolderText?.widthOfString(usingFont: UIFont.systemFont(ofSize: fontSize))) ?? 0.0) + 16.0)
            }
            
            textField.snp.makeConstraints { make in
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.bottom.equalToSuperview()
            }
            
            if textField.text?.isEmpty ?? true {
                placeHolderLabel.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalTo(textField).offset(-4)
                }
            } else {
                placeHolderLabel.alpha = 0.5
                placeHolderLabel.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                placeHolderLabel.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalTo(0)
                }
            }
        }
        
        textField.setBottomBorder()
    }
    
    func preapareToTyping() {
        animateLabelUp()
    }
    
    func endTyping() {
        animateLabelDown()
    }
    
    private func animateLabelUp() {
        isAnimating = true
        self.placeHolderLabel.alpha = 1.0
        UIView.animate(withDuration: 0.2, animations: {
            self.placeHolderLabel.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.placeHolderLabel.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(0)
            }
            self.layoutIfNeeded()
        }) { _ in
            self.isAnimating = false
        }
    }
    
    private func animateLabelDown() {
        isAnimating = true
        self.placeHolderLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
        self.placeHolderLabel.alpha = 0.5
        UIView.animate(withDuration: 0.2, animations: {
            
        })
        UIView.animate(withDuration: 0.2, animations: {
            self.placeHolderLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.placeHolderLabel.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalTo(self.textField).offset(-4)
            }
            self.layoutIfNeeded()
        }) { _ in
            self.isAnimating = false
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
