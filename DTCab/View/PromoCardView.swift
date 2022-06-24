//
//  PromoCardView.swift
//  DTCab
//
//  Created by Sulaiman on 08/06/22.
//

import Foundation
import UIKit



@IBDesignable  class PromoCardView : UIView{
    
    
    @IBInspectable var cornerRadius :CGFloat = 5
    @IBInspectable var shadowColor = UIColor.black
    @IBInspectable let shadowoffsetHeight : Int = 1
    @IBInspectable let shadowoffsetwidth: Int = 0
    @IBInspectable let shadowRadius : Double = 2.0
    @IBInspectable var shadowOpacity :Float  = 0.4
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
       layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSize(width: shadowoffsetwidth, height: shadowoffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
    
}
