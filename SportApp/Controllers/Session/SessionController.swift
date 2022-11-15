//
//  SessionController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 07.11.2022.
//

import UIKit

class SessionController: BaseController {

    private let timerView = TimerView()
    private let timerDuration = 13.0
    
    override func navBarLeftButtonHandler(){
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.stopTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setTitleForNavButton(timerView.state == .isRunning ? Resources.Strings.Session.navBarLeftPause : Resources.Strings.Session.navBarLeftStart, at: .left)
    }
    
    override func navBarRightButtonHandler(){
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setTitleForNavButton(Resources.Strings.Session.navBarRightFinish, at: .right)
    }
}

extension SessionController {
    
    override func setupViews() {
            super.setupViews()
        view.addViewWithoutTAMIC(timerView)

        }
        override func constraintViews() {
            super.constraintViews()
            NSLayoutConstraint.activate([
                timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  15),
                timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
                timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
                timerView.heightAnchor.constraint(equalToConstant: 400)
                
            
            ])
        }
        
        override func configureAppereance() {
            super.configureAppereance()
            title = "High intensity Cardio"
            navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: Tabs.session)
            
            addNavButton(at: .left, with: Resources.Strings.Session.navBarLeftStart)
            addNavButton(at: .right, with: Resources.Strings.Session.navBarRightFinish)
            
            timerView.configure(with: self.timerDuration, progress: 0.0)
        }
}

