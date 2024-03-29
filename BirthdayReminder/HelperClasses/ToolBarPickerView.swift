//
//  ToolBarPickerView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 29/03/2024.
//

import UIKit

protocol ToolBarPickerViewDelegate: AnyObject {
    func cancelTapped(_ sender: UIBarButtonItem)
    func saveTapped(_ sender: UIBarButtonItem)
}

class ToolBarPickerView: UIPickerView {
    private(set) var toolBarView: UIToolbar?
    weak var toolBarDelegate: ToolBarPickerViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSelectionIndicators()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)

        self.backgroundColor = backgroundColor
        addSelectionIndicators()
    }

    private func addSelectionIndicators() {
        let toolBar = UIToolbar()
        toolBar.isTranslucent = true
        toolBar.barStyle = .default
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

        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveTapped)
        )

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true

        self.toolBarView = toolBar
    }

    @objc
    private func cancelTapped(_ sender: UIBarButtonItem) {
        toolBarDelegate?.cancelTapped(sender)
    }

    @objc
    private func saveTapped(_ sender: UIBarButtonItem) {
        toolBarDelegate?.saveTapped(sender)
    }
}
