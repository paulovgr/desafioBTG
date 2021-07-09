//
//  QuoteModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation

struct QuoteModel {
        var source = String()
    var value = Double()

    init(_ source: String,  _ value: Double) {
        self.source = source
        self.value = value
    }
}
