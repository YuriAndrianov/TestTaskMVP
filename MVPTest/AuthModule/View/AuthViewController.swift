//
//  AuthViewController.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import UIKit

class AuthViewController: UIViewController {

    var presenter: AuthViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()


    }

}

extension AuthViewController: AuthViewProtocol {

    func success() {

    }

    func failure() {

    }

}
