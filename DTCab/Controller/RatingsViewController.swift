//
//  RatingsViewController.swift
//  OnboardingExample
//
//  Created by Apple on 07/03/21.
//  Copyright © 2021 Anitaa. All rights reserved.
//

import UIKit

class RatingsViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var customView: UIView!
    
    var bottomView = RatingsView()
    var currentRatingVal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.customView.addSubview(bottomView)
//
//        NSLayoutConstraint.activate([
//            bottomView.bottomAnchor.constraint(equalTo: customView.bottomAnchor),
//            bottomView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
//            bottomView.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
//            bottomView.topAnchor.constraint(equalTo: customView.topAnchor),
//        ])
//
//        self.customView.layer.cornerRadius = 20.0
//        self.customView.layer.masksToBounds = true
//
//        //bottomView.commentsView.delegate = self
//
////        bottomView.commentsView.text = "Additional comments"
////        bottomView.commentsView.textColor = UIColor.lightGray
//
////        bottomView.commentsView.layer.borderWidth = 1.0
////        bottomView.commentsView.layer.borderColor = UIColor.lightGray.cgColor
////        bottomView.commentsView.layer.cornerRadius = 5.0
////        bottomView.commentsView.layer.masksToBounds = true
//
//        bottomView.ratingView.didTouchCosmos = didTouchCosmos
//        bottomView.ratingView.didFinishTouchingCosmos = didFinishTouchingCosmos
//        updateRating(requiredRating: nil)
        
    }
    
    private func didTouchCosmos(_ rating: Double) {
        
        currentRatingVal = Int(rating)
        updateRating(requiredRating: rating)
    }
    
    private func didFinishTouchingCosmos(_ rating: Double) {
        
    }
    
    private func updateRating(requiredRating: Double?) {
        var newRatingValue: Double = 0
        
        if let nonEmptyRequiredRating = requiredRating {
            newRatingValue = nonEmptyRequiredRating
            bottomView.ratingView.rating = newRatingValue
        } else {
            
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Additional comments"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func closeBtn(_ sender: Any) {
   
    }

}

