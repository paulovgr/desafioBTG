//
//  CurrencieModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation

struct CurrencieModel {
    var value = String()
    var key = String()
    
    init(_ value: String, _ key: String) {
        self.key = key
        self.value = value
    }
    
}
