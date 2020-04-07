//
//  DateExtension.swift
//  xcalendar
//
//  Created by Jung JaeYeol on 2020/04/06.
//  Copyright © 2020 Jung JaeYeol. All rights reserved.
//

import Foundation

extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }

    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}
