//
//  TollBarDatePicker.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 29/03/2024.
//

import UIKit

protocol ToolBarDatePickerDelegate: AnyObject {
    func cancelTapped()
    func saveTapped()
}

class ToolBarDatePicker: UIDatePicker {
    private(set) var toolBarView: UIToolbar?
    weak var toolBarDelegate: ToolBarDatePickerDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupToolBar()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor

        self.datePickerMode = .date
        self.preferredDatePickerStyle = .wheels
        // self.minimumDate
        // self.maximumDate

        setupToolBar()
    }

    private func setupToolBar() {
        let toolBar = UIToolbar()
        toolBar.isTranslucent = true
        toolBar.barStyle = .black
        toolBar.sizeToFit()

        let cancelButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancelTapped)
        )

        let spaceButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        let saveButton = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveTapped)
        )

        toolBar.setItems([cancelButton, spaceButton, saveButton], animated: true)
        toolBar.isUserInteractionEnabled = true

        self.toolBarView = toolBar
    }

    @objc
    private func cancelTapped() {
        toolBarDelegate?.cancelTapped()
    }

    @objc
    private func saveTapped() {
        toolBarDelegate?.saveTapped()
    }
}
