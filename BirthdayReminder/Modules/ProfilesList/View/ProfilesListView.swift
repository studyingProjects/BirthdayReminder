//
//  ProfilesListView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 24/03/2024.
//

import UIKit

class ProfilesListView: UIView {
    // MARK: - Properties
    // First hard view
    private lazy var firstProfileView = UnderlinedView(frame: .zero)
    private lazy var firstProfileImageView = UIImageView.getProfileImageView()
    private lazy var firstNameLabel = UILabel(
        text: "Jeremy Clarcson",
        font: .appMediumFont,
        color: .black,
        aligment: .left
    )
    private lazy var birthdayDescriptionLabel = UILabel(
        text: "Wednesday, March 10 will be the 25th birthday",
        font: .appMediumFont,
        color: .systemGray2,
        aligment: .left
    )
    private lazy var daysRemainingLabel = UILabel(
        text: "18 days",
        font: .appMediumFont,
        color: .systemGray2,
        aligment: .right
    )
    // Second hard view
    // private lazy var secondProfileView = UnderlinedView(frame: .zero)
    private lazy var secondProfileView = UnderlinedView(frame: .zero)
    private lazy var secondProfileImageView = UIImageView.getProfileImageView()
    private lazy var secondNameLabel = UILabel(
        text: "Maria Lui",
        font: .appMediumFont,
        color: .black,
        aligment: .left
    )
    private lazy var secondBirthdayDescriptionLabel = UILabel(
        text: "Thursday, March 30 will be the 20th birthday",
        font: .appMediumFont,
        color: .systemGray2,
        aligment: .left
    )
    private lazy var secondDaysRemainingLabel = UILabel(
        text: "28 days",
        font: .appMediumFont,
        color: .systemGray2,
        aligment: .right
    )
    // Third hard view
    // private lazy var thirdProfileView = UnderlinedView(frame: .zero)
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - setupView
    private func setupView() {
        backgroundColor = .appBackground

        setupSubViews()
    }

    private func setupSubViews() {
        addSubviews(firstProfileView)
        addSubviews(secondProfileView)

        firstProfileView.addSubviews(
            firstProfileImageView,
            firstNameLabel,
            birthdayDescriptionLabel,
            daysRemainingLabel
        )

        secondProfileView.addSubviews(
            secondProfileImageView,
            secondNameLabel,
            secondBirthdayDescriptionLabel,
            secondDaysRemainingLabel
        )
    }
}

// MARK: - Constraints
private extension ProfilesListView {
    private func setupConstraints() {
        setupMainProfileViews()
        setupSecondProfileViews()

        setupPriorities()
    }

    private func setupMainProfileViews() {
        NSLayoutConstraint.activate([
            firstProfileView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            firstProfileView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            firstProfileView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Sizes.Small.padding
            ),
            firstProfileView.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Medium.height),
            // Profile image
            firstProfileImageView.leadingAnchor.constraint(equalTo: firstProfileView.leadingAnchor),
            firstProfileImageView.centerYAnchor.constraint(equalTo: firstProfileView.centerYAnchor),
            firstProfileImageView.heightAnchor.constraint(
                equalTo: firstProfileView.heightAnchor,
                multiplier: Sizes.Large.multiplier
            ),
            firstProfileImageView.widthAnchor.constraint(
                equalTo: firstProfileView.widthAnchor,
                multiplier: Sizes.Small.multiplier
            ),
            // Name title
            firstNameLabel.leadingAnchor.constraint(
                equalTo: firstProfileImageView.trailingAnchor
            ),
            firstNameLabel.topAnchor.constraint(
                equalTo: firstProfileView.topAnchor,
                constant: Sizes.XSmall.padding
            ),
            // Birthday description
            birthdayDescriptionLabel.leadingAnchor.constraint(
                equalTo: firstProfileImageView.trailingAnchor
            ),
            birthdayDescriptionLabel.trailingAnchor.constraint(
                equalTo: firstProfileView.trailingAnchor,
                constant: -Sizes.XSmall.padding
            ),
            birthdayDescriptionLabel.topAnchor.constraint(
                equalTo: firstNameLabel.bottomAnchor,
                constant: Sizes.XSmall.padding
            ),
            birthdayDescriptionLabel.bottomAnchor.constraint(
                equalTo: firstProfileImageView.bottomAnchor,
                constant: -Sizes.XSmall.padding
            ),
            // Day remaining
            daysRemainingLabel.leadingAnchor.constraint(
                equalTo: firstNameLabel.trailingAnchor,
                constant: Sizes.XSmall.padding
            ),
            daysRemainingLabel.trailingAnchor.constraint(
                equalTo: firstProfileView.trailingAnchor,
                constant: -Sizes.Small.padding
            ),
            daysRemainingLabel.topAnchor.constraint(equalTo: firstNameLabel.topAnchor)
        ])
    }
    // MARK: - Second View
    private func setupSecondProfileViews() {
        NSLayoutConstraint.activate([
            secondProfileView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            secondProfileView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            secondProfileView.topAnchor.constraint(
                equalTo: firstProfileView.bottomAnchor,
                constant: Sizes.Small.padding
            ),
            secondProfileView.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Medium.height),
            // Profile image
            secondProfileImageView.leadingAnchor.constraint(equalTo: secondProfileView.leadingAnchor),
            secondProfileImageView.centerYAnchor.constraint(equalTo: secondProfileView.centerYAnchor),
            secondProfileImageView.heightAnchor.constraint(
                equalTo: secondProfileView.heightAnchor,
                multiplier: Sizes.Large.multiplier
            ),
            secondProfileImageView.widthAnchor.constraint(
                equalTo: secondProfileView.widthAnchor,
                multiplier: Sizes.Small.multiplier
            ),
            // Name title
            secondNameLabel.leadingAnchor.constraint(
                equalTo: secondProfileImageView.trailingAnchor
            ),
            secondNameLabel.topAnchor.constraint(
                equalTo: secondProfileView.topAnchor,
                constant: Sizes.XSmall.padding
            ),
            // Birthday description
            secondBirthdayDescriptionLabel.leadingAnchor.constraint(
                equalTo: secondProfileImageView.trailingAnchor
            ),
            secondBirthdayDescriptionLabel.trailingAnchor.constraint(
                equalTo: secondProfileView.trailingAnchor,
                constant: -Sizes.XSmall.padding
            ),
            secondBirthdayDescriptionLabel.topAnchor.constraint(
                equalTo: secondNameLabel.bottomAnchor,
                constant: Sizes.XSmall.padding
            ),
            secondBirthdayDescriptionLabel.bottomAnchor.constraint(
                equalTo: secondProfileImageView.bottomAnchor,
                constant: -Sizes.XSmall.padding
            ),
            // Day remaining
            secondDaysRemainingLabel.leadingAnchor.constraint(
                equalTo: secondNameLabel.trailingAnchor,
                constant: Sizes.XSmall.padding
            ),
            secondDaysRemainingLabel.trailingAnchor.constraint(
                equalTo: secondProfileView.trailingAnchor,
                constant: -Sizes.Small.padding
            ),
            secondDaysRemainingLabel.topAnchor.constraint(equalTo: secondNameLabel.topAnchor)
        ])
    }

    private func setupPriorities() {
        daysRemainingLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        secondDaysRemainingLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
