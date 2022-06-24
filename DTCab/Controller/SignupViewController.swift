//
//  SignupViewController.swift
//  OnboardingExample
//
//  Created by Apple on 02/03/21.
//  Copyright © 2021 Anitaa. All rights reserved.
//

import UIKit

class SignupViewController: BaseViewController, UITextFieldDelegate, CountrySelectionDelegate {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var lblTermsConditions: UILabel!
    @IBOutlet weak var countryCodeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        signupBtn.customDoneBgColor()
//        countryCodeBtn.layer.borderWidth = 1.0
//        countryCodeBtn.layer.borderColor = UIColor.init(hexString: "#D1D1E9").cgColor
        
        headerView.titleLabel.text = "Sign Up"
        headerView.backBtn.addTarget(self, action: #selector(self.btnBack(_:)), for: .touchUpInside)
        
        lblTermsConditions.text = "By clicking 'Sign Up' you agree to our terms and conditions as well as our privacy policy."
        let text = (lblTermsConditions.text)!
        let underlineAttriString = NSMutableAttributedString(string: text)
        let termsRange = (text as NSString).range(of: "terms and conditions")
        let privacyRange = (text as NSString).range(of: "privacy policy")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: termsRange)
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: privacyRange)
        lblTermsConditions.attributedText = underlineAttriString
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapAction.numberOfTapsRequired = 1
        lblTermsConditions.isUserInteractionEnabled = true
        lblTermsConditions.addGestureRecognizer(tapAction)
        
        firstNameTextField.setLeftPadding(value: 8)
        lastNameTextField.setLeftPadding(value: 8)
        emailTextField.setLeftPadding(value: 8)
        phoneNumberTextField.setLeftPadding(value: 8)
        passwordTextField.setLeftPadding(value: 8)
    }
    
    func selectedCountryData(countryCode: String, viewController: UIViewController) {
        countryCodeBtn.setTitle(countryCode, for: .normal)
    }
    
    @IBAction func countryCode(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SelectCountryViewController") as? SelectCountryViewController
        vc!.countrySelectionDelegate = self
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        
        switch scoreText {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
            break
        case lastNameTextField:
            emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            phoneNumberTextField.becomeFirstResponder()
            break
        case phoneNumberTextField:
            scoreText.resignFirstResponder()
            break
        default:
            break
        }
        return true
    }
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
       
       if gesture.didTapAttributedTextInLabel(label: lblTermsConditions, targetText: "terms and conditions") {
            print("Terms of service")
        } else if gesture.didTapAttributedTextInLabel(label: lblTermsConditions, targetText: "privacy policy") {
            print("Privacy policy")
        } else {
            print("Tapped none")
        }
    }
    
    @IBAction func login(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }

@IBAction func signUpBtn(_ sender: Any) {
    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
    self.navigationController?.pushViewController(vc!, animated: true)
}
}
extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, targetText: String) -> Bool {
        guard let attributedString = label.attributedText, let lblText = label.text else { return false }
        let targetRange = (lblText as NSString).range(of: targetText)
        //IMPORTANT label correct font for NSTextStorage needed
        let mutableAttribString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttribString.addAttributes(
            [NSAttributedString.Key.font: label.font ?? UIFont.smallSystemFontSize],
            range: NSRange(location: 0, length: attributedString.length)
        )
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: mutableAttribString)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y:
            locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
