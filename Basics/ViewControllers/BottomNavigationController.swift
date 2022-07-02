//
//  BottomNavigationController.swift
//  Unburned
//
//  Created by RossoVanyard on 01.07.22.
//

import Foundation
import UIKit



class BottomNavigationController: UITabBarController, UITabBarControllerDelegate {
   
    override func viewDidLoad() {
        self.delegate = self
        //create the two VCs presented in the TabBar with a custom method
        viewControllers = [createViewController(title: "WorkoutIcon"), createViewController(title: "ProfileIcon")] as? [UIViewController]
        self.tabBar.tintColor = UIColor(red: 54/255, green: 167/255, blue: 223/255, alpha: 1.0)
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
        self.selectedIndex = 0
        self.tabBar.backgroundImage = UIImage(named: "")
    }
    

    private func createViewController(title: String) -> UINavigationController?{
        var viewController: BaseUIViewController?
        switch  title {
        case "WorkoutIcon":
            viewController = HomeScreenViewController(viewModel: HomeScreenViewModel(model: HomeScreenModel()))
        case "ProfileIcon":
            viewController = ShoppingCartViewController(viewModel: ShoppingCartViewModel(model: ShoppingCartModel()))
        default:
            break
        }
      
        if let viewController = viewController{
            let navController = UINavigationController(rootViewController: viewController)
            navController.tabBarItem.image = UIImage(named: title)
            navController.navigationBar.isTranslucent = false
            navController.tabBarItem.imageInsets = UIEdgeInsets(top: -15, left: 0, bottom: -15, right: 0)
            navController.setNavigationBarHidden(true, animated: false)
            if title == "WorkoutIcon"{
                navController.tabBarItem.title = "Workouts"
            } else {
                navController.tabBarItem.title = "Profil"
            }
            return navController
        } else {
            return nil
        }
    }
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
  
    
}
