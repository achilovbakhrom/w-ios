//
//  UIImageView+Extensions.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/10/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

// make view circled
extension UIView {
    func makeCircle(withRadius radius: CGFloat = -1.0) {
        layer.cornerRadius = radius > 0.0 ? radius : min(bounds.width, bounds.height)/2
        layer.masksToBounds = true
    }
}

// drop shadow
extension UIView {
    
    func dropShadow(shadowColor: UIColor = cyanColor,
                    shadowRadius: CGFloat = 6,
                    shadowOpacity: CGFloat = 0.5,
                    contentColor: UIColor = UIColor.white,
                    cornerRadius: CGFloat = 10,
                    offsetWidth: CGFloat = 0.0,
                    offsetHeight: CGFloat = 10.0,
                    lessSize: Bool = true) {

        
        if layer.value(forKey: "layerAdded") == nil {
            let shadowLayer = CAShapeLayer()
            let shadowBounds = CGRect(x: lessSize ? bounds.width * 0.03 : bounds.origin.x,
                                      y: bounds.origin.y,
                                      width: lessSize ? bounds.width * 0.94 : bounds.width,
                                      height: bounds.height)
            
            shadowLayer.path = UIBezierPath(roundedRect: shadowBounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.shadowColor = shadowColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
            shadowLayer.shadowOpacity = Float(shadowOpacity)
            shadowLayer.shadowRadius = shadowRadius
            layer.insertSublayer(shadowLayer, at: 0)
            
            let contentLayer = CAShapeLayer()
            let contentBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height)
            contentLayer.path = UIBezierPath(roundedRect: contentBounds, cornerRadius: cornerRadius).cgPath
            contentLayer.fillColor = contentColor.cgColor
            layer.insertSublayer(contentLayer, above: shadowLayer)
            layer.setValue(true, forKey: "layerAdded")
        }

        self.layoutIfNeeded()
    }
    
}

