//
//  ProfilesListViewController.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 24/03/2024.
//

import UIKit

protocol ProfilesListViewDelegate: AnyObject {
    func passToEditProfile(_ sender: UIButton)
}

class ProfilesListViewController: UIViewController {
    // MARK: - Properties
    weak var coordinator: Coordinator?

    private let profileListView = ProfilesListView()

    // MARK: - LifeCycle
    override func loadView() {
        view = profileListView
    }
}

// MARK: - Delegation
extension ProfilesListViewController: ProfilesListViewDelegate {
    func passToEditProfile(_ sender: UIButton) {
        coordinator?.passToEditProfileScreen()
    }
}

import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your vc
            ProfilesListViewController().preview()
        }
    }
}
