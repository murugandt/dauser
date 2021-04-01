//
//  AppDelegate.swift
//  MealBrite
//
//  Created by Murugan on 15/07/20.
//  Copyright © 2020 Murugan. All rights reserved.
//

import Foundation

let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String

let isProduction = false

let PrintLog: Bool = false

let devURL = ""

let liveURL = ""

let baseURL = isProduction ? liveURL : devURL

let googleAddressApiKey = ""

let NameLength: Int = 15

let PasswordLength: Int = 15

let EmailLength: Int = 40

let MobileLength: Int = 14

let SearchCharacterLength = 20

let DescriptionLength: Int = 500

let PriceLength: Int = 10

let LocationLength: Int = 100

let ZipcodeLength: Int = 20

let PopupSuccess = "success"

let PopupError = "error"

let PopupWarning = "warning"

let PopupInfo = "info"

let Success = "Success"
