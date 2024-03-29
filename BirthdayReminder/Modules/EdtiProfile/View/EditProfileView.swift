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
    weak var delegate: EditProfileViewDelegate?
    // MARK: - Subviews properties
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
    lazy var datePicker = ToolBarDatePicker(backgroundColor: .systemGray2)
    lazy var dateTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "Fill in the date",
        keyboardType: .default,
        inputView: datePicker,
        inputAccessoryView: datePicker.toolBarView
    )
    // Age
    lazy var ageLabel = UILabel(text: "Age", font: .appMediumFont, color: .systemBlue)
    lazy var agePicker = ToolBarPickerView(backgroundColor: .systemGray2)
    lazy var ageTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "To add",
        keyboardType: .default,
        inputView: agePicker,
        inputAccessoryView: agePicker.toolBarView
    )
    // Sex
    lazy var sexLabel = UILabel(text: "Sex", font: .appMediumFont, color: .systemBlue)
    lazy var sexPicker = ToolBarPickerView(backgroundColor: .systemGray2)
    lazy var sexTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "To add",
        keyboardType: .default,
        inputView: sexPicker,
        inputAccessoryView: sexPicker.toolBarView
    )
    // Instagram
    lazy var instLabel = UILabel(text: "Instagram", font: .appMediumFont, color: .systemBlue)
    lazy var instTextField = UnderlinedTextField(
        font: .appMediumFont,
        placeholder: "To add",
        keyboardType: .default
    )
    // MARK: - View model properties
    private var selectedTextFieldIndex: Int?
    private var selectedPickerTitle: String?
    private var textFields: [UITextField] = []
    private var pickerViews: [ToolBarPickerView] = []
    private let defaultCountOfComponents = 1
    private let defaultCountOfRows = 0
    private let defaultRowValue = "?"
    private let sexPickerModel = ["Male", "Female"]
    private let agePickerModel: [Int] = Array(16...100)
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initHideKeyboard()

        setupView()
        // EditProfileView+Constraints.swift
        setupConstraints()
        setupDefaults()
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
    }

    private func setupDefaults() {
        // Setup tags
        nameTextField.tag = 0
        dateTextField.tag = 1
        ageTextField.tag = 2
        sexTextField.tag = 3
        instTextField.tag = 4
        // Setup default view arrays
        textFields = [nameTextField, dateTextField, ageTextField, sexTextField, instTextField]
        pickerViews = [agePicker, sexPicker]
        // Setup delegates
        navigationBar.customDelegate = self
        datePicker.toolBarDelegate = self

        textFields.forEach {
            $0.delegate = self
        }

        pickerViews.forEach {
            $0.delegate = self
            $0.dataSource = self
            $0.toolBarDelegate = self
        }

        // ageTextField.addDoneToolBarButton()
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
}
// MARK: - UITextFieldDelegate
extension EditProfileView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.isEqual(instTextField) {
            instTextFieldBeginEditing()
            return false
        }

        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextFieldIndex = textFields.firstIndex(of: textField)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if let nextField = self.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return false
    }
}
// MARK: - NavBarDelegate
extension EditProfileView: EditProfileNavigationBarDelegate {

    func popViewController() {
        delegate?.popViewController()
    }
}
// MARK: - UIPickerViewDelegate
extension EditProfileView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.isEqual(sexPicker) {
            return sexPickerModel[row]
        } else if pickerView.isEqual(agePicker) {
            return String(agePickerModel[row])
        }

        return defaultRowValue
    }
}

// MARK: - UIPickerViewDataSource
extension EditProfileView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return defaultCountOfComponents
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.isEqual(sexPicker) {
            return sexPickerModel.count
        } else if pickerView.isEqual(agePicker) {
            return agePickerModel.count
        }

        return defaultCountOfRows
    }
}
// MARK: - ToolBarPickerViewDelegate
extension EditProfileView: ToolBarPickerViewDelegate {
    func cancelTapped(_ sender: UIBarButtonItem) {
        guard let index = selectedTextFieldIndex else {
            return
        }

        selectedTextFieldIndex = nil
        textFields[index].text = nil
        textFields[index].endEditing(true)
    }

    func saveTapped(_ sender: UIBarButtonItem) {
    }
}
// MARK: - ToolBarDatePickerView
extension EditProfileView: ToolBarDatePickerDelegate {
    func cancelTapped() {
        dateTextField.endEditing(true)
    }

    func saveTapped() {
    }
}
