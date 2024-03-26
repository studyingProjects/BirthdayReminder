//
//  UIPickerView+App.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 26/03/2024.
//

import UIKit

extension UIPickerView {
    convenience init(isHidden: Bool, backgroundColor: UIColor) {
        self.init()
        
        self.isHidden = isHidden
        self.backgroundColor = backgroundColor
    }
}
