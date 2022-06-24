//
//  PromotionsViewController.swift
//  DTCab
//
//  Created by Sulaiman on 08/06/22.
//

import UIKit

class PromotionsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var headerView : UIView!
    @IBOutlet weak var btnBack : UIButton!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var ratingsView : UIView!
    @IBOutlet weak var imgRatings : UIImageView!
    @IBOutlet weak var lblRatings : UILabel!
    
    
    @IBOutlet weak var promotionTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        promotionTableView.delegate = self
        promotionTableView.dataSource = self
        lblTitle.text = "My Promotions"

        btnBack.setTitle("", for: .normal)
        ratingsView.layer.cornerRadius = ratingsView.frame.height/2
        imgRatings.layer.cornerRadius = imgRatings.frame.height/2
        btnBack.addTarget(self, action: #selector(btnBack(sender: )), for: .touchUpInside)
    }
    
    @IBAction func btnBack(sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = promotionTableView.dequeueReusableCell(withIdentifier: "PromotionsTableViewCell", for: indexPath) as! PromotionsTableViewCell
        cell.fadeView.layer.cornerRadius = cell.fadeView.frame.size.height/2
        cell.fadeView.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  160
    }

}
class PromotionsTableViewCell: UITableViewCell{
  
    @IBOutlet weak var fadeView: UIView!
    
}
