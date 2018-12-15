//
//  MainVC.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/10/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

class MainVC: BaseVC<EmptyViewModel> {
    
    var slider: UISlidingTabView!
    var button: UIBistoxButton!
    var textField: UIBistoxTextField!
    var secondTextField: UIBistoxTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        slider = UISlidingTabView()
        slider.items = ["LOG IN", "SIGN UP"]
        self.view.addSubview(slider)
        slider.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalTo(15)
            make.right.equalTo(-25)
            make.height.equalTo(40)
        }
        
        slider.backgroundColor = UIColor.white
        slider.itemSelected = { (position, item) in
            
        }
        
        button = UIBistoxButton(frame: .zero, type: .none)
        button.setTitle("Nilufar Button", for: .normal)
        self.view.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(slider.snp.bottom).offset(10)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(40)
        }
        self.view.backgroundColor = UIColor.black
        textField = UIBistoxTextField(frame: .zero)
        textField.placeHolderText = "Place Holder"
        
        self.view.addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(button.snp.bottom).offset(10)
        }
        
        secondTextField = UIBistoxTextField(frame: .zero)
        secondTextField.placeHolderText = "Place Holder"
        secondTextField.isSecretInput = true
        self.view.addSubview(secondTextField)
        secondTextField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(textField.snp.bottom).offset(10)
        }
        
        makeBistoxBackground()
    }
    
    override func initViewModel() {
        viewModel = EmptyViewModel()
    }
}
