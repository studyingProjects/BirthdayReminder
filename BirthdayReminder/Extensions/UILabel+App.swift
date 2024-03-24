//
//  UILabel+App.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

extension UILabel {
    convenience init(
        text: String,
        font: UIFont,
        color: UIColor,
        aligment: NSTextAlignment = .natural,
        borderColor: UIColor? = nil,
        borderWidth: CGFloat = 0,
        cornerRadius: CGFloat = 0
    ) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = color
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        self.textAlignment = aligment
        self.layer.cornerRadius = cornerRadius
        // test
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
    }

    convenience init(
        text: String? = ""
    ) {
        self.init(frame: .zero)
        self.text = text
        self.font = UIFont.appMediumFont
        self.textColor = UIColor.appLabel
    }
}
