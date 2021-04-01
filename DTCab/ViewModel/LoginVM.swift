//
//  LoginVM.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import Foundation

class LoginVM: NSObject {
    
    static let sharedInstance = LoginVM()
    var deviceDetails: [String:Any]?
    
    var loginValidation: ((String) -> Void)?
    var loginSuccess: (() -> Void)?
    
    // MARK: - Init
    override init() {
        super.init()
        self.getDeviceDetails()
    }
    
    func getDeviceDetails(){
        deviceDetails = ["platform": DeviceManager.platform, "deviceId":DeviceManager.deviceId, "os":DeviceManager.os, "version":DeviceManager.version, "latitude":"", "longitude":"", "model":DeviceManager.deviceModel, "deviceToken":Globals.shared.fcmToken]
    }
    
    func loginRequestClick(userName: String?, password: String?) {
        guard userName != "" else {
            self.loginValidation?(EmailError)
            return
        }
        guard (password != "" && password?.count ?? 0 >= 4) else {
            self.loginValidation?(PasswordError)
            return
        }
        let params = ["mobile":userName ?? "","password":password ?? "","device_details":self.deviceDetails!,"role_id":"1"] as [String : Any]
        self.loginRequest(param: params)
    }
    
    func loginRequest(param: [String : Any]){
        APIRequestManager.sharedInstance.login(param:param as Dictionary<String, AnyObject>) { (success, loginModel) in
            if success
            {
                guard loginModel?.error?.code == 0 else{
                    return
                }
                self.loginSuccess?()
            }
        }
    }
}
