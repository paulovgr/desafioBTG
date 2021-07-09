//
//  QuotesViewModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation

class QuotesViewModel   {
    private var service = NetworkManager()
    
    func requestQuote(completion: @escaping (Result<QuotesListModel, Error>) -> Void) {
        service.request(endpoint: .live, initials: "USD" , completion: completion)
    }
    
    func setQuotes()  {
        requestQuote { [self] result in
            switch result {
            case .success(let data):

                    print(data)
               
                
            case .failure(let anError):
                print(anError)

            }
        }
    }
}

