//
//  ViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import UIKit


class ConversionViewController: UIViewController{
    private let viewModel  = CurrenciesListViewModel()
    private let quotesViewModel = QuotesListViewModel()
//    var convertQuote : QuoteModel?
//    var destinyQuote : QuoteModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.delegateError = self
        setupViewModels()
        
        DesignSystem.setupTitle("Conversão", navegation: self)
        print(quotesViewModel.convertValue(from: 0.7224, to: 0.843))
    }

    override func loadView() {
        let conversionView = ConversionView()
        view = conversionView
        setupButtonActions(conversionView)
    }
    
}

extension ConversionViewController: CurrencyDelegate{
    func PassCurrencies() {
        print("oi")
    }
}

extension ConversionViewController:  MessageDelegate {
    func showMessage() {
        Utils.setupAlert(title: "ERRO" , message: "Falha na conexão", viewController: self)
    }
}

extension ConversionViewController {
    private func setupButtonActions(_ conversionView: ConversionView) {
        conversionView.convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
        conversionView.destinyButton.addTarget(self, action: #selector(destinyButtonTap), for: .touchUpInside)
        conversionView.originButton.addTarget(self, action: #selector(originButtonTap), for: .touchUpInside)
    }
    
    private func setupViewModels() {
        quotesViewModel.setQuotes()
        if !UserDefaults.standard.bool(forKey: "loadData") {
            viewModel.setCurrencies()
        }
    }
    
    @objc func convertButtonTapped() {
        
    }
    
    @objc func destinyButtonTap() {
        self.navigationController?.pushViewController(CurrenciesViewController(), animated: true)
        
    }
    
    @objc func originButtonTap() {
        self.navigationController?.pushViewController(CurrenciesViewController(), animated: true)
        
    }
}



