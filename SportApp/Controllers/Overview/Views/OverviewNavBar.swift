//
//  OverviewNavBar.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 09.11.2022.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLable = UILabel()
    
    private let allWorkoutsButton: WAButton = {
        let button = WAButton(with: .secondary)
        button.setTitle(Resources.Strings.Overview.allWorkouts)
        return button
    }()
    
    private let addButton = UIButton()
    
    private let weekView = WeekView()
    
    func addAllWoroutsAction(_ action: Selector, with target: Any?){
        allWorkoutsButton.addTarget(target,
                                    action: action,
                                    for: .touchUpInside)
    }
    
    func addAditingAction(_ action: Selector, with target: Any?){
        allWorkoutsButton.addTarget(target,
                                    action: action,
                                    for: .touchUpInside)
    }

}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        addViewWithoutTAMIC(titleLable)
        addViewWithoutTAMIC(allWorkoutsButton)
        addViewWithoutTAMIC(addButton)
        addViewWithoutTAMIC(weekView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resources.Color.separator, height: 1)

    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLable.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLable.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant:  15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white
        
        titleLable.text = Resources.Strings.Overview.textNavBar
        titleLable.textColor = Resources.Color.textGray
        titleLable.font = Resources.Fonts.helvelticaRegular(with: 22)
                
        addButton.setImage(Resources.Common.add, for: .normal)
        
        
    }
}
