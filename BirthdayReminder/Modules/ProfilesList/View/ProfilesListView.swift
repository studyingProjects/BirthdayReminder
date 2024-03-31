//
//  ProfilesListView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 24/03/2024.
//

import UIKit

protocol ProfilesListViewControllerDelegate: AnyObject {
    func updateFirstView(with data: ProfileModelProtocol)
    func updateSecondView(with data: ProfileModelProtocol)
    func updateThirdView(with data: ProfileModelProtocol)
}

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
    private lazy var thirdProfileView = UnderlinedView(frame: .zero)
    private lazy var thirdProfileImageView = UIImageView.getProfileImageView()
    private lazy var thirdNameLabel = UILabel(
        text: "Jony Stark",
        font: .appMediumFont,
        color: .black,
        aligment: .left
    )
    private lazy var thirdBirthdayDescriptionLabel = UILabel(
        text: "Saturday, April 25 will be the 25th birthday",
        font: .appMediumFont,
        color: .systemGray2,
        aligment: .left
    )
    private lazy var thirdDaysRemainingLabel = UILabel(
        text: "53 days",
        font: .appMediumFont,
        color: .systemGray2,
        aligment: .right
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
    // MARK: - setupView
    private func setupView() {
        backgroundColor = .appBackground

        setupSubViews()
    }

    private func setupSubViews() {
        addSubviews(firstProfileView, secondProfileView, thirdProfileView)

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

        thirdProfileView.addSubviews(
            thirdProfileImageView,
            thirdNameLabel,
            thirdBirthdayDescriptionLabel,
            thirdDaysRemainingLabel
        )
    }
}
// MARK: - Delegation
extension ProfilesListView: ProfilesListViewControllerDelegate {
    func updateFirstView(with data: ProfileModelProtocol) {
        firstNameLabel.text = data.name
        birthdayDescriptionLabel.text = data.birthDate
        daysRemainingLabel.text = data.age
    }

    func updateSecondView(with data: ProfileModelProtocol) {
        secondNameLabel.text = data.name
        secondBirthdayDescriptionLabel.text = data.birthDate
        daysRemainingLabel.text = data.age
    }

    func updateThirdView(with data: ProfileModelProtocol) {
        thirdNameLabel.text = data.name
        thirdBirthdayDescriptionLabel.text = data.birthDate
        thirdDaysRemainingLabel.text = data.age
    }
}
// MARK: - Constraints
private extension ProfilesListView {
    private func setupConstraints() {
        setupMainProfileViews()
        setupSecondProfileViews()
        setupThirdProfileViews()

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
    // MARK: - Third View
    private func setupThirdProfileViews() {
        NSLayoutConstraint.activate([
            thirdProfileView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            thirdProfileView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            thirdProfileView.topAnchor.constraint(
                equalTo: secondProfileView.bottomAnchor,
                constant: Sizes.Small.padding
            ),
            thirdProfileView.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Medium.height),
            // Profile image
            thirdProfileImageView.leadingAnchor.constraint(equalTo: thirdProfileView.leadingAnchor),
            thirdProfileImageView.centerYAnchor.constraint(equalTo: thirdProfileView.centerYAnchor),
            thirdProfileImageView.heightAnchor.constraint(
                equalTo: thirdProfileView.heightAnchor,
                multiplier: Sizes.Large.multiplier
            ),
            thirdProfileImageView.widthAnchor.constraint(
                equalTo: thirdProfileView.widthAnchor,
                multiplier: Sizes.Small.multiplier
            ),
            // Name title
            thirdNameLabel.leadingAnchor.constraint(
                equalTo: thirdProfileImageView.trailingAnchor
            ),
            thirdNameLabel.topAnchor.constraint(
                equalTo: thirdProfileView.topAnchor,
                constant: Sizes.XSmall.padding
            ),
            // Birthday description
            thirdBirthdayDescriptionLabel.leadingAnchor.constraint(
                equalTo: thirdProfileImageView.trailingAnchor
            ),
            thirdBirthdayDescriptionLabel.trailingAnchor.constraint(
                equalTo: thirdProfileView.trailingAnchor,
                constant: -Sizes.XSmall.padding
            ),
            thirdBirthdayDescriptionLabel.topAnchor.constraint(
                equalTo: thirdNameLabel.bottomAnchor,
                constant: Sizes.XSmall.padding
            ),
            thirdBirthdayDescriptionLabel.bottomAnchor.constraint(
                equalTo: thirdProfileImageView.bottomAnchor,
                constant: -Sizes.XSmall.padding
            ),
            // Day remaining
            thirdDaysRemainingLabel.leadingAnchor.constraint(
                equalTo: thirdNameLabel.trailingAnchor,
                constant: Sizes.XSmall.padding
            ),
            thirdDaysRemainingLabel.trailingAnchor.constraint(
                equalTo: thirdProfileView.trailingAnchor,
                constant: -Sizes.Small.padding
            ),
            thirdDaysRemainingLabel.topAnchor.constraint(equalTo: thirdNameLabel.topAnchor)
        ])
    }

    private func setupPriorities() {
        daysRemainingLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        secondDaysRemainingLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        thirdDaysRemainingLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
