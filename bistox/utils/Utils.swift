//
//  Utils.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/16/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import Font_Awesome_Swift
import UIKit

func getImage(forName: FAType, size: CGSize = CGSize(width: 30, height: 30), color: UIColor = cyanColor) -> UIImage {
    return UIImage(icon: forName, size: size, textColor: color, backgroundColor: UIColor.clear)
}
