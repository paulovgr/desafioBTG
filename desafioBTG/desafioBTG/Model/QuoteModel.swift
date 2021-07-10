//
//  QuoteModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation

struct QuoteModel {
    var value = Double()
    var key = String()

    init(_ value: Double, _ key: String) {
        self.key = key
        self.value = value
    }
}
