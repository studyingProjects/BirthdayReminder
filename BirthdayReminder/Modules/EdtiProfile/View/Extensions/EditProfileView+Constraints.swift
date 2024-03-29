//
//  EditProfileView+Constraints.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 25/03/2024.
//

import UIKit

extension EditProfileView {
    func setupConstraints() {
        setupHeaderConstraints()
        setupBodyConstraints()
        setupNameConstraints()
        setupDateConstraints()
        setupAgeConstraints()
        setupSexConstraints()
        setupInstConstraints()
    }

    private func setupHeaderConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            // navigationBar.heightAnchor.constraint(equalToConstant: Sizes.Small.height),

            profileImageView.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Large.padding
            ),
            profileImageView.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Large.padding
            ),
            profileImageView.topAnchor.constraint(
                equalTo: navigationBar.bottomAnchor
            ),
            profileImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Large.height),

            profileLabel.topAnchor.constraint(
                equalTo: profileImageView.bottomAnchor
            ),
            profileLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            profileLabel.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor)
        ])
    }

    private func setupBodyConstraints() {
        NSLayoutConstraint.activate([
            bodyView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            bodyView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor),
            bodyView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupNameConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            nameLabel.topAnchor.constraint(
                equalTo: bodyView.topAnchor,
                constant: Sizes.Small.padding
            ),
            nameTextField.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height)
        ])
    }

    private func setupDateConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            dateLabel.topAnchor.constraint(
                equalTo: nameTextField.bottomAnchor,
                constant: Sizes.Small.padding
            ),
            dateTextField.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            dateTextField.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            dateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            dateTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height)
            // datePicker.centerXAnchor.constraint(equalTo: bodyView.centerXAnchor),
            // datePicker.centerYAnchor.constraint(equalTo: dateTextField.centerYAnchor)
        ])
    }

    private func setupAgeConstraints() {
        NSLayoutConstraint.activate([
            ageLabel.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            ageLabel.topAnchor.constraint(
                equalTo: dateTextField.bottomAnchor,
                constant: Sizes.Small.padding
            ),
            ageTextField.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height)
            // agePicker.centerXAnchor.constraint(equalTo: bodyView.centerXAnchor),
            // agePicker.centerYAnchor.constraint(equalTo: ageTextField.centerYAnchor)
        ])
    }

    private func setupSexConstraints() {
        NSLayoutConstraint.activate([
            sexLabel.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            sexLabel.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            sexLabel.topAnchor.constraint(
                equalTo: ageTextField.bottomAnchor,
                constant: Sizes.Small.padding
            ),
            sexTextField.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            sexTextField.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            sexTextField.topAnchor.constraint(equalTo: sexLabel.bottomAnchor),
            sexTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height)
            // sexPicker.centerXAnchor.constraint(equalTo: bodyView.centerXAnchor),
            // sexPicker.centerYAnchor.constraint(equalTo: sexTextField.centerYAnchor)
        ])
    }

    private func setupInstConstraints() {
        NSLayoutConstraint.activate([
            instLabel.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            instLabel.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            instLabel.topAnchor.constraint(
                equalTo: sexTextField.bottomAnchor,
                constant: Sizes.Small.padding
            ),
            instTextField.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            instTextField.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            instTextField.topAnchor.constraint(equalTo: instLabel.bottomAnchor),
            instTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height)
        ])
    }
}
