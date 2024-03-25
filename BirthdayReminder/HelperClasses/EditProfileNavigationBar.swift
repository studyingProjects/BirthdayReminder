//
//  EditProfile.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 24/03/2024.
//

import UIKit

class EditProfileNavigationBar: UINavigationBar {
    weak var customDelegate: EditProfileNavigationBarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupCustomBar()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCustomBar() {
        // hide bottom border
        shadowImage = UIImage()
        setBackgroundImage(UIImage(), for: .default)

        let barItem = UINavigationItem()
        let cancelBarButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancelTapped)
        )
        barItem.leftBarButtonItem = cancelBarButton

        let addBarButton = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(addTapped)
        )

        barItem.rightBarButtonItem = addBarButton

        setItems([barItem], animated: true)
    }

    @objc
    private func cancelTapped() {
        customDelegate?.popViewController()
    }

    @objc
    private func addTapped() {
    }
}
