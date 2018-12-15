//
//  SignInVC.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/12/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit
import Font_Awesome_Swift

class AuthVC: BaseVC<AuthViewModel> {
    
    var logoImageView: UIImageView!
    var tabBarView: UISlidingTabView!
    
    // login
    var loginView: UIView!
    var loginUserNameTextField: UIBistoxTextField!
    var loginPasswordTextField: UIBistoxTextField!
    var rememberMeCheckBoxButton: UIButton!
    var rememberMeLabel: UILabel!
    var loginButton: UIBistoxButton!
    var forgotButton: UIButton!
    
    
    // sign up
    var signUpView: UIView!
    var userNameTextField: UIBistoxTextField!
    var passwordTextField: UIBistoxTextField!
    var confirmPasswordTextField: UIBistoxTextField!
    var signUpButton: UIBistoxButton!
    
    var mode = AuthMode.login {
        didSet {
            setMode()
        }
    }
    
    var kViewModel: AuthViewModel {
        get {
            return viewModel as AuthViewModel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBistoxBackground()
        initUI()
        
    }
    
    private func initUI() {
        // logo
        logoImageView = UIImageView(frame: .zero)
        logoImageView.image = UIImage(named: "phantom-logo")
        logoImageView.invert()
        self.view.addSubview(logoImageView)
        
        let height = (UIScreen.main.bounds.width - 160) * 0.65
        let top = IS_IPHONE_X ? 40 + 80 : 40
        
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(top)
            make.left.equalTo(80)
            make.right.equalTo(-80)
            make.height.equalTo(height)
        }
        
        
        //tab view
        tabBarView = UISlidingTabView(frame: .zero)
        tabBarView.items = ["LOG IN", "SIGN UP"]
        tabBarView.itemSelected = { (position, name) in
            self.mode = position == 0 ? .login : .signUp
        }
        self.view.addSubview(tabBarView)
        tabBarView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            if IS_IPHONE_5_OR_LESS {
                make.top.equalTo(logoImageView.snp.bottom).offset(50)
            } else if IS_IPHONE_6 {
                make.top.equalTo(logoImageView.snp.bottom).offset(65)
            } else {
                make.top.equalTo(logoImageView.snp.bottom).offset(80)
            }
            make.height.equalTo(40)
        }
        
        var fontSize: CGFloat = 15
        if IS_IPHONE_5_OR_LESS {
            fontSize = 16
        } else if IS_IPHONE_6 {
            fontSize = 17
        } else {
            fontSize = 18
        }
        
        // login view
        loginView = UIView(frame: .zero)
        self.view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            if IS_IPHONE_5_OR_LESS {
                make.top.equalTo(tabBarView.snp.bottom).offset(20)
            } else if IS_IPHONE_6 {
                make.top.equalTo(tabBarView.snp.bottom).offset(30)
            } else {
                make.top.equalTo(tabBarView.snp.bottom).offset(40)
            }
            make.left.right.bottom.equalToSuperview()
        }
        
        loginUserNameTextField = UIBistoxTextField(frame: .zero)
        loginUserNameTextField.placeHolderText = "User name / E-mail address"
        loginUserNameTextField.fontSize = fontSize
        self.loginView.addSubview(loginUserNameTextField)
        loginUserNameTextField.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        loginPasswordTextField = UIBistoxTextField(frame: .zero)
        loginPasswordTextField.placeHolderText = "Password"
        loginPasswordTextField.isSecretInput = true
        loginPasswordTextField.fontSize = fontSize
        self.loginView.addSubview(loginPasswordTextField)
        loginPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginUserNameTextField.snp.bottom).offset(8)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        rememberMeCheckBoxButton = UIButton(type: .custom)
        rememberMeCheckBoxButton.setImage(getImage(forName: .FASquareO), for: .normal)
        rememberMeCheckBoxButton.setImage(getImage(forName: .FACheckSquare), for: .selected)
        rememberMeCheckBoxButton.addTarget(self, action: #selector(rememberMeClicked), for: .touchUpInside)
        self.loginView.addSubview(rememberMeCheckBoxButton)
        rememberMeCheckBoxButton.snp.makeConstraints { make in
            make.left.equalTo(loginPasswordTextField)
            make.top.equalTo(loginPasswordTextField.snp.bottom).offset(6)
        }
        
        rememberMeLabel = UILabel(frame: .zero)
        rememberMeLabel.text = "Remember me"
        rememberMeLabel.isUserInteractionEnabled = true
        rememberMeLabel.textColor = cyanColor
        rememberMeLabel.font = UIFont.systemFont(ofSize: 15)
        rememberMeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rememberMeClicked)))
        self.loginView.addSubview(rememberMeLabel)
        rememberMeLabel.snp.makeConstraints { make in
            make.left.equalTo(rememberMeCheckBoxButton.snp.right).offset(6)
            make.centerY.equalTo(rememberMeCheckBoxButton)
        }
        
        forgotButton = UIButton(frame: .zero)
        forgotButton.setTitle("Forgot Password?", for: .normal)
        forgotButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        forgotButton.setTitleColor(cyanColor, for: .normal)
        self.loginView.addSubview(forgotButton)
        forgotButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-15)
        }
        
        loginButton = UIBistoxButton(frame: .zero, type: .next)
        loginButton.setTitle("DONE", for: .normal)
        self.loginView.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(rememberMeLabel.snp.bottom).offset(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(forgotButton.snp.top).offset(-15)
            if IS_IPHONE_5_OR_LESS {
                make.height.equalTo(40)
            } else if IS_IPHONE_6 {
                make.height.equalTo(45)
            } else {
                make.height.equalTo(50)
            }
        }
        
        // sign up view
        signUpView = UIView(frame: .zero)
        self.view.addSubview(signUpView)
        signUpView.snp.makeConstraints { make in
            if IS_IPHONE_5_OR_LESS {
                make.top.equalTo(tabBarView.snp.bottom).offset(20)
            } else if IS_IPHONE_6 {
                make.top.equalTo(tabBarView.snp.bottom).offset(30)
            } else {
                make.top.equalTo(tabBarView.snp.bottom).offset(40)
            }
            make.left.right.bottom.equalToSuperview()
        }
        
        // username text field
        userNameTextField = UIBistoxTextField(frame: .zero)
        userNameTextField.placeHolderText = "User name / E-mail address"
        userNameTextField.fontSize = fontSize
        self.signUpView.addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        // password text field
        passwordTextField = UIBistoxTextField(frame: .zero)
        passwordTextField.isSecretInput = true
        passwordTextField.placeHolderText = "Password"
        passwordTextField.fontSize = fontSize
        self.signUpView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(8)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        // confirm password text field
        confirmPasswordTextField = UIBistoxTextField(frame: .zero)
        confirmPasswordTextField.isSecretInput = true
        confirmPasswordTextField.placeHolderText = "Confirm Password"
        confirmPasswordTextField.fontSize = fontSize
        self.signUpView.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        // sign up button
        signUpButton = UIBistoxButton(frame: .zero, type: .next)
        signUpButton.setTitle("SIGN UP", for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.signUpView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.greaterThanOrEqualTo(confirmPasswordTextField.snp.bottom)
            make.bottom.equalTo(-40)
            if IS_IPHONE_5_OR_LESS {
                make.height.equalTo(40)
            } else if IS_IPHONE_6 {
                make.height.equalTo(45)
            } else {
                make.height.equalTo(50)
            }
        }
        signUpView.alpha = mode == .login ? 0.0 : 1.0
        loginView.alpha = mode == .login ? 1.0 : 0.0
    }
    
    @objc private func rememberMeClicked() {
        rememberMeCheckBoxButton.isSelected = !rememberMeCheckBoxButton.isSelected
    }
    
    private func setMode() {
        UIView.animate(withDuration: 0.2) { [unowned self] in
            if self.mode == .login {
                UIView.animate(withDuration: 0.2, animations: {
                    self.loginView.alpha = 1.0
                    self.signUpView.alpha = 0.0
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.loginView.alpha = 0.0
                    self.signUpView.alpha = 1.0
                })
            }
        }
    }
    
    override func initViewModel() {
        viewModel = AuthViewModel()
    }
}

enum AuthMode {
    case login, signUp
}
