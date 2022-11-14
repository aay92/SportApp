//
//  Date + Ext.swift
//  SportApp
//
//  Created by Aleksey Alyonin on 09.11.2022.
//

import Foundation

extension Date {
    static var calendar: Calendar {
        //  Григорианский календарь
        var calendar = Calendar(identifier: .gregorian)
        //  Начало недели со второго дня(Понедельник)
        calendar.firstWeekday = 2
        return calendar
    }
    
    var startOfWeek: Date {
        let component = Date.calendar.dateComponents([.yearForWeekOfYear,.weekOfYear], from: self)
        guard let firstDay = Date.calendar.date(from: component) else { return self }
        return Date.calendar.date(byAdding: .day, value: 0, to: firstDay) ?? self
    }
    
    func agoForward(to days: Int) -> Date {
        return Date.calendar.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    func stripTime() -> Date {
        let components = Date.calendar.dateComponents([.year, .month, .day], from: self)
        return Date.calendar.date(from: components) ?? self
    }
}
