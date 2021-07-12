//
//  Utils.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 10/07/21.
//

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
    
    static func removeCaracters(word: String, num: Int) -> String {
       var word = word
       while word.count != num {
           word.remove(at: word.index(word.startIndex, offsetBy: 0))
       }
       return word
   }
}
