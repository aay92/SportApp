//
//  SessionController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 07.11.2022.
//

import UIKit

class SessionController: BaseController {

    private let timerView: BaseInfoView = {
        let view = BaseInfoView(with: "TEST")
        return view
    }()
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
                timerView.heightAnchor.constraint(equalToConstant: 300)
                
            
            ])
        }
        
        override func configureAppereance() {
            super.configureAppereance()
            title = "High intensity Cardio"
            navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: Tabs.session)
            
            addNavButton(at: .left, with: "Pause")
            addNavButton(at: .right, with: "Finish")
        }
}

