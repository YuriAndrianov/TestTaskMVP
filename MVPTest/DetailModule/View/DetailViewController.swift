//
//  DetailViewController.swift
//  MVPTest
//
//  Created by MacBook on 13.01.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setComment()
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        presenter.tap()
    }
}

extension DetailViewController: DetailViewProtocol {

    func setComment(comment: Comment?) {
        self.label.text = comment?.body 
    }

}
