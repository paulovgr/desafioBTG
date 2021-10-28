//
//  ViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import UIKit


class ConversionViewController: UIViewController {

    private let service = NetworkManager()
    private var currenciesViewModel = CurrenciesListViewModel(service: NetworkManager())
    private var quotesViewModel = QuotesListViewModel(service: NetworkManager())
    private let conversionView = ConversionView()
    private var originQuote: QuoteModel?
    private var destinyQuote: QuoteModel?
    var coordinator: MainCoordinator?


    override func viewDidLoad() {
        super.viewDidLoad()
        currenciesViewModel.delegateError = self
        setupViewModels()
    }
    
    override func loadView() {
        view = conversionView
        setupButtonActions(conversionView)
    }

    override func viewDidAppear(_ animated: Bool) {
        setupViewComponents()
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
        DesignSystem.setupTitle("Conversão", navegation: self)
        conversionView.destinyButton.setTitle(setupDestinyModel().key, for: .normal)
        conversionView.originButton.setTitle(setupOriginModel().key, for: .normal)
        conversionView.setText("")
    }
    
    private func setupViewModels() {
        quotesViewModel.setQuotes()
        if !UserDefaults.standard.bool(forKey: "loadData") {
            currenciesViewModel.setCurrencies()
        }
    }
    
    @objc func convertButtonTapped() {
        showResult(originQuote: setupOriginModel(), destinyQuote: setupDestinyModel())
    }
    
    @objc func destinyButtonTap() {
        coordinator?.goToCurrenciesView(buttonSeleted: "destinyButton")
    }
    
    @objc func originButtonTap() {
        coordinator?.goToCurrenciesView(buttonSeleted: "originButton")
    }
    
    private func setupOriginModel () -> QuoteModel{
        let userDefault = UserDefaults.standard
        
        
        if let key = userDefault.string(forKey: "originButtonKey")    {
            originQuote = QuoteModel(userDefault.double(forKey: "originButtonValue"),
                                     Utils.removeCaracters(word: key, num: 3))
        }

        guard let originQuote = originQuote else { return QuoteModel(0, "$") }
        return originQuote
        
    }
    
    private func setupDestinyModel () -> QuoteModel {
        let userDefault = UserDefaults.standard
        
        if let key = userDefault.string(forKey: "destinyButtonKey") {
            destinyQuote = QuoteModel(userDefault.double(forKey: "destinyButtonValue"),
                                      Utils.removeCaracters(word: key, num: 3))
        }
        
        guard let destinyQuote = destinyQuote else { return QuoteModel(0, "$") }
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
    
    func getConversionView() -> ConversionView {
        return conversionView
    }
}



