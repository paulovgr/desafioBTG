//
//  Utils.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 10/07/21.
//

import Foundation
import Foundation
import UIKit

class Utils {
    static func setupAlert(title: String, message: String, viewController: UIViewController) {
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
