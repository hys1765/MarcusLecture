//
//  AppDelegate.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/08/30.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var nvc:UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        nvc = UINavigationController(rootViewController: getSplashViewController())
        
        nvc?.isNavigationBarHidden = true;
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        
        return true
    }
    
    //추가됨
    func getSplashViewController()->UIViewController {
        let storyboard = UIStoryboard(name: "SplashStoryBoard", bundle: nil)
        let destinationVC:UIViewController = storyboard.instantiateInitialViewController()! as UIViewController
        return destinationVC
    }
    
    func getHomeViewController() -> UIViewController{
        let storyboard = UIStoryboard(name: "MainStoryBoard", bundle: nil)
        let destinationVC:UIViewController = storyboard.instantiateInitialViewController()! as UIViewController//
        return destinationVC
    }
    
    func switchMain(){
        
        window = UIWindow(frame:UIScreen.main.bounds)
        
        nvc = UINavigationController(rootViewController: getHomeViewController())
        nvc?.isNavigationBarHidden = true;
        window?.rootViewController = nvc;
        //        window?.makeKeyAndVisible()
        
        window?.makeKeyAndVisible()
        
        
    }
    
    


    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "marcuslecture")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
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

