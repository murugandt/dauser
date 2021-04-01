//
//  RatingsView.swift
//  OnboardingExample
//
//  Created by Apple on 07/03/21.
//  Copyright © 2021 Anitaa. All rights reserved.
//

import UIKit

@IBDesignable class RatingsView: UIView {
    
    var view: UIView!
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblVehicle: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var commentsView: UITextView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var ratings: CosmosView!
    @IBOutlet weak var baseView: UIView!
    
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
        let bundle = Bundle(for: RatingsView.self)
        let contentView = bundle.loadNibNamed("RatingsView", owner: self, options: nil)?[0] as! UIView
        return contentView
    }
}


