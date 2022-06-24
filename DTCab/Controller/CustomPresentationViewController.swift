//
//  CustomPresentationViewController.swift
//  DTCab
//
//  Created by Sulaiman on 17/06/22.
//

import UIKit

class CustomPresentationViewController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
            guard let bounds = containerView?.bounds else { return .zero }
            return CGRect(x: 0, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2)
        }
}
