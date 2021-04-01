//
//  AppConstants.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import UIKit

public typealias GenericClosure<T> = (_ value: T)->()

enum App: String{
    case AppTheme = "#113870"
    case LightRed = "#FF8683"
    case ButtonDoneColor = "#FB4A46"

    var Color : UIColor {
        return UIColor.init(colorCode: self.rawValue)!
    }
}

enum ImageName: String{
    case Back = "back"
    
    var image : UIImage {
        return UIImage.init(named: self.rawValue)!
    }
}

enum Storyboards : String {
    case Main = "Main"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}
