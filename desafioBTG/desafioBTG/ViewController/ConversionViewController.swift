//
//  ViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import UIKit


class ConversionViewController: UIViewController,QuoteDelegate {
    func PassQuote(_ value: Any) {
        print(value)
    }
    
    private let viewModel  = CurrenciesListViewModel()
    private let quotesViewModel = QuotesListViewModel()
    private let conversionView = ConversionView()
    
    private var originQuote: QuoteModel?
    private var destinyQuote: QuoteModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.delegateError = self
        setupViewModels()
        
        DesignSystem.setupTitle("Conversão", navegation: self)
    }
    
    override func loadView() {
        view = conversionView
        setupButtonActions(conversionView)
    }
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        setupViewComponents()
        
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
    
    
    private func setupViewComponents() {
        conversionView.destinyButton.setTitle(setupDestinyModel().key, for: .normal)
        conversionView.originButton.setTitle(setupOriginModel().key, for: .normal)
        conversionView.setText("")
    }
    
    private func setupViewModels() {
        quotesViewModel.setQuotes()
        if !UserDefaults.standard.bool(forKey: "loadData") {
            viewModel.setCurrencies()
        }
    }
    
    @objc func convertButtonTapped() {
        showResult(originQuote: setupOriginModel(), destinyQuote: setupDestinyModel())
        
    }
    
    @objc func destinyButtonTap() {
        let view = CurrenciesViewController()
        view.buttonSeleted = "destinyButton"
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    @objc func originButtonTap() {
        let view = CurrenciesViewController()
        view.buttonSeleted = "originButton"
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    private func setupOriginModel () -> QuoteModel{
        let userDefault = UserDefaults.standard
        
        
        if let key = userDefault.string(forKey: "originButtonKey")    {
            originQuote = QuoteModel(userDefault.double(forKey: "originButtonValue"),
                                     Utils.removeCaracters(word: key, num: 3))
            
        }
        
        guard let originQuote = originQuote else { return QuoteModel(0, "") }
        return originQuote
        
    }
    
    private func setupDestinyModel () -> QuoteModel {
        let userDefault = UserDefaults.standard
        
        
        if let key = userDefault.string(forKey: "destinyButtonKey") {
            destinyQuote = QuoteModel(userDefault.double(forKey: "destinyButtonValue"),
                                      Utils.removeCaracters(word: key, num: 3))
        }
        
        guard let destinyQuote = destinyQuote else { return QuoteModel(0, "") }
        return destinyQuote
    }
    
    private func showResult(originQuote: QuoteModel, destinyQuote: QuoteModel) {
        if let userInput = Double(conversionView.getTextField()) {
            let result = quotesViewModel.convertValue(from: originQuote.value, to: destinyQuote.value, value: userInput)
            conversionView.setText("De \(originQuote.key) " +
                                    "Para: \(destinyQuote.key) " +
                                    "= \(String(format: "%.2f", result))")
            conversionView.colorTextField(.black)

        } else {
            conversionView.setText("Insira um valor")
            conversionView.colorTextField(.red)
        }
        
        
        
    }
}



