//
//  ProgressController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 07.11.2022.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout Progress"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: Tabs.progress)
        
        addNavButton(at: .left, with: "Export")
        addNavButton(at: .right, with: "Details")
    }
}
