//
//  UserDefaults+App.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 31/03/2024.
//

import Foundation

enum UserDefaultKeys: String {
    case profilesArray
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
        get {
            if key == .profilesArray,
               let data = array(forKey: key.rawValue) as? [Data] {
                let decoder = JSONDecoder()
                var arrayOfProfiles = [ProfileModelProtocol]()
                data.forEach { profile in
                    if let decoded = try? decoder.decode(ProfileModel.self, from: profile) {
                        arrayOfProfiles.append(decoded)
                    }
                }

                return arrayOfProfiles as? T
            } else {
                return object(forKey: key.rawValue) as? T
            }
        }
        set {
            // save encoded array of ProfileModelProtocol
            if let arrayOfProfiles = newValue as? [ProfileModelProtocol] {
                let encoder = JSONEncoder()
                var arrayOfEncodedProfiles = [Data]()

                arrayOfProfiles.forEach { profile in
                    if let encoded = try? encoder.encode(profile) {
                        arrayOfEncodedProfiles.append(encoded)
                    }

                    set(arrayOfEncodedProfiles, forKey: key.rawValue)
                }
            }
            // save other types
            else {
                set(newValue, forKey: key.rawValue)
            }
        }
    }
}
