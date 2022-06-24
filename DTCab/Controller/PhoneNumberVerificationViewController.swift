//
//  PhoneNumberVerificationViewController.swift
//  OnboardingExample
//
//  Created by Apple on 03/03/21.
//  Copyright © 2021 Anitaa. All rights reserved.
//

import UIKit

class PhoneNumberVerificationViewController: BaseViewController {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var otpView: DPOTPView!
    @IBOutlet weak var verifyBtnBottomConstraint: NSLayoutConstraint!
    
    var keyboardHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        titleLabel.text = " Check your SMS messages. We have sent you the PIN at 000009908998"
        headerView.backBtn.addTarget(self, action: #selector(self.btnBack(_:)), for: .touchUpInside)
        let text = (titleLabel.text)!
        let underlineAttriString = NSMutableAttributedString(string: text)
        let numRange = (text as NSString).range(of: "000009908998")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: numRange)
        titleLabel.attributedText = underlineAttriString
        
        otpView.dpOTPViewDelegate = self
        headerView.titleLabel.text = "Verify phone number"
        
        self.hideKeyboardWhenTappedAround()
        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow(_:)),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillHide(_:)),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil
//        )
    }
    
    @IBAction func btnVerify(_ sender: Any) {
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            verifyBtnBottomConstraint.constant = keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        verifyBtnBottomConstraint.constant = 20.0
    }
}

extension PhoneNumberVerificationViewController : DPOTPViewDelegate {
    func dpOTPViewBecomeFirstResponder() {
        
    }
    
    func dpOTPViewResignFirstResponder() {
        
    }
    
    func dpOTPViewAddText(_ text: String, at position: Int) {
        print("addText:- " + text + " at:- \(position)" )
    }
    
    func dpOTPViewRemoveText(_ text: String, at position: Int) {
        print("removeText:- " + text + " at:- \(position)" )
    }
    
    func dpOTPViewChangePositionAt(_ position: Int) {
        print("at:-\(position)")
    }
}

extension PhoneNumberVerificationViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(PhoneNumberVerificationViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
