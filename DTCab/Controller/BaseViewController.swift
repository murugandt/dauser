//
//  BaseViewController.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import Foundation
import UIKit
import JTMaterialSpinner

protocol DealRefreshDelegate {
    func refresh()
}
class BaseViewController : UIViewController, LoaderDelegate {
    
    @IBOutlet var tblView: UITableView!
    @IBOutlet weak var imgContentHeight: NSLayoutConstraint!
    @IBOutlet weak var imgContent: UIImageView!
    var spinnerView = JTMaterialSpinner()
    let API = APIRequestManager.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API.loaderDelegate = self
        
        if #available(iOS 13.0, *){
            self.overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Globals.shared.shareViewController = self
    }
    
    @objc func logoff(){
        let fcmToken = UserDefaults.standard.object(forKey: "fcmToken")
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.set("", forKey: "token")
        UserDefaults.standard.setValue(fcmToken, forKey: "fcmToken")
        Globals.shared.fcmToken = fcmToken != nil ? fcmToken as! String : ""
    }
    
    @IBAction func btnBack(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnLogout(_ sender: UIButton){
        self.logoff()
    }
    
    @IBAction func loadDismiss(_ button : Any)
    {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    open func didBeginLoading() {
        spinnerView.frame = CGRect(x: (self.view.frame.size.width-50) / 2.0, y: (self.view.frame.size.height-50) / 2.0, width: 50, height: 50)
        spinnerView.circleLayer.lineWidth = 2.0
        spinnerView.circleLayer.strokeColor = App.AppTheme.Color.cgColor
        spinnerView.animationDuration = 1.5
        self.view.addSubview(spinnerView)
        spinnerView.beginRefreshing()
        self.view.isUserInteractionEnabled = false
    }
    
    open func didEndLoading() {
        spinnerView.endRefreshing()
        self.view.isUserInteractionEnabled = true
    }
    
    func moveSignup(){
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveLogin(){
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func Loader(isStart: Bool){
        if(isStart){
            self.didBeginLoading()
        }else{
            self.didEndLoading()
        }
    }
    
}
