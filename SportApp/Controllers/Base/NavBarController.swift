//
//  NavBarController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 07.11.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Color.darkGray,
            .font: Resources.Fonts.helvelticaRegular(with: 16)]
        
        navigationBar.addBottomBorder(with: Resources.Color.separator, height: 1)
    }
}
