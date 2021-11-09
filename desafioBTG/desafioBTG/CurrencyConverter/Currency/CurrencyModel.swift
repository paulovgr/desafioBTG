//
//  CurrencieModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation

struct CurrencyModel: Equatable {
    var value = String()
    var key = String()
    var isFavorited = Bool()
    
    init(_ value: String, _ key: String, _ isFavorited:Bool) {
        self.key = key
        self.value = value
        self.isFavorited = isFavorited
    }
    
}
