//
//  MenuCoordinator.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/11/21.
//

import UIKit

class MenuCoordinator: MainCoordinatorProtocol {
    var children: [MainCoordinatorProtocol] = []
    var navagationController: UINavigationController

    init(navagationController: UINavigationController) {
        self.navagationController = navagationController
    }
    
    func start() {
        let controller = MenuViewController()
        controller.coordinator = self
        navagationController.pushViewController(controller, animated: true)
    }
}
