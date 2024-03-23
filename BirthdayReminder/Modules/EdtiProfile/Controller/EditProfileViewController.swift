//
//  EditProfileViewController.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

class EditProfileViewController: UIViewController {
    weak var coordinator: Coordinator?

    private let editProfileView = EditProfileView()

    override func loadView() {
        view = editProfileView
    }
}
