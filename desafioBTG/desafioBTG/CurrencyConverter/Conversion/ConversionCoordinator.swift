//
//  ConversionCoordinator.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 28/10/21.
//

import Foundation
import UIKit
import Network

class ConversionCoordinator: MainCoordinatorProtocol {
    var children: [MainCoordinatorProtocol] = []
    var navagationController: UINavigationController
    weak var parent: MenuCoordinator?
    
    init (navagationController: UINavigationController, parent: MenuCoordinator) {
        self.navagationController = navagationController
        self.parent = parent
    }
    
    
    func start() {
        let controller = ConversionViewController()
        controller.coordinator = self
        navagationController.pushViewController(controller, animated: true)
    }
    
    func goToCurrenciesView(buttonSeleted: String) {
        let view = CurrenciesViewController()
        view.buttonSeleted = buttonSeleted
        navagationController.pushViewController(view, animated: true)
    }
    
    func backTap () {
        parent?.backTap(coordinator: self)
    }
}
