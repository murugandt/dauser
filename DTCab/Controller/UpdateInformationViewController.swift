//
//  UpdateInformationViewController.swift
//  OnboardingExample
//
//  Created by Apple on 06/03/21.
//  Copyright © 2021 Anitaa. All rights reserved.
//

import UIKit

class UpdateInformationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var firstName: AkiraTextField!
    @IBOutlet weak var lastName: AkiraTextField!
    @IBOutlet weak var password: AkiraTextField!
    @IBOutlet weak var email: AkiraTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        headerView.titleLabel.text = "Update information"
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        
        switch scoreText {
        case firstName:
            lastName.becomeFirstResponder()
            break
        case lastName:
            email.becomeFirstResponder()
            break
        case email:
            password.becomeFirstResponder()
            break
        case password:
            scoreText.resignFirstResponder()
            break
        default:
            break
        }
        return true
    }
}
