//
//  SearchDestinationViewController.swift
//  DTCab
//
//  Created by Sulaiman on 07/06/22.
//

import UIKit

class SearchDestinationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
   
   @IBOutlet weak var ContentViewHeightConstrains: NSLayoutConstraint!
    @IBOutlet weak var stackView : UIStackView!
    
    @IBOutlet weak var stackviewHeightConstrains: NSLayoutConstraint!
    @IBOutlet weak var txtPickup : UITextField!
    @IBOutlet weak var txtDestination : UITextField!
    @IBOutlet weak var imgPickup : UIImageView!
    @IBOutlet weak var imgDestination : UIImageView!
    @IBOutlet weak var destinationtableView : UITableView!
    @IBOutlet weak var btnAddPlace : UIButton!
    @IBOutlet weak var btnBack : UIButton!
    @IBOutlet weak var btnGoMap : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationtableView.delegate = self
        destinationtableView.dataSource = self
        self.btnAddPlace.setTitle("", for: .normal)
        self.btnGoMap.setTitle("", for: .normal)
        btnBack.setTitle("", for: .normal)
        view.backgroundColor = .white
        ContentViewHeightConstrains.constant = 240
        stackView.isHidden = true
        
    }
    
    @IBAction func btnNavBack(_sender : UIButton){
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    @IBAction func btnGomap(_sender : UIButton){
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "SetDestinationViewController") as! SetDestinationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnAddplace(_sender : UIButton){
        ContentViewHeightConstrains.constant = 300
        stackviewHeightConstrains.constant = 80
        stackView.isHidden = false
        print("tapped")
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }
        else{
            return 100
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
        let view = destinationtableView.dequeueReusableCell(withIdentifier: "HeaderTableViewcell") as! HeaderTableViewcell
            return view
        }
        else{
            let view = destinationtableView.dequeueReusableCell(withIdentifier: "HeaderTableViewcell") as! HeaderTableViewcell
           
                return view
        }
        
       
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        else{
            return 20
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
            let totalRows = destinationtableView.numberOfRows(inSection: indexPath.section)
            
            if indexPath.row == totalRows - 1 {
                cell.baselbl.isHidden = true
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchedPlacesTableViewCell", for: indexPath) as! SearchedPlacesTableViewCell
            return cell
        }
       
    }

}




class AddressTableViewCell : UITableViewCell{
    
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var baselbl : UILabel!
    
}
class SearchedPlacesTableViewCell : UITableViewCell{
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var img : UIImageView!
}

class HeaderTableViewcell  : UITableViewCell{
    @IBOutlet weak var viewContent : UIView!
    @IBOutlet weak var lblLower : UILabel!
    @IBOutlet weak var lblUpper : UILabel!
}
