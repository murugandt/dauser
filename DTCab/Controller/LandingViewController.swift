//
//  LandingViewController.swift
//  DTCab
//
//  Created by Murugan on 19/03/21.
//

import UIKit

class LandingViewController: BaseViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgContentHeight.constant = Display.typeIsLike == .iphone5 ? (self.imgContent.frame.size.height - 80) : self.imgContent.frame.size.height

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSubmit(_ sender: UIButton) {
        if(sender.tag == 1){
            self.moveSignup()
        }else{
            self.moveLogin()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
