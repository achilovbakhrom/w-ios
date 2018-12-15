//
//  Int+Extension.swift
//  bistox
//
//  Created by Bakhrom Achilov on 12/2/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation

extension Int {
    func lettersFor() -> String {
        switch self {
        case 0:
            return "   "
        case 1:
            return "   "
        case 2:
            return "ABC"
        case 3:
            return "DEF"
        case 4:
            return "GHI"
        case 5:
            return "JKL"
        case 6:
            return "MNO"
        case 7:
            return "PQRS"
        case 8:
            return "TUV"
        case 9:
            return "WXYZ"
        default:
            return ""
        }
    }
}
