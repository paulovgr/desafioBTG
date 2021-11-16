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
        //controller.de
        navagationController.pushViewController(controller, animated: true)
    }
    

}

extension MenuCoordinator {
    func goToPage (indexPath: Int) {
        switch indexPath {
        case 0:
            let coordinator = ConversionCoordinator(navagationController: navagationController, parent: self)
            coordinator.start()
            children.append(coordinator)
            
        default:
            break;
        }
    }
    
    func backTap(coordinator: MainCoordinatorProtocol) {
        children.removeAll {
            $0 is ConversionCoordinator
        }
        navagationController.popViewController(animated: true)
    }
}
