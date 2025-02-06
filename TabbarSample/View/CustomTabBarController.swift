//
//  CustomTabBarController.swift
//  TabbarVCSample
//
//  Created by Ankit Sharma  on 06/02/25.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    private let customButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabs()
        setupTabBarAppearance()
        disableTabs()
        setupCustomButton()
    }
    
    private func setupTabs() {
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let favoritesVC = FavoritesViewController()
        let profileVC = ProfileViewController()
        let settingsVC = SettingsViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        //        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 2)
        favoritesVC.tabBarItem = UITabBarItem(title: "", image: nil, tag: 2)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        viewControllers = [homeVC, searchVC, favoritesVC, profileVC, settingsVC]
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
//        tabBar.barTintColor = UIColor.lightGray
        tabBar.isTranslucent = false
    }
    
    private func disableTabs() {
        tabBar.items?[2].isEnabled = false // Disable Favorites
    }
    
    private func setupCustomButton() {
        customButton.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        customButton.backgroundColor = .systemBlue
        customButton.layer.cornerRadius = 30
        if let image = UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate) {
            customButton.setImage(image, for: .normal)
            customButton.tintColor = .white
            customButton.imageEdgeInsets = .init(top: 15, left: 15, bottom: 15, right: 15)
        }
        customButton.contentMode = .center
        customButton.tintColor = .white
        customButton.layer.shadowColor = UIColor.black.cgColor
        customButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        customButton.layer.shadowOpacity = 0.3
        customButton.layer.shadowRadius = 4
        
        let tabBarHeight = tabBar.frame.height
        customButton.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height - tabBarHeight - 30)
        
        customButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        view.addSubview(customButton)
    }
    
    @objc private func customButtonTapped() {
        let webVC = WebViewController()
        webVC.modalPresentationStyle = .fullScreen
        present(webVC, animated: true, completion: nil)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected tab: \(viewController.title ?? "Unknown")")
    }
}
