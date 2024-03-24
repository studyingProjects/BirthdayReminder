//
//  UnderlinedVIew.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 24/03/2024.
//

import UIKit

class UnderlinedView: UIView {
    private let underlinedLayer = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.addSublayer(underlinedLayer)
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
        underlinedLayer.borderWidth = 3

        underlinedLayer.frame = frame
        underlinedLayer.borderColor = UIColor.systemGray2.cgColor
    }
}
