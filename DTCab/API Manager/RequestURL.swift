//
//  APIMAnager.swift
//  Food Order
//
//  Created by Apple on 09/12/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

var accessToken = UserDefaults.standard.object(forKey: "accessToken") as! String

public enum RequestMethod : String
{
    
    case logIn = ""

}
