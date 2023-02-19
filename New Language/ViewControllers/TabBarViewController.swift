//
//  TabBarViewController.swift
//  New Language
//
//  Created by Kirill Guselnikov on 07.01.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = UINavigationController(rootViewController: MainViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        mainVC.navigationBar.prefersLargeTitles = true
        profileVC.navigationBar.prefersLargeTitles = true
        
        mainVC.title = "New Langauge"
        profileVC.title = "Profile"
        
        tabBar.backgroundColor = UIColor(red: 218/255, green: 179/255, blue: 116/255, alpha: 0.45)
        tabBar.tintColor = UIColor(red: 80/255, green: 50/255, blue: 27/255, alpha: 1)
        
        setViewControllers([mainVC, profileVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        let images = ["character.book.closed.fill", "person.circle.fill"]
        
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
    }
}
