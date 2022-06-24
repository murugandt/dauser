//
//  BookingDetailsViewController.swift
//  DTCab
//
//  Created by Sulaiman on 14/06/22.
//

import UIKit

class BookingDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var  txtSearch : UITextField!
    @IBOutlet weak  var bookingDetailsTableView : UITableView!
    @IBOutlet weak var panView : UIView!
    @IBOutlet weak var  btnPromo : UIButton!
    @IBOutlet weak var  btnPay : UIButton!
   @IBOutlet var popupView: NotePopup!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        bookingDetailsTableView.delegate = self
        bookingDetailsTableView.dataSource = self
        btnPay.setTitle("", for: .normal)
        
        
    }
    @IBAction func btnPromo(sender: UIButton){
       
        
    }
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookingDetailsTableView.dequeueReusableCell(withIdentifier: "BookingDetailsTableViewCell", for: indexPath) as! BookingDetailsTableViewCell
        return cell 
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
        
    }

  

}
class BookingDetailsTableViewCell : UITableViewCell{
    @IBOutlet weak var viewContent : UIView!
    @IBOutlet weak var lblTitle : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContent.layer.cornerRadius = 10
        
    }
}
