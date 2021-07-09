//
//  CurrenciesViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import UIKit

class CurrenciesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view  = CurrenciesTableView()
        DesignSystem.setupTitle("Moedas", navegation: self)
    }

}
