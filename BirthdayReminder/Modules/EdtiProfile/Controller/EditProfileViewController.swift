//
//  EditProfileViewController.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

protocol EditProfileNavigationBarDelegate: AnyObject {
    func popViewController()
}

class EditProfileViewController: UIViewController {
    weak var coordinator: Coordinator?

    private lazy var editProfileView = EditProfileView(delegate: self)

    override func loadView() {
        view = editProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // editProfileView.delegate = self
    }
}

extension EditProfileViewController: EditProfileNavigationBarDelegate {
    func popViewController() {
        coordinator?.navigationController.popViewController(animated: true)
    }
}
