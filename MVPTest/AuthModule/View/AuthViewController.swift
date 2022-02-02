//
//  AuthViewController.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import UIKit

class AuthViewController: UIViewController {

    var presenter: AuthViewPresenterProtocol!

    @IBOutlet weak var scrollView: UIScrollView!


    @IBAction func emailEntered(_ sender: UITextField) {
        presenter.didEnteredEmail()
    }

    @IBAction func passwordEntered(_ sender: UITextField) {
        presenter.didEnteredPassword()
    }

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        presenter.didTapSignIn()
        
    }

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        presenter.didTapSignUp()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Authorization"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerObservers()
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
            scrollView.contentInset = UIEdgeInsets(top: -keyboardSize.height / 2, left: 0, bottom: 0, right: 0)
        }
    }

    @objc private func keyboardWillHide(_ notification:Notification) {
        scrollView.contentInset = .zero
    }
}


extension AuthViewController: AuthViewProtocol {

    func success() {

    }

    func failure() {

    }

}

extension AuthViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

}
