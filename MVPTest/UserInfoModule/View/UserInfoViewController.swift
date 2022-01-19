//
//  UserInfoViewController.swift
//  MVPTest
//
//  Created by MacBook on 19.01.2022.
//

import UIKit

class UserInfoViewController: UIViewController {

    var presenter: UserInfoViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension UserInfoViewController: UserInfoViewProtocol {

    func setUser(user: User?) {

    }

}
