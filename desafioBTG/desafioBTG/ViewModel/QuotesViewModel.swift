//
//  QuotesViewModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation
protocol QuoteDelegate: AnyObject {
    func PassQuote(_ value: Double)
    
}

class QuotesViewModel   {
    private var service = NetworkManager()
    var selectedCurrencies  = Double()

    func requestQuote(initials: String, completion: @escaping (Result<QuotesListModel, Error>) -> Void) {
        service.request(endpoint: .live, initials: initials , completion: completion)
    }
    
    func setQuotes(initials: String)  {
        requestQuote(initials: initials) { [self] result in
            switch result {
            case .success(let data):

                let datas = Array(data.quotes.map{$0})
                for data in datas {
                    selectedCurrencies = data.value
                }
                                
            case .failure(_):
                setQuotes(initials: initials)

            }
        }
    }
    
    func convertValue(from: Double, to: Double) -> Double{
        return from/to
    }
}

