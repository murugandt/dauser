//
//  LoginViewController.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var errorMsgBgView: UIView!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var connectUsingPhoneNumberView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var forgotPwdTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorMsgBgViewHeight: NSLayoutConstraint!
    @IBOutlet weak var connectUsingPhoneNumberViewBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView(){
        LoginVM.sharedInstance.loginValidation = {(msg ,success)  in
            //self.popUpshow(title: appName, subTitle: msg, theme: PopupError)
            if (success){
                LoginVM.sharedInstance.loginRequestClick(userName: self.emailTextField.text!, password: self.passwordTextField.text!)
                self.errorMsgBgView.isHidden = true
                self.errorMsgBgViewHeight.constant = 03
                print("success")
                
                
            }
            self.lblError.text = msg
        }
        
        LoginVM.sharedInstance.loginSuccess = {(msg)  in
           
        }
        
        headerView.titleLabel.text = "Log in"
        headerView.backBtn.addTarget(self, action: #selector(self.btnBack(_:)), for: .touchUpInside)
        errorMsgBgView.layer.borderWidth = 1.0
        errorMsgBgView.layer.borderColor = UIColor.red.cgColor
        connectUsingPhoneNumberView.layer.borderWidth = 1.0
        connectUsingPhoneNumberView.layer.borderColor = UIColor.red.cgColor
        self.errorMsgBgViewHeight.constant = 0
        self.connectUsingPhoneNumberViewBottom.constant = Display.typeIsLike == .iphone5 ? 10 : 44
        emailTextField.setLeftPadding(value: 8)
        passwordTextField.setLeftPadding(value: 8)
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        
        switch scoreText {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            scoreText.resignFirstResponder()
            break
        default:
            break
        }
        return true
    }
    
    @IBAction func signUp(_ sender: Any) {
        self.moveSignup()
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
  
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        errorMsgBgView.isHidden = false
        self.errorMsgBgViewHeight.constant = 50
        self.view.layoutIfNeeded()
        
//        LoginVM.sharedInstance.loginRequestClick(userName: self.emailTextField?.text, password: self.passwordTextField?.text)
//        LoginVM.sharedInstance.userValidate(username: self.emailTextField!, password: self.passwordTextField!)
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "PhoneNumberVerificationViewController")  as! PhoneNumberVerificationViewController
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
    @IBAction func loginWithFb(_ sender: Any) {
  
    }
    
    @IBAction func loginUsingPhoneNumber(_ sender: Any) {
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "PhoneNumberInputViewController") as! PhoneNumberInputViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
