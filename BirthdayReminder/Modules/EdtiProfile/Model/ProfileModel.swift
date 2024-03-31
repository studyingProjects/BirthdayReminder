//
//  ProfileModel.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 30/03/2024.
//

import Foundation

protocol ProfileModelProtocol: Codable {
    var name: String? { get set }
    var birthDate: String? { get set }
    var age: String? { get set }
    var sex: String? { get set }
    var inst: String? { get set }
}

struct ProfileModel: ProfileModelProtocol {
    var name: String?
    var birthDate: String?
    var age: String?
    var sex: String?
    var inst: String?
}
