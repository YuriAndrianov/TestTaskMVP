//
//  NetworkService.swift
//  MVPTest
//
//  Created by MacBook on 13.01.2022.
//

import Foundation

protocol ServiceProtocol {

    func getComments(completion: @escaping ((Result<[Comment]?, Error>) -> Void))

}

class NetworkService: ServiceProtocol {

    func getComments(completion: @escaping ((Result<[Comment]?, Error>) -> Void)) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(comments))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }

}
