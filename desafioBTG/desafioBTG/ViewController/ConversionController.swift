//
//  ViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import UIKit


class ConversionController: UIViewController, CurrencyDelegate, MessageDelegate{
    fileprivate func setupAlert(title: String, message: String, viewController: UIViewController) {
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    func showMessage() {
        setupAlert(title: "ERRO" , message: "Falha na conexão", viewController: self)
    }
    
    
    
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
        viewModel.delegateError = self
        quotesViewModel.setQuotes()
        
        if !UserDefaults.standard.bool(forKey: "loadData") {
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



