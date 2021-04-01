//
//  AppDelegate.swift
//  DTCab
//
//  Created by Murugan on 08/03/21.
//

import UIKit
import CoreData
import Firebase
import IQKeyboardManagerSwift
import GooglePlaces
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.basicSetup(application: application)
        return true
    }
    
    func basicSetup(application: UIApplication){
        self.setRootVC(isHome: false)
        //self.firbaseConfiguration()
        //self.notificationConfiguration(application: application)
        self.keyboardConfiguration()
    }
    
    func firbaseConfiguration(){
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        GMSServices.provideAPIKey(googleAddressApiKey)
        GMSPlacesClient.provideAPIKey(googleAddressApiKey)
    }
    
    func notificationConfiguration(application: UIApplication){
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        if(UserDefaults.standard.object(forKey: "fcmToken") != nil){
            Globals.shared.fcmToken = UserDefaults.standard.object(forKey: "fcmToken") as! String
        }
        application.registerForRemoteNotifications()
    }
    
    func keyboardConfiguration(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true;
        IQKeyboardManager.shared.toolbarBarTintColor = App.AppTheme.Color
        IQKeyboardManager.shared.toolbarTintColor = .white
        IQKeyboardManager.shared.placeholderColor = .lightGray
    }
    
    func setRootVC(isHome: Bool){
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        if(isHome){
            let rootViewController:UIViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            navigationController.viewControllers = [rootViewController]
        }else{
            let rootViewController:UIViewController = storyboard.instantiateViewController(withIdentifier: "Home_OnboardingController") as! Home_OnboardingController
            navigationController.viewControllers = [rootViewController]
        }
        self.window?.rootViewController = navigationController
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Base_MVVM")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
