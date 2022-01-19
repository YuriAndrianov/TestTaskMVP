//
//  DetailPresenter.swift
//  MVPTest
//
//  Created by MacBook on 13.01.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {

    func setComment(comment: Comment?)

}

protocol DetailViewPresenterProtocol: AnyObject {

    init(view: DetailViewProtocol, router: RouterProtocol, comment: Comment?)

    func setComment()
    func tap()

}

class DetailPresenter: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    var comment: Comment?
    var router: RouterProtocol

    required init(view: DetailViewProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.router = router
        self.comment = comment
    }

    func setComment() {
        view?.setComment(comment: comment)
    }

    func tap() {
        router.popToRoot()
    }




}
