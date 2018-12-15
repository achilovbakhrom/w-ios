//
//  UIImageView+Extension.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/15/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func invert() {
        let beginImage = CIImage(image: self.image!)
        if let filter = CIFilter(name: "CIColorInvert") {
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            let newImage = UIImage(ciImage: filter.outputImage!)
            self.image = newImage
        }        
    }
    
}
