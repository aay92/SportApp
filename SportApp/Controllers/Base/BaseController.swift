//
//  BaseController.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 07.11.2022.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        constraintViews()
        configureAppereance()
    }
}

//MARK: - Create main funcs
@objc extension BaseController {
    
    func setupViews(){}
    func constraintViews(){}
    func configureAppereance(){
        view.backgroundColor = Resources.Color.background
    }
    //    for a job test
    @objc func navBarLeftButtonHandler(){
        print("nav Bar LEFT Button Handler")
    }
    
    //    for a job test
    @objc func navBarRightButtonHandler(){
        print("nav Bar RIGHT Button Handler")
        
    }
}

//MARK: - Create add Nav Buttons
extension BaseController {
    func addNavButton(at position: NavBarPosition, with title: String){
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Color.active, for: .normal)
        button.setTitleColor(Resources.Color.inactive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.helvelticaRegular(with: 16)
        
        switch position {
            
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
//    Смена названия кнопки при нажатии
    func setTitleForNavButton(_ title: String, at position: NavBarPosition){
        
        switch position {
            
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
    }
}
