//
//  CurrenciesViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import UIKit

class CurrenciesViewController: UIViewController {
    var buttonSeleted = ""
    let viewTable = CurrenciesTableView()
    weak var delegate: QuoteDelegate?

    override func loadView() {
        view  = viewTable
        
        DesignSystem.setupTitle("Moedas", navegation: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        guard let data = viewTable.quote else {
            return
        }
        UserDefaults.standard.set(data.key, forKey: buttonSeleted + "Key")
        UserDefaults.standard.set(data.value, forKey: buttonSeleted + "Value")
  
        
    }

}
