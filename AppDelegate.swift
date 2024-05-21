//
//  AppDelegate.swift
//  YUMEATSS
//
//  Created by islombek on 29/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let tabBarVC = UITabBarController()
        
        let register = UINavigationController(rootViewController: RegisterViewController())
        register.tabBarItem.title = ""
    

        let restoVC = UINavigationController(rootViewController: RestoranViewController(presenter: RestoranPresenter()))
        restoVC.tabBarItem.title = "Restoranlar"
        restoVC.tabBarItem.image = UIImage(named: "restoo")
   
        let savatVC = UINavigationController(rootViewController: SavatViewController())
        savatVC.tabBarItem.title = "Savat"
        savatVC.tabBarItem.image = UIImage(named: "savat")
        
        let buyurtmaVC = UINavigationController(rootViewController: BuyurtmaViewController())
        buyurtmaVC.tabBarItem.title = "Buyurtmalar"
        buyurtmaVC.tabBarItem.image = UIImage(named: "buyurtma")
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(named: "profilee")
       
        tabBarVC.viewControllers = [register, restoVC, savatVC, buyurtmaVC, profileVC ]
        tabBarVC.selectedIndex = 0
        tabBarVC.tabBar.barTintColor = UIColor.white
      
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        setApperance()
        setNavApperance()
        return true
    }
    
    private func setApperance() {
        
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .white
        apperance.stackedLayoutAppearance.selected.iconColor = .systemRed
        
        UITabBar.appearance().standardAppearance = apperance
        UITabBar.appearance().scrollEdgeAppearance = apperance
    }
    
    private func setNavApperance() {
        
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .white
        
        UINavigationBar.appearance().standardAppearance = apperance
        UINavigationBar.appearance().scrollEdgeAppearance = apperance
    }
  
}


