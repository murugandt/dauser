//
//  HomeSearchView.swift
//  DTCab
//
//  Created by Sulaiman on 06/06/22.
//

import Foundation
import UIKit

 class HomeSearchView: UIView {
    
    var view: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnOpenSearchView: UIButton!
    
    
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
        let bundle = Bundle(for: HomeSearchView.self)
        let contentView = bundle.loadNibNamed("HomeSearchView", owner: self, options: nil)?[0] as! UIView
        return contentView
    }
    
    
}


