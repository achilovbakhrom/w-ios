//
//  ForgotVC.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/30/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

class ForgotVC: BaseVC<ForgotViewModel> {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "phantom-logo")
        imageView.invert()
        return imageView
    }()
    
    lazy var forgetPasswordImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        // todo lock image
        return imageView
    }()
    
    lazy var forgetTextLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = "Forget your password?"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var enterPasswordTextField: UIBistoxTextField = {
        let textField = UIBistoxTextField(frame: .zero)
        textField.placeHolderText = "Enter your personal email"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeBistoxBackground()
        self.initUI()
    }
    
    private func initUI() {
        self.view.addSubview(logoImageView)
        self.view.addSubview(forgetPasswordImageView)
        self.view.addSubview(forgetTextLabel)
        self.view.addSubview(enterPasswordTextField)
        
        let height = (UIScreen.main.bounds.width - 160) * 0.65
        let top = IS_IPHONE_X ? 40 + 80 : 40
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(top)
            make.left.equalTo(80)
            make.right.equalTo(-80)
            make.height.equalTo(height)
        }
        
        forgetPasswordImageView.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(35)
        }
        
        forgetTextLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgetPasswordImageView.snp.bottom).offset(8)
        }
        
        enterPasswordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgetTextLabel.snp.bottom).offset(45)
            make.left.equalTo(25)
            make.right.equalTo(-25)
        }        
    }
    
    
}
