//
//  Protocols.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import Foundation
import UIKit

protocol ImageUpdateDelegate {
    func updateImage(isSuccess: Bool, imageUrl: String)
}

protocol RefreshTokenDelegate {
    func reloadPage()
}

protocol PopupCalledDelegate {
    func openPopup()
}

protocol LoaderDelegate {
    func Loader(isStart: Bool)
}

protocol ImageUploadDelegate {
    func imgUploadComplete(imgStr: String)
}

protocol ImageUploadProgressDelegate {
    func imageUploadProgress(isStart: Bool, count: CGFloat)
}
