//
//  UIBistoxIndicator.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/30/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

class UIBistoxIndicator: UIView {
    
    private var circles = [UIView]()
    private var betweenMargin: CGFloat = 3.0
    private var circleSide: CGFloat = 6.0
    
    var selectedPosition: Int = 0 {
        willSet {
            deselect(index: selectedPosition)
        }
        didSet {
            select(index: selectedPosition)
        }
    }
    
    private var count = 0
    
    init(frame: CGRect, count: Int = 4) {
        super.init(frame: frame)
        self.count = count
        
        self.circles.removeAll()
        for _ in 0...(count-1) {
            let view = UIView()
            self.circles.append(view)
            self.addSubview(view)
        }
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.snp.updateConstraints { make in
            make.width.equalTo(CGFloat(count)*circleSide + CGFloat(count-1)*betweenMargin + 2)
            make.height.equalTo(circleSide + 2.0)
        }
        for index in 0...(count-1) {
            circles[index].snp.makeConstraints({ make in
                make.centerY.equalToSuperview()
                if index == 0 {
                    make.left.top.equalTo(1.0)
                } else {
                    make.left.equalTo(circles[index-1].snp.right).offset(betweenMargin)
                }
                make.width.height.equalTo(circleSide)
            })
            if index == selectedPosition {
                select(index: index)
            } else {
                deselect(index: index)
            }
        }
    }
    
    
    private func select(index: Int) {
        let circle = circles[index]
        circle.layer.cornerRadius = circleSide/2
        circle.layer.masksToBounds = true
        circle.backgroundColor = cyanColor
    }
    
    private func deselect(index: Int) {
        let circle = circles[index]
        circle.backgroundColor = UIColor.clear
        circle.layer.cornerRadius = circleSide/2
        circle.layer.borderWidth = 1.0
        circle.layer.borderColor = cyanColor.cgColor
        circle.layer.masksToBounds = true
    }
    
    func next() {
        if selectedPosition < count - 1 {
            selectedPosition += 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
