//
//  Coordinator .swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import Foundation
import UIKit
protocol Coordinator {
  func start()

}

class MainCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var conversionController: ConversionController?
    
    init(presenter: UINavigationController) {
         self.presenter = presenter
    }
    func start() {
        let conversionController = ConversionController()
            self.conversionController = conversionController
              
              presenter.pushViewController(conversionController, animated: true)
    }
    
   
    
  
}
