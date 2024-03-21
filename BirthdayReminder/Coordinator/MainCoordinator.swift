//
//  MainCoordinator.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func start()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginVC = LoginViewController()
        navigationController.pushViewController(loginVC, animated: false)
    }
}
