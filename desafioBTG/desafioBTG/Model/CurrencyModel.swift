//
//  CurrencieModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation

struct CurrencyModel {
    var value = String()
    var key = String()
    var isFavorited = Bool()
    
    init(_ value: String, _ key: String) {
        self.key = key
        self.value = value
    }
    
}
