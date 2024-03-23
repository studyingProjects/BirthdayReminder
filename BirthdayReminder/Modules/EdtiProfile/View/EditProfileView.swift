//
//  EditProfileView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

class EditProfileView: UIView {
    // MARK: - Properties
    private lazy var profileImageView = UIImageView.getProfileImageView()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup view
    private func setupView() {
        backgroundColor = .appBackground

        setupSubviews()
    }

    private func setupSubviews() {
        addSubviews(
            profileImageView
        )
    }
}
// MARK: - Constraints
private extension EditProfileView {
    private func setupConstraints() {
        setupHeader()
        setupBody()
    }

    private func setupHeader() {
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Large.padding
            ),
            profileImageView.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Large.padding
            ),
            profileImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Sizes.Small.padding
            ),
            profileImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Large.height)
        ])
    }

    private func setupBody() {}
}
