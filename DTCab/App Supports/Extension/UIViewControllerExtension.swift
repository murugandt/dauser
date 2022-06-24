//
//  UIViewControllerExtension.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import UIKit
//import SwiftMessages

extension UIViewController{
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        });
    }
}

//extension UIViewController{
//    func popUpshow(title: String, subTitle: String, theme: String) {
//        let view: MessageView
//        view = try! SwiftMessages.viewFromNib()
//        view.configureContent(title: title, body: subTitle)
//        view.button?.isHidden = true
//            view.configureDropShadow()
//            let iconStyle: IconStyle = .default
//            switch theme {
//            case "info":
//                view.configureTheme(.info, iconStyle: iconStyle)
//                view.accessibilityPrefix = "info"
//            case PopupSuccess:
//                view.configureTheme(.success, iconStyle: iconStyle)
//                view.accessibilityPrefix = PopupSuccess
//            case PopupWarning:
//                view.configureTheme(.warning, iconStyle: iconStyle)
//                view.accessibilityPrefix = PopupWarning
//            case PopupError:
//                view.configureTheme(.error, iconStyle: iconStyle)
//                view.accessibilityPrefix = PopupError
//            default:
//                let iconText = ["🐸", "🐷", "🐬", "🐠", "🐍", "🐹", "🐼"].randomElement()
//                view.configureTheme(backgroundColor: UIColor.purple, foregroundColor: UIColor.white, iconImage: nil, iconText: iconText)
//                view.button?.setImage(Icon.errorSubtle.image, for: .normal)
//                view.button?.setTitle(nil, for: .normal)
//                view.button?.backgroundColor = UIColor.clear
//                view.button?.tintColor = UIColor.green.withAlphaComponent(0.7)
//            }
//            SwiftMessages.show(view: view)
//        }
//}
