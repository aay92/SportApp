//
//  Resources.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 06.11.2022.
//

import UIKit

enum Resources {
    
    //MARK: - All colors in app
    enum Color {
        static let active = UIColor(hexString: "#427BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#E7ECEE")
        static let darkGray = UIColor(hexString: "#545C77")
        static let textGray = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F8F9F9")
        static let secondary = UIColor(hexString: "#F0F3FF")
        static let subTitleGray = UIColor(hexString: "#9BA4B0")
    }
    
    //MARK: - All strings in app
    enum Strings {
        
        enum Overview {
            static let allWorkouts = "All Workouts"
            static let textNavBar = "Today"
        }
        enum Session {
            static let navBarLeftStart = "Start   "
            static let navBarLeftPause = "Pause"
            static let navBarRightFinish = "Finish"
            static let elapsedTimeLabel = "Elapsed Time"
            static let remainengTime = "Remaineng Time"
            
            static let workoutStats = "Workout Stats"
            static let stepsCounter = "Steps Counter"
            
            static let heartRate = "Heart Rate"
            static let averagePace = "Average Pace"
            static let totalSteps = "Total Steps"
            static let totalDistance = "Total Distance"
        }
        
        enum TabBar {
            static func title(for Tab: Tabs) -> String {
                switch Tab {
                case .overview:
                    return "Overview"
                case .session:
                    return "Session"
                case .progress:
                    return "Progress"
                case .setting:
                    return "Setting"
                }
            }
//            static var overview = "Overview"
//            static var session = "Session"
//            static var progress = "Progress"
//            static var settings = "Setting"
        }
    }
    
    //MARK: - All images in app
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                
                switch tab {
                case .overview:
                    return UIImage(named: "overview")
                case .session:
                    return UIImage(named: "Clock")
                case .progress:
                    return UIImage(named: "Analytics.png")
                case .setting:
                    return UIImage(named: "Gear")
                }
    
            }
        }
        enum ImagesSession {
            static let heartBeatIcon = UIImage(named: "Heart_Beat_Icon")
            static let mapsIcon = UIImage(named: "Maps_Icon")
            static let speedIcon = UIImage(named: "Speed_Icon")
            static let stepsIcon = UIImage(named: "Steps_Icon")
        }
    }
    
    //MARK: - All common files in app
    enum Common {
        static let downArrow = UIImage(named: "DownArrow")
        static let add = UIImage(named: "Add")

    }
    
    //MARK: - All fonts in app
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat)-> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
