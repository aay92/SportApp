//
//  WeekView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 09.11.2022.
//

import UIKit

final class WeekView: BaseView {
    
    private let calendar = Calendar.current
    private var stackView = UIStackView()
    
    
}

extension WeekView {
    
    override func addViews(){
    super.addViews()
        addViewWithoutTAMIC(stackView)
    }
    
   override func layoutViews(){
       super.layoutViews()
       NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: topAnchor),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
       ])
    }
    
    override func configure(){
        super.configure()
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekDays = calendar.shortStandaloneWeekdaySymbols
        if calendar.firstWeekday == 1 {
            let sunday = weekDays.remove(at: 0)
            weekDays.append(sunday)
        }
        weekDays.enumerated().forEach { index, name in
            
            let view = WeekDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
}


