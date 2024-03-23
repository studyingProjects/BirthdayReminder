//
//  LoginViewController.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()

    override func loadView() {
        view = loginView
    }
}

import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your vc
            LoginViewController().preview()
        }
    }
}
