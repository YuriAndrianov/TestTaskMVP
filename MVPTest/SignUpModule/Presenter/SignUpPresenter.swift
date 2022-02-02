//
//  SignUpPresenter.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import Foundation

protocol SignUpViewProtocol: AnyObject {

    func setTextField(with text: String, textFieldType: String.ValidTypes)
    func setupValidationLabel(textFieldType: String.ValidTypes, isValid: Bool)

}

protocol SignUpViewPresenterProtocol: AnyObject {

    init(view: SignUpViewProtocol, router: RouterProtocol)

    func setText(inputText: String, range: NSRange, validType: String.ValidTypes)

    func checkTextFormat(text: String, validType: String.ValidTypes)

    func signUpTapped()

}

class SignUpPresenter: SignUpViewPresenterProtocol {

    weak var view: SignUpViewProtocol?
    var router: RouterProtocol?

    required init(view: SignUpViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

    func signUpTapped() {
        router?.showMain()
    }

    func setText(inputText: String, range: NSRange, validType: String.ValidTypes) {
        let result: String

        if range.length == 1 {
            let end = inputText.index(inputText.startIndex, offsetBy: inputText.count - 1)
            result = String(inputText[inputText.startIndex..<end])
        } else {
            result = inputText
        }

        view?.setTextField(with: result, textFieldType: validType)
    }

    func checkTextFormat(text: String, validType: String.ValidTypes) {
        if text.isValid(validType: validType) {
            view?.setupValidationLabel(textFieldType: validType, isValid: true)
        } else {
            view?.setupValidationLabel(textFieldType: validType, isValid: false)
        }
    }

}
