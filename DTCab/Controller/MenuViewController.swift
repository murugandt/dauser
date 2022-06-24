//
//  MenuViewController.swift
//  DTCab
//
//  Created by Sulaiman on 08/06/22.
//

import UIKit


class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var menuTableView: UITableView!
    var menuList = ["My rides","Promotion","My favorites","My payment","Notification","Support"]
    var menuIcon = [ "history","promotion","fav","payment","bell","support"]
    override func viewDidLoad() {
        super.viewDidLoad()
      
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
            return 1
        }else{
            return 5
        }
  
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return 140
        }
        else {
            return 66
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = menuTableView.dequeueReusableCell(withIdentifier: "SectionheaderTableViewCell", for: indexPath) as! SectionheaderTableViewCell
            cell.btnEdit.setTitle("", for: .normal)
            
           
           
            return cell
        }else{
            let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
            cell.lblTitle.text = menuList[indexPath.row]
            cell.imgIcon.image = UIImage.init(named: menuIcon[indexPath.row])
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section == 0){
            let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "UpdateInformationViewController") as! UpdateInformationViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(indexPath.section == 1){
            if(indexPath.row == 0){
                
                let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "MyRidesViewController") as! MyRidesViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        
       
            else if(indexPath.row == 1){
                
                let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "PromotionsViewController") as! PromotionsViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        else if(indexPath.row == 2 ){
            
            let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "MyFavouriteViewController") as! MyFavouriteViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if(indexPath.row == 3){
            
            let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "MyRidesViewController") as! MyRidesViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if(indexPath.row == 4){
            
            let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "MyRidesViewController") as! MyRidesViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            
            let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "MyRidesViewController") as! MyRidesViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
}
}
class SectionheaderTableViewCell : UITableViewCell{
    @IBOutlet weak var btnEdit : UIButton!

    
}
class MenuTableViewCell :UITableViewCell{
    @IBOutlet weak var imgIcon : UIImageView!
    @IBOutlet weak var lblTitle : UILabel!
}
