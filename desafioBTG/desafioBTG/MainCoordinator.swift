//
//  MainCoordinator.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 28/10/21.
//

import Foundation
import UIKit

//1
protocol MainCoordinatorProtocol {
    func start()
    var children: [MainCoordinatorProtocol] {get set}
    var navagationController: UINavigationController  {get set}
}

class MainCoordinator: MainCoordinatorProtocol {
    var children: [MainCoordinatorProtocol] = []
    var navagationController: UINavigationController

    init (navagationController: UINavigationController) {
        self.navagationController = navagationController
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
 
}
