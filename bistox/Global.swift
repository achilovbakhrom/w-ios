//
//  Global.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/10/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

let cyanColor = UIColor(red: 1/255, green: 160/255, blue: 137/255, alpha: 1.0)
let violetteDark = UIColor(red: 73/255, green: 50/255, blue: 132/255, alpha: 1.0)
let violetteLight = UIColor(red: 80/255, green: 87/255, blue: 139/255, alpha: 1.0)

let gradientFromCyan = UIColor(red: 1/255, green: 160/255, blue: 137/255, alpha: 0.3)

let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
let SCREEN_MAX_LENGTH    = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH    = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let IS_IPHONE            = UIDevice.current.userInterfaceIdiom == .phone
let IS_IPHONE_4_OR_LESS  = IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5          = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_5_OR_LESS  = IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0
let IS_IPHONE_6          = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P         = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0
let IS_IPHONE_7          = IS_IPHONE_6
let IS_IPHONE_7P         = IS_IPHONE_6P
let IS_IPHONE_8          = IS_IPHONE_7
let IS_IPHONE_8P         = IS_IPHONE_7P
let IS_IPHONE_X          = IS_IPHONE && SCREEN_MAX_LENGTH == 812.0
let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad
let IS_IPAD_SIMPLE       = IS_IPAD && SCREEN_MAX_LENGTH == 1024.0
let IS_IPAD_PRO_9_7      = IS_IPAD
let IS_IPAD_PRO_12_9     = IS_IPAD && SCREEN_MAX_LENGTH == 1366.0

let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
let iOS7 = (SYS_VERSION_FLOAT < 8.0 && SYS_VERSION_FLOAT >= 7.0)
let iOS8 = (SYS_VERSION_FLOAT >= 8.0 && SYS_VERSION_FLOAT < 9.0)
let iOS9 = (SYS_VERSION_FLOAT >= 9.0 && SYS_VERSION_FLOAT < 10.0)
let iOS10 = (SYS_VERSION_FLOAT >= 10.0 && SYS_VERSION_FLOAT < 11.0)
let iOS11 = (SYS_VERSION_FLOAT >= 11.0 && SYS_VERSION_FLOAT < 12.0)

let BASE_URL = "some url address"

