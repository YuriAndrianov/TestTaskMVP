//
//  String+Extension.swift
//  MVPTest
//
//  Created by MacBook on 20.01.2022.
//

import Foundation

extension String {

    enum ValidTypes {
        case name
        case lastname
        case email
    }

    enum RegEx: String {
        case name = "[a-zA-Z]{1,20}"
        case email = "[a-zA-Z0-9-_]+@[a-zA-Z0-9-_]+\\.[a-zA-Z0-9]{2,}"
    }

    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""

        switch validType {
        case .name:
            regex = RegEx.name.rawValue
        case .lastname:
            regex = RegEx.name.rawValue
        case .email:
            regex = RegEx.email.rawValue
        }

        return NSPredicate(format: format, regex).evaluate(with: self)
    }

}
