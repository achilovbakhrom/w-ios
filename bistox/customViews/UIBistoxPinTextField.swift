//
//  UIBistoxPinTextField.swift
//  bistox
//
//  Created by Bakhrom Achilov on 12/5/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

class UIBistoxPinTextField: UIView {
    
    var text: String = "" {
        didSet {
            print(text)
            self.setNumber()
        }
    }
    
    lazy var firstNumber: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.white
        label.text = "-"
        return label
    }()
    
    lazy var secondNumber: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.white
        label.text = "-"
        return label
    }()
    
    lazy var thirdNumber: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.white
        label.text = "-"
        return label
    }()
    
    lazy var fourthNumber: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.white
        label.text = "-"
        return label
    }()
    
    lazy var underline: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = violetteLight
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        addSubview(firstNumber)
        addSubview(secondNumber)
        addSubview(thirdNumber)
        addSubview(fourthNumber)
        addSubview(underline)
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(UIScreen.main.bounds.width/3)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let step = 0.92*self.bounds.width/3
        
        firstNumber.snp.makeConstraints { make in
            make.left.centerY.equalToSuperview()
        }
        secondNumber.snp.makeConstraints { make in
            make.centerX.equalTo(firstNumber).offset(step)
            make.centerY.equalToSuperview()
        }
        
        thirdNumber.snp.makeConstraints { make in
            make.centerX.equalTo(secondNumber).offset(step)
            make.centerY.equalToSuperview()
        }
        
        fourthNumber.snp.makeConstraints { make in
            make.centerX.equalTo(thirdNumber).offset(step)
            make.centerY.equalToSuperview()
        }
        
        underline.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    
    private func setNumber() {
        if text.count <= 4 {
            firstNumber.text = text.character(at: 0).isEmpty ? "-" : text.character(at: 0)
            secondNumber.text = text.character(at: 1).isEmpty ? "-" : text.character(at: 1)
            thirdNumber.text = text.character(at: 2).isEmpty ? "-" : text.character(at: 2)
            fourthNumber.text = text.character(at: 3).isEmpty ? "-" : text.character(at: 3)
        } else {
            let diff = text.count - 4
            _ = text.dropLast(diff)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
