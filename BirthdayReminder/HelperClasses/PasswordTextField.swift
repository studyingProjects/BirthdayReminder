//
//  PasswordTextField.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 22/03/2024.
//

import UIKit

class PasswordTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.isSecureTextEntry = true
        self.rightViewMode = .always
        self.rightView = getShowHideButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Subview adjustment
    private func getShowHideButton() -> UIButton {
        let button = UIButton()
        let imageHide = UIImage(systemName: "eye.slash.fill")
        let imageShow = UIImage(systemName: "eye.fill")
        button.setImage(imageHide, for: .normal)
        button.setImage(imageShow, for: .selected)
        button.sizeToFit()
        button.addTarget(
            self,
            action: #selector(hideShowButtonPressed),
            for: .touchUpInside
        )

        return button
    }
    // MARK: - Action methods
    @objc
    private func hideShowButtonPressed(_ sender: UIButton) {
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
}
