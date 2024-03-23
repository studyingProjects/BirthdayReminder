//
//  EditProfileViewController.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

class EditProfileViewController: UIViewController {
    weak var coordinator: Coordinator?

    private let editProfileView = EditProfileView()

    override func loadView() {
        view = editProfileView
    }
}

import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your vc
            EditProfileViewController().preview()
        }
    }
}
