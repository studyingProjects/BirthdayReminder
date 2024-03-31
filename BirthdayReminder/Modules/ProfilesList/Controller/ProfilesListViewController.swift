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
    weak var delegate: ProfilesListViewControllerDelegate?

    private let profileListView = ProfilesListView()
    private var arrayOfProfiles = [ProfileModelProtocol]()
    private let userDefaults = UserDefaults.standard

    // MARK: - LifeCycle
    override func loadView() {
        view = profileListView
        self.delegate = profileListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Birthday"

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )

        getProfileList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.backgroundColor = .systemGray5
    }

    private func getProfileList() {
        arrayOfProfiles = userDefaults[.profilesArray] ?? [ProfileModelProtocol]()
        for (index, value) in arrayOfProfiles.enumerated() {
            if index == 0 {
                delegate?.updateFirstView(with: value)
            } else if index == 1 {
                delegate?.updateSecondView(with: value)
            } else if index == 2 {
                delegate?.updateThirdView(with: value)
            }
        }
    }

    @objc
    private func addTapped() {
        coordinator?.passToEditProfileScreen()
    }
}

// MARK: - Delegation
extension ProfilesListViewController: ProfilesListViewDelegate {
    func passToEditProfile(_ sender: UIButton) {
        // coordinator?.passToEditProfileScreen()
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
