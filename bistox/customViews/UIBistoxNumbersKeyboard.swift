//
//  UIBistoxNumbersKeyboard.swift
//  bistox
//
//  Created by Bakhrom Achilov on 12/2/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

class UIBistoxNumbersKeyboard: UIView {
    
    lazy var zeroButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 0)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 0
        return result
    }()
    
    lazy var oneButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 1)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 1
        return result
    }()
    
    lazy var twoButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 2)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 2
        return result
    }()
    
    lazy var threeButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 3)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 3
        return result
    }()
    
    lazy var fourButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 4)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 4
        return result
    }()
    
    lazy var fiveButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 5)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 5
        return result
    }()
    
    lazy var sixButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 6)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 6
        return result
    }()
    
    lazy var sevenButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 7)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 7
        return result
    }()
    
    lazy var eightButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 8)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 8
        return result
    }()
    
    lazy var nineButton: UIButton = {
        let result = UIButton.makeKeyboardButton(num: 9)
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        result.tag = 9
        return result
    }()
    
    lazy var nextButton: UIButton = {
        let result = UIButton(frame: .zero)
        result.tag = 10
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        return result
    }()
    
    lazy var clearButton: UIButton = {
        let result = UIButton(frame: .zero)
        result.tag = 11
        result.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        return result
    }()
    
    lazy var container: UIView = {
        let result = UIView(frame: .zero)
        return result
    }()
    
    weak var keyboaredProtorcol: KeyboardProtocol? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        self.addSubview(container)
        container.addSubview(zeroButton)
        container.addSubview(oneButton)
        container.addSubview(twoButton)
        container.addSubview(threeButton)
        container.addSubview(fourButton)
        container.addSubview(fiveButton)
        container.addSubview(sixButton)
        container.addSubview(sevenButton)
        container.addSubview(eightButton)
        container.addSubview(nineButton)
        container.addSubview(clearButton)
        container.addSubview(nextButton)
        
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        switch sender.tag {
        case 10:
            keyboaredProtorcol?.keyboardTapped(buttonClicked: .nextButton)
            break
        case 11:
            keyboaredProtorcol?.keyboardTapped(buttonClicked: .clear)            
            break
        default:
            keyboaredProtorcol?.keyboardTapped(buttonClicked: .number(sender.tag))
            break
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
        
        oneButton.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        twoButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(oneButton.snp.right)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        threeButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(twoButton.snp.right)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        fourButton.snp.makeConstraints { make in
            make.top.equalTo(oneButton.snp.bottom)
            make.left.equalTo(oneButton)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        fiveButton.snp.makeConstraints { make in
            make.top.equalTo(twoButton.snp.bottom)
            make.left.equalTo(twoButton)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        sixButton.snp.makeConstraints { make in
            make.top.equalTo(threeButton.snp.bottom)
            make.left.equalTo(threeButton)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        sevenButton.snp.makeConstraints { make in
            make.top.equalTo(fourButton.snp.bottom)
            make.left.equalTo(fourButton)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        eightButton.snp.makeConstraints { make in
            make.top.equalTo(sevenButton)
            make.left.equalTo(sevenButton.snp.right)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        nineButton.snp.makeConstraints { make in
            make.top.equalTo(eightButton)
            make.left.equalTo(eightButton.snp.right)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        clearButton.snp.makeConstraints { make in
            make.top.equalTo(sevenButton.snp.bottom)
            make.left.equalTo(sevenButton)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        zeroButton.snp.makeConstraints { make in
            make.top.equalTo(clearButton)
            make.left.equalTo(clearButton.snp.right)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(zeroButton)
            make.left.equalTo(zeroButton.snp.right)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(4)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
enum KeyboardButtons {
    case clear
    case nextButton
    case number(Int)
}
protocol KeyboardProtocol: class {
    func keyboardTapped(buttonClicked: KeyboardButtons)
}
