//
//  OverviewViewController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 06.11.2022.
//

import UIKit

class OverviewViewController: BaseController {
    
    private let navBar = OverviewNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OverviewViewController {
    override func addViews() {
        super.addViews()
        view.addViewWithoutTAMIC(navBar)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true
    }
}

