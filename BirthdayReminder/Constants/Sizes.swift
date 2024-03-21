//
//  Sizes.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

enum Sizes {
    enum Small {
        static let padding: CGFloat = 8
        static let width: CGFloat = 50
        static let height: CGFloat = 44
        static let cornerRadius: CGFloat = 10

        static let fontSize: CGFloat = 14
        static let fonrWeight: UIFont.Weight = .regular
    }

    enum Medium {
        static let padding: CGFloat = 16
        static let width: CGFloat = 100
        static let height: CGFloat = 88
        static let cornerRadius: CGFloat = 20

        static let fontSize: CGFloat = 22
        static let fontWeight: UIFont.Weight = .medium
    }

    enum Large {
        static let padding: CGFloat = 32
        static let width: CGFloat = 200
        static let height: CGFloat = 176
        static let cornerRadius: CGFloat = 30

        static let fontSize: CGFloat = 42
        static let fontWeight: UIFont.Weight = .semibold
    }

    enum XLarge {
        static let padding: CGFloat = 64
        static let width: CGFloat = 400
        static let height: CGFloat = 352
        static let cornerRadius: CGFloat = 40

        static let fontSize: CGFloat = 56
        static let fontWeight: UIFont.Weight = .bold
    }
}
