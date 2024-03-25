//
//  EditProfileViewController.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

protocol EditProfileViewDelegate: AnyObject {
    func popViewController()
}

class EditProfileViewController: UIViewController {
    weak var coordinator: Coordinator?

    private let editProfileView = EditProfileView()

    override func loadView() {
        view = editProfileView
        editProfileView.delegate = self
    }
}

// MARK: - Delegation
extension EditProfileViewController: EditProfileViewDelegate {
    func popViewController() {
        dismiss(animated: true)
    }
}
