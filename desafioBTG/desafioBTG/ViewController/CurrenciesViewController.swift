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
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view  = CurrenciesTableView()
        DesignSystem.setupTitle("Moedas", navegation: self)
    }

}
