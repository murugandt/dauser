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
    
    var ratingsView = RatingsView()
    var currentRatingVal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingsView.translatesAutoresizingMaskIntoConstraints = false
        self.customView.addSubview(ratingsView)
        
        NSLayoutConstraint.activate([
            ratingsView.bottomAnchor.constraint(equalTo: customView.bottomAnchor),
            ratingsView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            ratingsView.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
            ratingsView.topAnchor.constraint(equalTo: customView.topAnchor),
        ])
        
        self.customView.layer.cornerRadius = 20.0
        self.customView.layer.masksToBounds = true
        
        ratingsView.commentsView.delegate = self

        ratingsView.commentsView.text = "Additional comments"
        ratingsView.commentsView.textColor = UIColor.lightGray

        ratingsView.commentsView.layer.borderWidth = 0.5
        ratingsView.commentsView.layer.borderColor = UIColor.lightGray.cgColor
        ratingsView.commentsView.layer.cornerRadius = 5.0
        ratingsView.commentsView.layer.masksToBounds = true
    
        ratingsView.ratingView.didTouchCosmos = didTouchCosmos
        ratingsView.ratingView.didFinishTouchingCosmos = didFinishTouchingCosmos
        updateRating(requiredRating: nil)
        
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
            ratingsView.ratingView.rating = newRatingValue
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

