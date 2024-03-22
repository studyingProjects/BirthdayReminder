//
//  UnderlinedTextField.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 21/03/2024.
//

import UIKit

class UnderlinedTextField: UITextField {
    let underlineLayer = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.addSublayer(underlineLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupUnderlinedLayer()
    }

    private func setupUnderlinedLayer() {
        var frame = self.bounds
        frame.origin.y = frame.height - 1
        frame.size.height = 1

        underlineLayer.frame = frame
        underlineLayer.backgroundColor = UIColor.gray.cgColor
    }
}
