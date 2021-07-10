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
    let controllere = CurrenciesViewController()
    let conversionView = ConversionView()

//    var convertQuote : QuoteModel?
//    var destinyQuote : QuoteModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.delegateError = self
        setupViewModels()
        controllere.delegate = self
        
        DesignSystem.setupTitle("Conversão", navegation: self)
     //   print(quotesViewModel.convertValue(from: 0.7224, to: 0.843))
    }

    override func loadView() {
        view = conversionView
        setupButtonActions(conversionView)
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        let userDefault = UserDefaults.standard
        guard let data = userDefault.string(forKey: "destinyButtonKey") else   {
return


        }
        
        let moeda = QuoteModel(userDefault.double(forKey: "destinyButtonValue"),
                               Utils.removeCaracters(word: data, num: 3))
        conversionView.destinyButton.setTitle(moeda.key, for: .normal)
        
        guard let data2 = userDefault.string(forKey: "originButtonKey")  else {
           return

        }
        let moeda2 = QuoteModel(userDefault.double(forKey: "originButtonKey"),
                               Utils.removeCaracters(word: data2, num: 3))
        conversionView.originButton.setTitle(moeda2.key, for: .normal)
        
        print(moeda2)
        print(moeda)
        print(quotesViewModel.convertValue(from: moeda.value, to: moeda2.value))
        conversionView.setText("De \(moeda2.key) Para: \(moeda.key) = \(quotesViewModel.convertValue(from: moeda2.value, to: moeda.value))")

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
        let view = CurrenciesViewController()
        view.buttonSeleted = "destinyButton"
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    @objc func originButtonTap() {
        let view = CurrenciesViewController()
        view.buttonSeleted = "originButton"
        self.navigationController?.pushViewController(view, animated: true)
    }
}



