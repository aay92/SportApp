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
    
    override func setupViews(){
        super.setupViews()
        addViewWithoutTAMIC(stackView)
    }
    
   override func constraintViews(){
       super.constraintViews()
       NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: topAnchor),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
       ])
    }
    
    override func configureAppearance(){
        super.configureAppearance()
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekDays = Date.calendar.shortStandaloneWeekdaySymbols
        // Remove Sunday in week, for begin week with Monday
        if Date.calendar.firstWeekday == 2 {
            let sunday = weekDays.remove(at: 0)
            weekDays.append(sunday)
        }
        
        weekDays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configure(with: index, and: name)
            print("\(index)")
            print("\(name)")

            stackView.addArrangedSubview(view)
        }
    }
}


