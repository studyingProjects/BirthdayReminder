//
//  LoginView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

class LoginView: UIView {
    // MARK: - Properties
    private lazy var appTitleLabel = UILabel(
        text: "Birthday Reminder",
        font: .appLargeFont,
        color: .appLabel,
        aligment: .center,
        borderColor: .systemGray3,
        borderWidth: Sizes.Small.borderWidth,
        cornerRadius: Sizes.Small.cornerRadius
    )

    private lazy var signInLabel = UILabel(
        text: "Sign In",
        font: .appLargeFont,
        color: .black
    )

    private lazy var emailLabel = UILabel(text: "Email")
    private lazy var emailTextField = UnderlinedTextField(
        text: "example@gmail.com",
        font: .appMediumFont,
        keyboardType: .emailAddress
    )

    private lazy var passwordLabel = UILabel(text: "Password")
    private lazy var passwordTextField = PasswordTextField(
        text: "password",
        font: .appMediumFont,
        keyboardType: .default
    )
    private lazy var faceIdSwitcher = UISwitch()
    private lazy var faceIdLabel = UILabel(
        text: "Use Face ID",
        font: .appMediumFont,
        color: .systemGray,
        aligment: .right
    )
    
    private lazy var signInButton = UIButton(
        title: "Sign In",
        font: .appLargeFont,
        titleColor: .white,
        backGroundColor: .appButton,
        cornerRadius: Sizes.Small.cornerRadius
    )

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
            appTitleLabel,
            signInLabel,
            emailLabel,
            emailTextField,
            passwordLabel,
            passwordTextField,
            faceIdSwitcher,
            faceIdLabel,
            signInButton
        )
    }
}
// MARK: - Constraints
private extension LoginView {
    private func setupConstraints() {
        setupHeader()
        setupLogin()
        setupBottom()
    }

    private func setupHeader() {
        let heighConstraint = appTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Small.height)
        heighConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            appTitleLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Large.padding
            ),
            appTitleLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Large.padding
            ),
            appTitleLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Sizes.Small.padding
            ),
            appTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Medium.height)
        ])
    }

    private func setupLogin() {
        NSLayoutConstraint.activate([
            signInLabel.leadingAnchor.constraint(
                equalTo: layoutMarginsGuide.leadingAnchor,
                constant: Sizes.Medium.padding
            ),
            signInLabel.trailingAnchor.constraint(
                equalTo: layoutMarginsGuide.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            signInLabel.topAnchor.constraint(
                equalTo: appTitleLabel.bottomAnchor,
                constant: Sizes.Medium.padding
            ),

            emailLabel.leadingAnchor.constraint(equalTo: signInLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: signInLabel.trailingAnchor),
            emailLabel.topAnchor.constraint(
                equalTo: signInLabel.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height),

            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordLabel.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Sizes.Small.height),

            faceIdSwitcher.trailingAnchor.constraint(
                equalTo: passwordTextField.trailingAnchor,
                constant: -Sizes.Medium.padding
            ),
            faceIdSwitcher.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor,
                constant: Sizes.Medium.padding
            ),
            faceIdLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            faceIdLabel.trailingAnchor.constraint(
                equalTo: faceIdSwitcher.leadingAnchor,
                constant: -Sizes.Small.padding
            ),
            faceIdLabel.centerYAnchor.constraint(equalTo: faceIdSwitcher.centerYAnchor)
        ])
    }

    private func setupBottom() {
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: appTitleLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: appTitleLabel.trailingAnchor),
            signInButton.topAnchor.constraint(
                greaterThanOrEqualTo: faceIdLabel.bottomAnchor,
                constant: Sizes.Large.padding
            ),
            signInButton.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Small.height),
            signInButton.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -Sizes.Large.padding
            )
        ])
    }
}
