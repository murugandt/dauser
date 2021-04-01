//
//  PushNotificationController.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import Foundation
import Firebase

extension AppDelegate{
    // MARK: - Pushnotification Configuration
    func application(application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        UserDefaults.standard.setValue(fcmToken, forKey: "fcmToken")
    }
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let characterSet = CharacterSet(charactersIn: "<>")
        let nsdataStr = NSData.init(data: deviceToken)
        let token = nsdataStr.description.trimmingCharacters(in: characterSet).replacingOccurrences(of: " ", with: "")
        UserDefaults.standard.set(token, forKey: "deviceToken")
    }
    private func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject :
        AnyObject]) {
        let dict: NSDictionary = userInfo as NSDictionary
        let _: NSString = dict.value(forKeyPath: "aps.alert.body") as! NSString
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error:
        Error) {
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        if !userInfo.isEmpty {
            let dict: NSDictionary = userInfo as NSDictionary
            print(dict)
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if !notification.request.content.userInfo.isEmpty {
            completionHandler(
                UNNotificationPresentationOptions.alert
            )
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if !response.notification.request.content.userInfo.isEmpty {
        }
        completionHandler()
    }
}
