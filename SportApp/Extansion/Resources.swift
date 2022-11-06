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
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "overview"
            static var session = "Clock"
            static var progress = "Analytics.png"
            static var settings = "Gear"
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
}
