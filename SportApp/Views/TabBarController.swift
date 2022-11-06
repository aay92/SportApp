//
//  TabBarController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 06.11.2022.
//
import UIKit

enum Tabs: Int {
  case overview, session, progress, setting
}

final class TabBarController: UITabBarController {
    
    private func configure(){
        tabBar.tintColor = Resources.Color.active
        tabBar.barTintColor = Resources.Color.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Color.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
    }
}
