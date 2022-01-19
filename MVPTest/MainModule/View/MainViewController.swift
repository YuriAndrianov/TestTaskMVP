//
//  ViewController.swift
//  MVPTest
//
//  Created by MacBook on 13.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let comment = presenter.comments?[indexPath.row]

        var content = cell.defaultContentConfiguration()

        // Configure content.
        content.image = UIImage(systemName: "star")
        content.text = comment?.body
        content.secondaryText = comment?.name

        // Customize appearance.
        content.imageProperties.tintColor = .purple

        cell.contentConfiguration = content

        return cell
    }

}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        presenter.didTapOnComment(comment: comment )
    }

}

extension MainViewController: MainViewProtocol {

    func success() {
        tableView.reloadData()
    }

    func failure(error: Error) {
        print("Error:", error.localizedDescription)
    }

}

