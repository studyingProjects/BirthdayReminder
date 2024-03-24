//
//  ProfilesListView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 24/03/2024.
//

import UIKit

class ProfilesListView: UIView {
    // MARK: - Properties
    private lazy var firstProfileView = UnderlinedView(frame: .zero)
    private lazy var firstProfileImageView = UIImageView.getProfileImageView()
    private lazy var firstNameLabel = UILabel(
        text: "Jeremy",
        font: .appMediumFont,
        color: .blue
    )
    private lazy var birthdayDescriptionLabel = UILabel(
        text: "Wednesday, March 10 will mark the 25th birthday",
        font: .appSmallFont,
        color: .systemGray2
    )
    private lazy var daysRemainingLabel = UILabel(
        text: "18 days",
        font: .appMediumFont,
        color: .systemGray2
    )

    // private lazy var secondProfileView = UnderlinedView(frame: .zero)
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
        // firstProfileView.addSubviews(firstNameLabel)
    }
}

// MARK: - Constraints
private extension ProfilesListView {
    private func setupConstraints() {
        setupMainProfileViews()
    }

    private func setupMainProfileViews() {
        NSLayoutConstraint.activate([
            firstProfileView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            firstProfileView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            firstProfileView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Sizes.Small.padding
            ),
            firstProfileView.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Medium.height)
        ])
    }

    private func setupProfileSubViews(
        _ profileView: UIView,
        with nameView: UIView,
        and descriptionView: UIView,
        and daysRemainingView: UIView
    ) {}
}
