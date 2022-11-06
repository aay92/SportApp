//
//  TabBarController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 06.11.2022.
//
import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case setting
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        tabBar.tintColor = Resources.Color.active
        tabBar.barTintColor = Resources.Color.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Color.separator.cgColor
        tabBar.layer.borderWidth = 2
        tabBar.layer.masksToBounds = true
        
        let overviewViewController = UIViewController()
        let sessionViewController = UIViewController()
        let progressViewController = UIViewController()
        let settingViewController = UIViewController()
        
        let overviewNavigation = UINavigationController(rootViewController: overviewViewController)
        let sessionNavigation = UINavigationController(rootViewController: sessionViewController)
        let progressNavigation = UINavigationController(rootViewController: progressViewController)
        let settingNavigation = UINavigationController(rootViewController: settingViewController)
        
        overviewNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.overview,
                                                        image: Resources.Images.TabBar.overview,
                                                         tag: Tabs.overview.rawValue)
        
        sessionNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.session,
                                                    image: Resources.Images.TabBar.session,
                                                         tag: Tabs.session.rawValue)
        
        progressNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.progress,
                                                        image: Resources.Images.TabBar.progress,
                                                         tag: Tabs.progress.rawValue)
        
        settingNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings,
                                                        image: Resources.Images.TabBar.settings,
                                                         tag: Tabs.setting.rawValue)
        
        setViewControllers([overviewNavigation,
                            sessionNavigation,
                            progressNavigation,
                            settingNavigation], animated: false)
    }
}
