//
//  UserDefaults+App.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 31/03/2024.
//

import Foundation

enum UserDefaultKeys: String {
    case name
    case birthDate
    case age
    case sex
    case inst
}

extension UserDefaults {

    func removeObject(forKey key: UserDefaultKeys) {
        removeObject(forKey: key.rawValue)
    }

    subscript<T>(key: UserDefaultKeys) -> T? {
        get { object(forKey: key.rawValue) as? T }
        set { set(newValue, forKey: key.rawValue) }
    }
}
