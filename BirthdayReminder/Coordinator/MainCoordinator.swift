//
//  MainCoordinator.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }

    func start()
    func passToEditProfileScreen()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = LoginViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func passToEditProfileScreen() {
        let viewController = EditProfileViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
