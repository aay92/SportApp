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

 class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         configure()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //MARK: - Create tabBar
     private func configure(){
        tabBar.tintColor = Resources.Color.active
        tabBar.barTintColor = Resources.Color.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Color.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true

        let overviewController = OverviewViewController()
        let sessionViewController = SessionController()
        let progressViewController = ProgressController()
        let settingViewController = SettingController()

        let overviewNavigation = NavBarController(rootViewController: overviewController)
        let sessionNavigation = NavBarController(rootViewController: sessionViewController)
        let progressNavigation = NavBarController(rootViewController: progressViewController)
        let settingNavigation = NavBarController(rootViewController: settingViewController)

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
