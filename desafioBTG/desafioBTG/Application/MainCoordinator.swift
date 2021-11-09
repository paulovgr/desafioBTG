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
        let conversionCoordinator =  ConversionCoordinator(navagationController: navagationController)
        children.append(conversionCoordinator)
        conversionCoordinator.start()
    }
 
}
