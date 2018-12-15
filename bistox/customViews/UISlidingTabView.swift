//
//  UISlidingTabView.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/10/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class UISlidingTabView: UIView {
    
    
    private var _items: [UILabel]!
    private var isAnimating = false
    var itemSelected: ((_ position: Int, _ item: String) -> Void)? = nil
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = cyanColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return button
    }()
    
    var items: [String]! {
        didSet {
            _items = [UILabel]()
            for (index, element) in items.enumerated() {
                let label = UILabel()
                label.text = element
                label.tag = index
                label.textColor = UIColor.lightGray
                label.isUserInteractionEnabled = true
                label.textAlignment = .center
                label.font = UIFont.boldSystemFont(ofSize: 13)
                label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(itemClick(sender:))))
                _items.append(label)
                self.addSubview(label)
            }
            self.layoutSubviews()
        }
    }
    
    var selectedPosition: Int = 0 {
        didSet {
            if _items != nil {
                self.layoutSubviews()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        self.addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !isAnimating {
            self.makeCircle()
            let width = self.bounds.width/CGFloat(_items.count)
            let height = self.bounds.height
            
            _items.forEach { label in
                let position = label.tag
                if position == 0 {
                    label.snp.remakeConstraints { make in
                        make.top.equalTo(0)
                        make.left.equalTo(0)
                        make.height.equalTo(height)
                        make.width.equalTo(width)
                    }
                } else {
                    label.snp.remakeConstraints { make in
                        make.top.equalTo(0)
                        make.left.equalTo(_items[position-1].snp.right)
                        make.height.equalTo(height)
                        make.width.equalTo(width)
                    }
                }
            }
            
            let buttonLeft = CGFloat(selectedPosition)*width
            button.snp.remakeConstraints { make in
                make.left.equalTo(buttonLeft)
                make.top.equalTo(0)
                make.width.equalTo(width)
                make.height.equalTo(height)
            }
            button.makeCircle()
            button.setTitle(items[selectedPosition], for: .normal)
            self.bringSubview(toFront: button)
        }
    }
    
    @objc
    private func itemClick(sender: UITapGestureRecognizer) {
        selectedPosition = sender.view?.tag ?? 0
        button.setTitle((sender.view as! UILabel).text, for: .normal)
        self.animate(position: selectedPosition)
        _ = itemSelected?(selectedPosition, items[selectedPosition])
    }
    
    private func animate(position: Int) {
        isAnimating = true
        let width = self.bounds.width/CGFloat(_items.count)
        let height = self.bounds.height
        UIView.animate(withDuration: 0.2, animations: {
            let buttonLeft = CGFloat(position)*width
            self.button.snp.updateConstraints { make in
                make.left.equalTo(buttonLeft)
                make.top.equalTo(0)
                make.width.equalTo(width)
                make.height.equalTo(height)
            }
            self.layoutIfNeeded()
        }) { _ in
            self.isAnimating = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
