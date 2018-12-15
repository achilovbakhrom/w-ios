//
//  VerificationVC.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/30/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit
import Font_Awesome_Swift

class VerificationVC: BaseVC<VerificationViewModel>, UITextFieldDelegate, KeyboardProtocol {
    
    
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "phantom-logo")
        imageView.invert()
        return imageView
    }()
    
    lazy var messageImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(icon: FAType.FAEnvelopeO, size: CGSize(width: 40, height: 40), textColor: UIColor.white, backgroundColor: UIColor.clear)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var centerTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "We need to text you the OTP\n to authenticate your account"
        label.isHidden = true
        return label
    }()
    
    lazy var dropDown: UIBistoxDropDown = {
        let dropDown = UIBistoxDropDown(frame: .zero)
        dropDown.items = ["+998", "+790", "+791"]
        
        return dropDown
    }()
    
    lazy var phoneNumberTextField: UIBistoxTextField = {
        let textField = UIBistoxTextField(frame: .zero)
        textField.placeHolderText = "Your mobile number"
        textField.placeHolderTextColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        textField.textField.delegate = self
        return textField
    }()
    
    lazy var indicator: UIBistoxIndicator = {
        let indicator = UIBistoxIndicator(frame: .zero, count: 10)
        return indicator
    }()
    
    lazy var numbersContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var keyboard: UIBistoxNumbersKeyboard = {
        let keyboard = UIBistoxNumbersKeyboard(frame: .zero)
        return keyboard
    }()
    
    lazy var pinTextField: UIBistoxPinTextField = {
        let textField = UIBistoxPinTextField(frame: .zero)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeBistoxBackground()
        self.initUI()
        keyboard.keyboaredProtorcol = self
        
    }
    
    func keyboardTapped(buttonClicked: KeyboardButtons) {
        
        switch buttonClicked {
        case .clear:
            
            let text = phoneNumberTextField.text ?? ""
            let closeTextField = !text.isEmpty && text.count == 1
            if !text.isEmpty {
                phoneNumberTextField.text = String(text.dropLast())
            }
            if closeTextField {
                phoneNumberTextField.endTyping()
            }
            break
        case .nextButton:
            
            break
        case .number(let number):
            let text = "\(phoneNumberTextField.text ?? "")\(number)"
            if phoneNumberTextField.text?.isEmpty ?? true {
                phoneNumberTextField.preapareToTyping()
            }
            phoneNumberTextField.text = text
            
            pinTextField.text = text
            
            break
        
        }
        
        
    }
    
    override func initViewModel() {
        viewModel = VerificationViewModel()
    }
    
    private func initUI() {
        self.view.addSubview(logoImageView)
        let height = (UIScreen.main.bounds.width - 160) * 0.65
        let top = IS_IPHONE_X ? 40 + 80 : 40
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(top)
            make.left.equalTo(80)
            make.right.equalTo(-80)
            make.height.equalTo(height)
        }
        
        self.view.addSubview(messageImageView)
        messageImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
            make.width.height.equalTo(40)
        }
        
        self.view.addSubview(centerTextLabel)
        centerTextLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(messageImageView.snp.bottom).offset(15)
            
        }
        self.view.addSubview(phoneNumberTextField)
        phoneNumberTextField.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.centerX).offset(-35)
            make.top.equalTo(centerTextLabel.snp.bottom).offset(20)
        }
        
        self.view.addSubview(dropDown)
        dropDown.snp.makeConstraints { make in
            make.right.equalTo(phoneNumberTextField.snp.left).offset(-20)
            make.bottom.equalTo(phoneNumberTextField)
            
        }
        
        self.view.addSubview(indicator)
        indicator.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        self.view.addSubview(numbersContainer)
        numbersContainer.snp.makeConstraints { make in
            make.top.equalTo(indicator.snp.bottom).offset(15)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height/3)
        }
        
        numbersContainer.addSubview(keyboard)
        keyboard.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.view.addSubview(pinTextField)
        pinTextField.snp.makeConstraints { make in
//            make.height.equalTo(35)
//            make.width.equalTo(UIScreen.main.bounds.width/3)
            make.center.equalToSuperview()
        }
        
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return false
    }
    
    
}
