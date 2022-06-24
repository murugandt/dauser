//
//  HeaderView.swift
//  OnboardingExample
//
//  Created by Apple on 02/03/21.
//  Copyright © 2021 Anitaa. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class HeaderView: UIView {
    
    var view: UIView!
    @IBOutlet weak  var headerContentView : UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewSetup()
    }
    
    func viewSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: HeaderView.self)
        let contentView = bundle.loadNibNamed("HeaderView", owner: self, options: nil)?[0] as! UIView
        return contentView
    }
}

