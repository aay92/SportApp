//
//  WeekDayView.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 09.11.2022.
//

import UIKit

extension WeekView{
    final class WeekDayView: BaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        //        Performance of the current day
        func configure(with index: Int, and name: String) {
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            let isToday = currentDay.stripTime() == Date().stripTime()
            //            Color date and text in different condition
            backgroundColor = isToday ? Resources.Color.active : Resources.Color.background
            nameLabel.textColor = isToday ? .white : Resources.Color.inactive
            dateLabel.textColor = isToday ? .white : Resources.Color.inactive
            
            nameLabel.text = name.uppercased()
            dateLabel.text = "\(day)"
        }
    }
}

extension WeekView.WeekDayView {
    
    override func addViews() {
        super.addViews()
        addViewWithoutTAMIC(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    override func configure() {
        super.configure()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = Resources.Fonts.helvelticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resources.Fonts.helvelticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}

