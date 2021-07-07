//
//  CurrenciesListViewModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation

class CurrenciesListViewModel   {
    //Injeçào de dependencia
    private var service = NetworkManager()
    
    init() {
        
    }
    
    func getQuotes(completion: @escaping (Result<CurrenciesListModel, Error>) -> Void) {
        service.request(completion: completion)
    }
    
    func setQuotes()  {
        getQuotes { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let anError):
                print(anError)

            }
        }
    }
}






