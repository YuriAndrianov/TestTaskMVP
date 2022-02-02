//
//  SignUpViewController.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import UIKit

class SignUpViewController: UIViewController {

    var presenter: SignUpViewPresenterProtocol!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameValidationLabel: UILabel!
    @IBOutlet weak var lastNameValidationLabel: UILabel!
    @IBOutlet weak var emailValidationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign up"
        registerObservers()
        registerDelegates()

    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func registerObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification:Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc private func keyboardWillHide(_ notification:Notification) {
        scrollView.contentInset = .zero
    }

    @IBAction func signUpButtonTapped(_ sender: UIButton) {

    }

    func registerDelegates() {
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

}

extension SignUpViewController: SignUpViewProtocol {

    func setupValidationLabel(textFieldType: String.ValidTypes, isValid: Bool) {

        switch textFieldType {
        case .name:
            if isValid {
                nameValidationLabel.text = "Name is valid"
                nameValidationLabel.textColor = .systemGreen
            } else {
                nameValidationLabel.text = "Name is invalid. Min 1 character and only letters allowed."
                nameValidationLabel.textColor = .systemRed
            }

        case .lastname:
            if isValid {
                lastNameValidationLabel.text = "Lastname is valid"
                lastNameValidationLabel.textColor = .systemGreen
            } else {
                lastNameValidationLabel.text = "Lastname is invalid. Min 1 character and only letters allowed."
                lastNameValidationLabel.textColor = .systemRed
            }

        case .email:
            if isValid {
                emailValidationLabel.text = "Email is valid"
                emailValidationLabel.textColor = .systemGreen
            } else {
                emailValidationLabel.text = "Email is invalid."
                emailValidationLabel.textColor = .systemRed
            }
        }
    }


    func setTextField(with text: String, textFieldType: String.ValidTypes) {

        switch textFieldType {
        case .name: nameTextField.text = text
        case .lastname: lastNameTextField.text = text
        case .email: emailTextField.text = text
        }
    }

}

extension SignUpViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text ?? "") + string

        switch textField {
        case nameTextField:
            presenter.setText(inputText: text, range: range, validType: .name)
            presenter.checkTextFormat(text: nameTextField.text ?? "", validType: .name)
        case lastNameTextField:
            presenter.setText(inputText: text, range: range, validType: .lastname)
            presenter.checkTextFormat(text: lastNameTextField.text ?? "", validType: .lastname)
        case emailTextField:
            presenter.setText(inputText: text, range: range, validType: .email)
            presenter.checkTextFormat(text: emailTextField.text ?? "", validType: .email)
        case phoneTextField: break
        case passwordTextField: break
        default: break
        }

        return false
    }

}
