//
//  Resources.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 06.11.2022.
//

import UIKit

enum Resources {
    enum Color {
        static var active = UIColor(hexString: "#427BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        static var separator = UIColor(hexString: "#E7ECEE")
        static var darkGray = UIColor(hexString: "#545C77")
        static var background = UIColor(hexString: "#F8F9F9")
        static var secondary = UIColor(hexString: "#F0F3FF")
    }
    
    enum Strings {
        enum Overview {
            static var allWorkouts = "All Workouts"
        }
        
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Setting"
        }
    }
    
    enum Images {
        enum TabBar {
            static var overview = UIImage(named: "overview")
            static var session = UIImage(named: "Clock")
            static var progress = UIImage(named: "Analytics.png")
            static var settings = UIImage(named: "Gear")
        }
    }
    
    enum Common {
        static var downArrow = UIImage(named: "DownArrow")
    }
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat)-> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
