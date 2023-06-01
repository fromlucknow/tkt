//
//  AppDelegate.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 18/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        UserDefaults.standard.setValue(["token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdG9kby5zdHVkeWxtcy5pblwvdGt0XC9hcGlcL3N0dWRlbnRSZWdpc3RlckFQSSIsImlhdCI6MTY1NTg4ODIyNCwiZXhwIjoxNjU1ODkxODI0LCJuYmYiOjE2NTU4ODgyMjQsImp0aSI6ImtKTHJ0VkpTSGRiTnJ5UjgiLCJzdWIiOjE2NywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.B535aJnj9DD6uBS4u78vL3lO52AkojHvOOhQTjZ5VPg", "user_id":167,"name":"Saifur Rahman","uniqueId":"165588822462b2d9601079a"], forKey: "ProfileData")
//        data =     {
//            id = 167;
//            name = "Saifur Rahman";
//            "user_unique_id" = 165588822462b2d9601079a;
//        };
//        message = "Registration Success";
//        status = 1;
//        success = 1;
//        token = ;
//        let sb = UIStoryboard(name: "Dashboard", bundle: nil)
//        let homeVC = sb.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = homeVC
//            self.window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

