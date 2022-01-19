//
//  MainPresenter.swift
//  MVPTest
//
//  Created by MacBook on 13.01.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {

    func success()
    func failure(error: Error)

}

protocol MainViewPresenterProtocol: AnyObject {

    var comments: [Comment]? { get set }

    init(view: MainViewProtocol, service: ServiceProtocol, router: RouterProtocol)

    func getComments()
    func didTapOnComment(comment: Comment?)

}

class MainPresenter: MainViewPresenterProtocol {

    var comments: [Comment]?
    var router: RouterProtocol?
    weak var view: MainViewProtocol?
    let networkService: ServiceProtocol!

    required init(view: MainViewProtocol, service: ServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = service
        self.router = router

        getComments()
    }

    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            } 
        }
    }

    func didTapOnComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }


}
