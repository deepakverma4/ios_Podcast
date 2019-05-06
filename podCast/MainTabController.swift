//
//  MainTabController.swift
//  podCast
//
//  Created by prabhat pankaj on 15/03/19.
//  Copyright © 2019 learnix. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .purple
        
        UINavigationBar.appearance().prefersLargeTitles = true

        viewControllers = [
            generateViewController(with: PodcastsSearchController(), title: "Search", image: UIImage(named: "search")!),
            generateViewController(with: ViewController(), title: "Favourite", image: UIImage(named: "favorite")!),
            generateViewController(with: ViewController(), title: "Downloads", image: UIImage(named: "download")!)
        ]
    }
    
    //MARK:- generateViewController
    
    fileprivate func generateViewController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navController.tabBarItem.image = image
        return navController
    }

}
