//
//  NotePopup.swift
//  DTCab
//
//  Created by Sulaiman on 07/06/22.
//

import Foundation
import UIKit

class NotePopup : UIView{
    //var view: UIView!
    @IBOutlet weak var contentView : UIView!
    
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var txtNote : UITextField!
    @IBOutlet weak var btnConfirm : UIButton!

    
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
    
    }



