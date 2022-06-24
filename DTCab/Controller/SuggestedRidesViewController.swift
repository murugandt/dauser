//
//  SuggestedRidesViewController.swift
//  DTCab
//
//  Created by Sulaiman on 07/06/22.
//

import UIKit

class SuggestedRidesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate {
   
    
    @IBOutlet  var SuggestedRideTableView : UITableView!
   @IBOutlet  var btnPromo : UIButton!
    @IBOutlet  var btnClosePopUp : UIButton!
    @IBOutlet  var btnpay : UIButton!
    @IBOutlet  var btnNotes : UIButton!
    @IBOutlet  var btnPickUpTime : UIButton!
    @IBOutlet weak var notePopUp :UIView!
    @IBOutlet weak var promoPopUp :UIView!
    @IBOutlet weak var pickUpPopUp : UIView!
    @IBOutlet weak var notePopUpBottomConstraint :NSLayoutConstraint!
    @IBOutlet weak var pickUpBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var promoPopUpBottomConstraint :NSLayoutConstraint!
 
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        SuggestedRideTableView.delegate = self
        SuggestedRideTableView.dataSource = self
        btnpay.setTitle("", for: .normal)
        loadXib()
     
        
    }
    func loadXib(){
//        let noteXibView = NotePopup.loadNib()
//        noteXibView.frame = view.bounds
//        noteXibView.contentView.layer.cornerRadius = 15.0
//        noteXibView.contentView.layer.masksToBounds = true
//        noteXibView.btnConfirm.layer.cornerRadius = 10.0
//        notePopUp?.addSubview(noteXibView)
        
//        let promoXibView = PromoPopUp.loadNib()
//        promoXibView.frame = view.bounds
//        promoXibView.viewContent.layer.cornerRadius = 15.0
//        promoXibView.viewContent.layer.masksToBounds = true
//        promoPopUp?.addSubview(promoXibView)
        
        let pickUpXibView = PickUpTimePopUp.loadNib()
        pickUpXibView.frame = view.bounds
        pickUpPopUp.addSubview(pickUpXibView)
        


    }
   
    
    @IBAction func btnOpenNotes(sender : UIButton){
        notePopUpBottomConstraint.constant = 0
        
    }
 @IBAction func btnOpenPromo(sender : UIButton){
     print("tagged")
     self.promoPopUpBottomConstraint.constant = 0
    
    }
    @IBAction func btnOpenPickerView(sender : UIButton){
        print("tapped")
        self.pickUpBottomConstraint.constant = 0
        
    }
    @IBAction func btnClosePopUp(sender : UIButton){
        print("tapped")
        self.promoPopUpBottomConstraint.constant = -300
        self.notePopUpBottomConstraint.constant = -300
        self.pickUpBottomConstraint.constant = -600
    }
  
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SuggestedRideTableView.dequeueReusableCell(withIdentifier: "SuggestedRideTableViewCell", for: indexPath) as! SuggestedRideTableViewCell
        return cell
    }
   
   

}

class SuggestedRideTableViewCell : UITableViewCell{
    
    @IBOutlet weak var cardView : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 10
    }
    
}
