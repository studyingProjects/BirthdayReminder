//
//  LoginViewController.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func passToEditProfile(_ sender: UIButton)
}

class LoginViewController: UIViewController {
    weak var coordinator: Coordinator?

    private let loginView = LoginView()

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.delegate = self
    }
}
// MARK: - Delegation
extension LoginViewController: LoginViewDelegate {
    func passToEditProfile(_ sender: UIButton) {
        coordinator?.passToEditProfileScreen()
    }
}
