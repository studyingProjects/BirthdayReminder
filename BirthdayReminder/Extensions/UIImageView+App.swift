//
//  UIImageView+App.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

extension UIImageView {
    static func getProfileImageView() -> UIImageView {
        let config = UIImage.SymbolConfiguration(hierarchicalColor: .gray)
        let avatar = UIImage(systemName: "person.crop.circle.fill", withConfiguration: config)
        let imageView = UIImageView(image: avatar)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit

        return imageView
    }
}
