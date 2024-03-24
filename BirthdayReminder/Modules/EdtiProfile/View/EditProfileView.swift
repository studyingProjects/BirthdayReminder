//
//  EditProfileView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

class EditProfileView: UIView {
    // MARK: - Properties
    weak var delegate: EditProfileNavigationBarDelegate?

    private lazy var navigationBar = EditProfileNavigationBar(customDelegate: delegate)
    private lazy var profileImageView = UIImageView.getProfileImageView()
    private lazy var profileLabel = UILabel(
        text: "Edit photo",
        font: .appSmallFont,
        color: .systemBlue,
        aligment: .center
    )
    private lazy var bodyView = UIView(cornerRadius: Sizes.Small.cornerRadius)
    // Name
    private lazy var nameLabel = UILabel(text: "Name", font: .appSmallFont, color: .systemBlue)
    private lazy var nameTextField = UnderlinedTextField(
        font: .appSmallFont,
        placeholder: "Fill in the name",
        keyboardType: .default
    )
    // Date
    private lazy var dateLabel = UILabel(text: "Date", font: .appSmallFont, color: .systemBlue)
    private lazy var dateTextField = UnderlinedTextField(
        font: .appSmallFont,
        placeholder: "Fill in the date",
        keyboardType: .default
    )
    // Age
    private lazy var ageLabel = UILabel(text: "Age", font: .appSmallFont, color: .systemBlue)
    private lazy var ageTextField = UnderlinedTextField(
        font: .appSmallFont,
        placeholder: "To add",
        keyboardType: .default
    )
    // Sex
    private lazy var sexLabel = UILabel(text: "Sex", font: .appSmallFont, color: .systemBlue)
    private lazy var sexTextField = UnderlinedTextField(
        font: .appSmallFont,
        placeholder: "To add",
        keyboardType: .default
    )
    // Instagram
    private lazy var instLabel = UILabel(text: "Instagram", font: .appSmallFont, color: .systemBlue)
    private lazy var instTextField = UnderlinedTextField(
        font: .appSmallFont,
        placeholder: "To add",
        keyboardType: .default
    )
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(delegate: EditProfileNavigationBarDelegate) {
        self.init()
        
        setupView()
        setupConstraints()
        self.delegate = delegate
    }
    // MARK: - Setup view
    private func setupView() {
        backgroundColor = .appBackground

        setupSubviews()
    }

    private func setupSubviews() {
        addSubviews(
            navigationBar,
            profileImageView,
            profileLabel,
            bodyView
        )

        setupBodySection()
    }

    private func setupBodySection() {
        bodyView.addSubviews(
            nameLabel,
            nameTextField,
            dateLabel,
            dateTextField,
            ageLabel,
            ageTextField,
            sexLabel,
            sexTextField,
            instLabel,
            instTextField
        )
    }
}
// MARK: - Constraints
private extension EditProfileView {
    private func setupConstraints() {
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
