//
//  UIBistoxDropDown.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/30/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import DropDown
import UIKit
import Font_Awesome_Swift

class UIBistoxDropDown: UIView {
    
    lazy var textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(icon: FAType.FAAngleDown, size: CGSize(width: 15, height: 15), textColor: UIColor.white, backgroundColor: UIColor.clear)
        return imageView
    }()
    
    var items: [String] = [] {
        didSet {
            dropDown.dataSource = items
        }
    }
    
    lazy var dropDown: DropDown = {
        let dropDown = DropDown(anchorView: self)
        dropDown.dataSource = items
        dropDown.direction = .any
        dropDown.cellHeight = 35
        dropDown.selectionAction = { (index, item) in
            self.textLabel.text = item
            self.selectedPosition = index
        }
        return dropDown
    }()
    
    lazy var arrowView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    lazy var textContainerView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    lazy var bottomBorder: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        return view
    }()
    
    var selectedPosition = 0
    
    
    
    @objc private func openDropDown() {
        dropDown.show()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openDropDown)))
        addSubview(arrowView)
        arrowView.addSubview(arrowImageView)
        addSubview(textContainerView)
        textContainerView.addSubview(textLabel)
        addSubview(bottomBorder)
        self.isUserInteractionEnabled = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if items.count > 0 {
            let margin: CGFloat = 10.0
            let imageSide: CGFloat = 30.0
            let maxLengthItem = items.max { item1, item2 -> Bool in
                return item1.count > item2.count
            } ?? ""
            let maxWidth = maxLengthItem.widthOfString(usingFont: textLabel.font)
            let height = maxLengthItem.heightOfString(usingFont: textLabel.font)
            snp.makeConstraints { (make) in
                make.width.equalTo(maxWidth + CGFloat(margin*3))
                make.height.equalTo((height > imageSide ? height : imageSide) + CGFloat(margin))
            }
            
            arrowView.snp.makeConstraints { make in
                make.top.bottom.right.equalToSuperview()
                make.width.equalTo(imageSide)
            }
            
            arrowImageView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            
            textContainerView.snp.makeConstraints { make in
                make.left.top.bottom.equalToSuperview()
                make.right.equalTo(arrowView.snp.left)
            }
            
            textLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            
            bottomBorder.snp.makeConstraints { make in
                make.left.equalTo(textContainerView)
                make.right.equalTo(arrowImageView)
                make.bottom.equalToSuperview()
                make.height.equalTo(1.5)
            }
            
            textLabel.text = items[selectedPosition]
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
