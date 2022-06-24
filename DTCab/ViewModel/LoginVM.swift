//
//  LoginVM.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import Foundation
import UIKit

class LoginVM: NSObject {
    
    static let sharedInstance = LoginVM()
    var deviceDetails: [String:Any]?
    
    var loginValidation: ((String, Bool) -> Void)?
    var loginSuccess: ((String) -> Void)?
    
    // MARK: - Init
    override init() {
        super.init()
        self.getDeviceDetails()
    }
    
    func getDeviceDetails(){
        deviceDetails = ["platform": DeviceManager.platform, "deviceId":DeviceManager.deviceId, "os":DeviceManager.os, "version":DeviceManager.version, "latitude":"", "longitude":"", "model":DeviceManager.deviceModel, "deviceToken":Globals.shared.fcmToken]
    }
    
    func userValidate(username :UITextField , password : UITextField){
        var isValidate: Bool = true
        if (username.text) == "" {
            Globals.shared.message = UserNameError
            isValidate = false
            print(UserNameError)
        }
        else if(username.text!.contains("@")){
            if(!(Globals.shared.isValidEmail(emailStr: username.text!))){
                Globals.shared.message = ValidMailId
                isValidate = false
                print(ValidMailId)
            }
        }
        else if (password.text) == "" {
            Globals.shared.message = PasswordError
            isValidate = false
            print(PasswordError)
        }
        else if (password.text!.count < 6){
            Globals.shared.message = "password must be 6 digits"
            isValidate = false
            print("password must be 6 digits")
        }
        self.loginValidation?(Globals.shared.message, isValidate)
    }
    
    
    func loginRequestClick(userName: String?, password: String?) {
       // guard userName != "" else {
    
        let params = ["mobile":userName ?? "","password":password ?? "","device_details":self.deviceDetails!,"role_id":"1"] as [String : Any]
        self.loginRequest(param: params)
    }
    
    func loginRequest(param: [String : Any]){
        APIRequestManager.sharedInstance.login(param:param as Dictionary<String, AnyObject>) { (success, loginModel) in
            if success
            {
               // guard loginModel?.error?.code == 0 else{
               //     return
               // }
                self.loginSuccess?(loginModel?.message ?? "")
            }
        }
    }
}
