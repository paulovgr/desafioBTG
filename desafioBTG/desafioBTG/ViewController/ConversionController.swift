//
//  ViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import UIKit

class ConversionController: UIViewController, CurrencyDelegate{

    
    func PassCurrencies() {
        print("oi")
    }
    
    let viewModel  = CurrenciesListViewModel()
    let quotesViewModel = QuotesViewModel()
    var convertQuote : QuoteModel?
    var destinyQuote : QuoteModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: "loadData") {
            defaults.set(true, forKey: "loadData")
            viewModel.setCurrencies()
            
        } 
        DesignSystem.setupTitle("Conversão", navegation: self)
    }
    
    override func loadView() {
        let conversionView = ConversionView()
        view = conversionView
        conversionView.convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
        conversionView.destinyButton.addTarget(self, action: #selector(destinyButtonTap), for: .touchUpInside)
        conversionView.originButton.addTarget(self, action: #selector(originButtonTap), for: .touchUpInside)
        
        
    }
    @objc func convertButtonTapped() {
        print(quotesViewModel.selectedCurrencies)

    }
    
    @objc func destinyButtonTap() {
        self.navigationController?.pushViewController(CurrenciesViewController(), animated: true)
        
    }
    
    @objc func originButtonTap() {
        self.navigationController?.pushViewController(CurrenciesViewController(), animated: true)
  
    }
    
}

extension ConversionController {
    func setupTitle(_ title: String)  {
        self.navigationController?.navigationBar.topItem?.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}



