//
//  MyFavouriteViewController.swift
//  DTCab
//
//  Created by Sulaiman on 07/06/22.
//

import UIKit

class MyFavouriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var headerView : UIView!
    @IBOutlet weak var btnback : UIButton!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var favouriteTableView :UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteTableView.delegate = self
        favouriteTableView.dataSource = self
        
        lblTitle.text = " My favourites"
    
        btnback.setTitle("", for: .normal)
    }
    @IBAction func btnNavBack(_sender : UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func btnAdd(_sender : UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "UpdatePlaceViewController") as! UpdatePlaceViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0
        {
            let view = favouriteTableView.dequeueReusableCell(withIdentifier: "FavouriteheaderCell") as! FavouriteheaderCell
            
            return view
        }
        else{
            
            let view = favouriteTableView.dequeueReusableCell(withIdentifier: "FavouriteheaderCell") as! FavouriteheaderCell
            
            return view
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "FavouriteAddressTableViewCell", for: indexPath) as! FavouriteAddressTableViewCell
            cell.btnSelect.setTitle("", for: .normal)
            let totalRows = favouriteTableView.numberOfRows(inSection: indexPath.section)
            
            if indexPath.row == totalRows - 1 {
                cell.lblBase.isHidden = true
            }
            
            return cell
        }
        else{
            let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "FavouriteSelectedPlacesTableViewCell", for: indexPath) as! FavouriteSelectedPlacesTableViewCell
            
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0){
            return 0
        }
        else{
            return 60
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if indexPath.section == 0{
            return 70
        } else{
            return 100
        }
    }
}
class FavouriteheaderCell : UITableViewCell{
    @IBOutlet weak var viewContent : NSLayoutConstraint!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBase : UILabel!
}
class FavouriteAddressTableViewCell : UITableViewCell{
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var btnSelect : UIButton!
    @IBOutlet weak var lblBase : UILabel!
    @IBOutlet weak var img : UIImageView!
    
    
}
class FavouriteSelectedPlacesTableViewCell :  UITableViewCell{
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var lblBase : UILabel!
}
