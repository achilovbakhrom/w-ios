//
//  UIBistoxButton.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/11/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

class UIBistoxButton: UIButton {
    
    var shadowLayer: CAShapeLayer!
    var prevArrow: UIImageView!
    var nextArrow: UIImageView!
    
    private var type: BistoxButtonTypes = .none
    
    init(frame: CGRect, type: BistoxButtonTypes) {
        super.init(frame: frame)
        self.type = type
        
        prevArrow = UIImageView()
        prevArrow.image = UIImage(named: "arrow-forward")?.tintColor(color: UIColor.white)
        prevArrow.isHidden = type == .none || type == .next
        prevArrow.contentMode = .scaleAspectFit
        self.addSubview(prevArrow)
        nextArrow = UIImageView()
        nextArrow.image = UIImage(named: "arrow-forward")?.tintColor(color: UIColor.white)
        nextArrow.isHidden = type == .none || type == .previous
        nextArrow.contentMode = .scaleAspectFit
        self.addSubview(nextArrow)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = min(self.bounds.width, self.bounds.height)/2        
        dropShadow(contentColor: cyanColor, cornerRadius: radius, offsetHeight: 3, lessSize: false)
        let height = self.bounds.height * 0.35
        prevArrow.snp.makeConstraints { make in
            make.width.height.equalTo(height)
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
        prevArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        nextArrow.snp.makeConstraints { make in
            make.width.height.equalTo(height)
            make.right.equalTo(-15)
            make.centerY.equalToSuperview()
        }
    }
}

enum BistoxButtonTypes {
    case previous, next, none, both
}
