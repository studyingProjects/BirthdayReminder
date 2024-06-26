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
    func passToProfilesList()
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

    func passToProfilesList() {
        let viewController = ProfilesListViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func passToEditProfileScreen() {
        let viewController = EditProfileViewController()
        viewController.coordinator = self
        navigationController.present(viewController, animated: true)
    }
}
