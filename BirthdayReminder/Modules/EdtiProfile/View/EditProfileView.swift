//
//  EditProfileView.swift
//  BirthdayReminder
//
//  Created by Andrei Shpartou on 23/03/2024.
//

import UIKit

protocol EditProfileNavigationBarDelegate: AnyObject {
    func popViewController()
}

class EditProfileView: UIView, UINavigationBarDelegate {
    // MARK: - Properties
    weak var delegate: EditProfileViewDelegate?

    lazy var navigationBar = EditProfileNavigationBar()
    lazy var profileImageView = UIImageView.getProfileImageView()
    lazy var profileLabel = UILabel(
        text: "Edit photo",
        font: .appMediumFont,
        color: .systemBlue,
        aligment: .center
    )
    lazy var bodyView = UIView(cornerRadius: Sizes.Small.cornerRadius)
    // Name
    lazy var nameLabel = UILabel(text: "Name", font: .appMediumFont, color: .systemBlue)
    lazy var nameTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "Fill in the name",
        keyboardType: .default
    )
    // Date
    lazy var dateLabel = UILabel(text: "Date", font: .appMediumFont, color: .systemBlue)
    lazy var dateTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "Fill in the date",
        keyboardType: .default
    )
    // Age
    lazy var ageLabel = UILabel(text: "Age", font: .appMediumFont, color: .systemBlue)
    lazy var ageTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "To add",
        keyboardType: .default
    )
    // Sex
    lazy var sexLabel = UILabel(text: "Sex", font: .appMediumFont, color: .systemBlue)
    lazy var sexTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "To add",
        keyboardType: .default
    )
    // Instagram
    lazy var instLabel = UILabel(text: "Instagram", font: .appMediumFont, color: .systemBlue)
    lazy var instTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "To add",
        keyboardType: .default
    )
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        // EditProfileView+Constraints.swift
        setupConstraints()
        navigationBar.customDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup view
    private func setupView() {
        backgroundColor = .appBackground

        setupSubviews()
    }

    private func setupSubviews() {

        addSubviews(
            navigationBar,
            profileImageView,
            profileLabel,
            bodyView
        )

        setupBodySection()
    }

    private func setupBodySection() {
        bodyView.addSubviews(
            nameLabel,
            nameTextField,
            dateLabel,
            dateTextField,
            ageLabel,
            ageTextField,
            sexLabel,
            sexTextField,
            instLabel,
            instTextField
        )

        instTextField.delegate = self
    }
}
// MARK: - Delegation
extension EditProfileView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.isEqual(instTextField) {
            instTextFieldBeginEditing()
        } else if textField.isEqual(ageTextField) {
            ageTextFieldBeginEditing()
        } else if textField.isEqual(dateTextField) {
            dateTextFieldBeginEditing()
        } else if textField.isEqual(sexTextField) {
            sexTextFieldBeginEditing()
        }

        return false
    }
}

extension EditProfileView: EditProfileNavigationBarDelegate {

    func popViewController() {
        delegate?.popViewController()
    }
}
// MARK: - Action handlers
private extension EditProfileView {
    private func instTextFieldBeginEditing() {
        let alert = UIAlertController(
            title: "Type in your instagram username",
            message: nil,
            preferredStyle: .alert
        )
        alert.addTextField(
            configurationHandler: {
                $0.placeholder = "@AndreiShpartou@"
            }
        )

        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel
        )
        let doneAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                if let text = alert.textFields?.first {
                }
            }
        )

        alert.addAction(cancelAction)
        alert.addAction(doneAction)

        delegate?.presentInstAlert(alert)
    }

    private func ageTextFieldBeginEditing() {}
    private func sexTextFieldBeginEditing() {}
    private func dateTextFieldBeginEditing() {}
}
