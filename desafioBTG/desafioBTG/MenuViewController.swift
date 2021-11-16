//
//  MenuViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/11/21.
//

import UIKit

class MenuViewController: UIViewController {
    var coordinator: MenuCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let tableView = MenuTableView()
        view = tableView
        tableView.delegate = self
    }
}

extension MenuViewController: MenuDelegate {
    func goToPage (indexPath: Int) {
        coordinator?.goToPage(indexPath: indexPath)
    }
}
