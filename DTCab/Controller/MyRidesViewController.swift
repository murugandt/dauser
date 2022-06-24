//
//  MyRidesViewController.swift
//  DTCab
//
//  Created by Sulaiman on 07/06/22.
//

import UIKit

class MyRidesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var myridesTableView : UITableView!
    @IBOutlet var tableViewTopConstrains : NSLayoutConstraint!
    @IBOutlet weak var noRideView : UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.titleLabel.text = "MY Rides"
       

        self.myridesTableView.delegate = self
        self.myridesTableView.dataSource = self
        headerView.backBtn.addTarget(self, action: #selector(self.btnBack(sender:)), for: .touchUpInside)
        hideView()
        
    }
    
    func hideView(){
        if(noRideView.isHidden == true){
            tableViewTopConstrains.constant = -80
            
        }
        else{
            tableViewTopConstrains.constant = 10
        }
    }
    @IBAction func btnBack(sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myridesTableView.dequeueReusableCell(withIdentifier: "MyRidesTableViewCell", for: indexPath) as!
        MyRidesTableViewCell
        cell.rideView.layer.cornerRadius = 5.0
        cell.rideView.layer.masksToBounds = true
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    


}
class MyRidesTableViewCell : UITableViewCell{
    @IBOutlet weak  var rideView : UIView!
}
