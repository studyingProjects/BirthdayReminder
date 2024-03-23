//
//  EditProfileView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

class EditProfileView: UIView {
    // MARK: - Properties

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
    }
}
// MARK: - Constraints
private extension EditProfileView {
    private func setupConstraints() {
    }
}
