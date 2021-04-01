//
//  PhoneNumberInputViewController.swift
//  OnboardingExample
//
//  Created by Apple on 03/03/21.
//  Copyright © 2021 Anitaa. All rights reserved.
//

import UIKit

class PhoneNumberInputViewController: BaseViewController, UITextFieldDelegate, CountrySelectionDelegate {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var countryCodeBtn: UIButton!
    @IBOutlet weak var continueBtnBottomConstraint: NSLayoutConstraint!
    
    var keyboardHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        headerView.titleLabel.text = "What is your phone number?"
        headerView.backBtn.addTarget(self, action: #selector(self.btnBack(_:)), for: .touchUpInside)
        countryCodeBtn.layer.borderWidth = 1.0
        countryCodeBtn.layer.borderColor = UIColor.init(hexString: "#D1D1E9").cgColor

        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            continueBtnBottomConstraint.constant = keyboardHeight + 10.0
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        continueBtnBottomConstraint.constant = 20.0
    }
    
    func selectedCountryData(countryCode: String, viewController: UIViewController) {
        countryCodeBtn.setTitle(countryCode, for: .normal)
    }
    
    @IBAction func countryCode(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SelectCountryViewController") as? SelectCountryViewController
        vc!.countrySelectionDelegate = self
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "PhoneNumberVerificationViewController") as! PhoneNumberVerificationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PhoneNumberInputViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(PhoneNumberInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
