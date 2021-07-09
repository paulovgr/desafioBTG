//
//  CurrenciesList.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation

struct CurrenciesListModel: Decodable {
    let success:  Bool
    let currencies: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case success
        case currencies
    }
}


