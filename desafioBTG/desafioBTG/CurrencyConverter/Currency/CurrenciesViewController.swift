//
//  CurrenciesViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import UIKit

class CurrenciesViewController: UIViewController {
    private let service = NetworkManager()

    var buttonSeleted = ""
    let viewTable: CurrenciesTableView?

    required init() {
        self.viewTable = CurrenciesTableView(service: service)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view  = viewTable
        DesignSystem.setupTitle("Moedas", navegation: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        setupValue()
    }

}

extension CurrenciesViewController {
    func setupValue() {
        guard let viewTableQuote = viewTable?.quote else{
            return
        }
        let data = viewTableQuote

        UserDefaults.standard.set(data.key, forKey: buttonSeleted + "Key")
        UserDefaults.standard.set(data.value, forKey: buttonSeleted + "Value")
    }
}
