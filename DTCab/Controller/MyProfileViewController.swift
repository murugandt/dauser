//
//  MyProfileViewController.swift
//  DTCab
//
//  Created by Sulaiman on 08/06/22.
//

import UIKit

class MyProfileViewController: UIViewController {
    @IBOutlet weak  var headerView : UIView!
    @IBOutlet weak  var btnCancel : UIButton!
    @IBOutlet weak  var imgprofile : UIImageView!
    @IBOutlet weak  var lblName : UILabel!
    @IBOutlet weak var txtName : UITextField!
    @IBOutlet weak  var lblEmail : UILabel!
    @IBOutlet weak  var lblMobile : UILabel!
    @IBOutlet weak  var lblPrefrence : UILabel!
    @IBOutlet weak  var descView : UIView!
    @IBOutlet weak  var lbltitle : UILabel!
    @IBOutlet weak  var lblDesc : UILabel!
    @IBOutlet weak  var btnCheckBox : UIButton!
    @IBOutlet weak  var fbView : UIView!
    @IBOutlet weak  var googleView : UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCornerRadius()
        btnCancel.setTitle("", for: .normal)
        btnCheckBox.setTitle("", for: .normal)
       
    }
    func addCornerRadius(){
        googleView.layer.cornerRadius = 5
        googleView.layer.masksToBounds = true
        fbView.layer.cornerRadius = 5
        btnCheckBox.layer.cornerRadius = btnCheckBox.frame.height/2
        btnCheckBox.layer.masksToBounds = true
        imgprofile.layer.cornerRadius = btnCheckBox.frame.height/2
        imgprofile.layer.cornerRadius = btnCheckBox.frame.width/2
        descView.layer.cornerRadius = 5
        descView.layer.masksToBounds = true
    }
    

}

