//
//  UIButton+App.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

extension UIButton {
    convenience init(
        title: String?,
        font: UIFont? = nil,
        titleColor: UIColor? = nil,
        backGroundColor: UIColor? = nil,
        cornerRadius: CGFloat = 0
    ) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(UIColor.tintColor, for: .highlighted)
        self.backgroundColor = backGroundColor
        self.layer.cornerRadius = cornerRadius
    }
}
