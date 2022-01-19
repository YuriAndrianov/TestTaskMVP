//
//  Comment.swift
//  MVPTest
//
//  Created by MacBook on 13.01.2022.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
