//
//  UILabel+App.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

extension UILabel {
    convenience init(
        text: String? = "",
        font: UIFont,
        color: UIColor,
        borderColor: UIColor? = nil,
        borderWidth: CGFloat = 0
    ) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = color
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        // test
        // self.numberOfLines = 0
        // self.adjustsFontSizeToFitWidth = true
        // self.minimumScaleFactor = 0.5
    }
}
