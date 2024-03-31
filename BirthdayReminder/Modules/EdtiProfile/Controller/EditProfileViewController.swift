//
//  EditProfileViewController.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

protocol EditProfileViewDelegate: AnyObject {
    func popViewController()
    func addTapped()
    func presentInstAlert(_ alert: UIAlertController)
    func updateName(with name: String?)
    func updateBirthDate(with date: String?)
    func updateAge(with age: String?)
    func updateSex(with sex: String?)
    func updateInst(with inst: String?)
}

protocol EditProfileViewControllerDelegate: AnyObject {
    func updateViewData(with profileModel: ProfileModelProtocol)
}

class EditProfileViewController: UIViewController {
    weak var coordinator: Coordinator?
    weak var delegate: EditProfileViewControllerDelegate?

    private let editProfileView = EditProfileView()
    private var profileModel: ProfileModelProtocol = ProfileModel()
    private let userDefaults = UserDefaults.standard

    override func loadView() {
        view = editProfileView
        editProfileView.delegate = self
        delegate = editProfileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViewData()
    }

    private func updateViewData() {
        delegate?.updateViewData(with: profileModel)
    }
}

// MARK: - Delegation
extension EditProfileViewController: EditProfileViewDelegate {

    func popViewController() {
        dismiss(animated: true)
    }

    func presentInstAlert(_ alert: UIAlertController) {
        present(alert, animated: true)
    }

    func updateName(with name: String?) {
        profileModel.name = name
    }

    func updateBirthDate(with date: String?) {
        profileModel.birthDate = date
    }

    func updateAge(with age: String?) {
        profileModel.age = age
    }

    func updateSex(with sex: String?) {
        profileModel.sex = sex
    }

    func updateInst(with inst: String?) {
        profileModel.inst = inst
    }

    func addTapped() {
        var arrayOfProfiles = userDefaults[.profilesArray] ?? [ProfileModelProtocol]()
        arrayOfProfiles.append(profileModel)
        userDefaults[.profilesArray] = arrayOfProfiles
    }
}
