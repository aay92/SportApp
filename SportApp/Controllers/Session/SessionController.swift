//
//  SessionController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 07.11.2022.
//

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "High intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavButton(at: .left, with: "Pause")
        addNavButton(at: .right, with: "Finish")


    }
}

