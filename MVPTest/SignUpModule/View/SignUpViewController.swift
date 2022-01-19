//
//  SignUpViewController.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import UIKit

class SignUpViewController: UIViewController {

    var presenter: SignUpViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()


    }

}

extension SignUpViewController: SignUpViewProtocol {

    func nameFormatApproved() {

    }

    func nameFormatError() {

    }

    func ageError() {

    }

    func ageApproved() {

    }

    func phoneFormatError() {

    }

    func phoneFormatApproved() {

    }

    func emailFormatError() {

    }

    func emailFormatApproved() {

    }

    func passwordFormatError() {

    }

    func passwordFormatApproved() {

    }




}
