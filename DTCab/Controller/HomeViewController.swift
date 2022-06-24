//
//  HomeViewController.swift
//  DTCab
//
//  Created by Sulaiman on 06/06/22.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
    @IBOutlet weak  var customView : HomeSearchView!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak  var btnOpenMenu : UIButton!
    @IBOutlet weak  var imgView  : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      makeCorners()
        customView.btnOpenSearchView.setTitle("", for: .normal)
        btnOpenMenu.addTarget(self, action: #selector(btnMenu(_sender: )) , for: .touchUpInside)
        btnOpenMenu.setTitle("", for: .normal)
        customView.btnOpenSearchView.addTarget(self, action: #selector(btnOpen(_sender: )), for: .touchUpInside)
       
 
    }
    
    func makeCorners(){
        customView.layer.cornerRadius = 20
        customView.clipsToBounds = true
        customView.layer.masksToBounds = true
        imgView.layer.cornerRadius = imgView.frame.height/2
        headerView.clipsToBounds = true
        headerView.layer.masksToBounds = false
        
    }
    @objc func btnOpen(_sender : UIButton){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchDestinationViewController") as! SearchDestinationViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
  @objc func btnMenu(_sender : UIButton){
      let vc = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
      let menu = SideMenuNavigationController(rootViewController: vc)
      menu.leftSide = true
      menu.menuWidth = 300
      menu.presentationStyle = .menuSlideIn
      
      present(menu, animated: true, completion: nil)
      
      
    }
}
