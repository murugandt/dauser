//
//  GetStartedViewController.swift
//  DTCab
//
//  Created by Murugan on 20/03/21.
//

import UIKit

class GetStartedViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgContentHeight.constant = Display.typeIsLike == .iphone5 ? (self.imgContent.frame.size.height / 2) : self.imgContent.frame.size.height
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGetStarted(_ sender: Any) {
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "RatingsViewController") as! RatingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
