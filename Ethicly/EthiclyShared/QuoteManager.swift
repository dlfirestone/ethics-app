//
//  QuoteManager.swift
//  EthiclyShared
//
//  Created by DM on 9/17/26.
//

import Foundation

public final class QuoteManager {
    public static let shared = QuoteManager()
    private let userDefaults: UserDefaults
    private let firstLaunchKey = "firstLaunchDate"
    private let calendar: Calendar

    public init(appGroup: String = "group.com.deborah.Ethicly", calendar: Calendar = .current) {
        self.calendar = calendar
        self.userDefaults = UserDefaults(suiteName: appGroup) ?? .standard
    }

    public func recordFirstLaunchIfNeeded(now: Date = Date()) {
        if userDefaults.object(forKey: firstLaunchKey) == nil {
            let startOfDay = calendar.startOfDay(for: now)
            userDefaults.set(startOfDay, forKey: firstLaunchKey)
        }
    }

    public func firstLaunchDate() -> Date? {
        return userDefaults.object(forKey: firstLaunchKey) as? Date
    }

    public func daysElapsed(since reference: Date? = nil, now: Date = Date()) -> Int {
        guard let ref = reference ?? firstLaunchDate() else { return 0 }
        let startRef = calendar.startOfDay(for: ref)
        let startNow = calendar.startOfDay(for: now)
        let comps = calendar.dateComponents([.day], from: startRef, to: startNow)
        return max(0, comps.day ?? 0)
    }

    public func currentQuote(for date: Date = Date()) -> Quote {
        recordFirstLaunchIfNeeded(now: date)
        let days = daysElapsed(since: nil, now: date)
        let index = quoteArray.isEmpty ? 0 : days % quoteArray.count
        return quoteArray[index]
    }

    public func nextMidnight(after date: Date = Date()) -> Date? {
        let start = calendar.startOfDay(for: date)
        return calendar.date(byAdding: .day, value: 1, to: start)
    }

    // Testing helpers
    public func setFirstLaunchDate(_ date: Date?) {
        if let d = date {
            userDefaults.set(calendar.startOfDay(for: d), forKey: firstLaunchKey)
        } else {
            userDefaults.removeObject(forKey: firstLaunchKey)
        }
    }
}
