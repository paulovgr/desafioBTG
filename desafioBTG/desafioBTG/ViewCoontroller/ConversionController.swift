//
//  ViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import UIKit

class ConversionController: UIViewController, CurrencyDelegate {
    func PassCurrencies() {
        self.navigationController?.pushViewController(CurrenciesViewController(), animated: true)
    }
    
    let viewModel  = CurrenciesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self

        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: "loadData") {
            defaults.set(true, forKey: "loadData")
            viewModel.setQuotes()

        } else {
            PassCurrencies()

        }
        DesignSystem.setupTitle("Conversão", navegation: self)
    
    }

    override func loadView() {
        view = ConversionView()
    }

}

//fazer funcao
extension ConversionController {
    func setupTitle(_ title: String)  {
        self.navigationController?.navigationBar.topItem?.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}



