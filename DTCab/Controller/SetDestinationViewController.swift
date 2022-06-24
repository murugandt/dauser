//
//  SetDestinationViewController.swift
//  DTCab
//
//  Created by Sulaiman on 08/06/22.
//

import UIKit

class SetDestinationViewController: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtSearch : UITextField!
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var btnSetDestination: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MakeCorners()
        btnBack.setTitle("", for: .normal)
        
        
      
    }
    func MakeCorners(){
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.layer.masksToBounds = false
        btnSetDestination.layer.cornerRadius = 5.0
        btnSetDestination.layer.masksToBounds = true
        
    }
    @IBAction func btnNavBack(_sender : UIButton){
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "SearchDestinationViewController") as! SearchDestinationViewController
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
     @IBAction func btnSetDestination(_sender : UIButton){
         let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "SearchDestinationViewController") as! SearchDestinationViewController
         self.navigationController?.pushViewController(vc, animated: true)
     }
    
}
