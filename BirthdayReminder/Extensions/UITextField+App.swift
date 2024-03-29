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
        keyboardType: UIKeyboardType = .default,
        inputView: UIView? = nil,
        inputAccessoryView: UIView? = nil
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

        self.inputView = inputView
        self.inputAccessoryView = inputAccessoryView
    }

    func addDoneToolBarButton() {
        let bar = UIToolbar()
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(closeKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.sizeToFit()

        self.inputAccessoryView = bar
    }

    @objc
    private func closeKeyboard() {
        self.resignFirstResponder()
    }
}
