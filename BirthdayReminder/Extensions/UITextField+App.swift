//
//  UITextField+App.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 22/03/2024.
//

import UIKit

extension UITextField {
    convenience init(
        text: String? = nil,
        font: UIFont? = nil,
        placeholder: String? = nil,
        keyboardType: UIKeyboardType = .default
    ) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.placeholder = placeholder
        self.keyboardType = keyboardType

        self.borderStyle = .none
        self.autocorrectionType = .no
        self.returnKeyType = .done
        self.keyboardAppearance = .dark
    }
}
