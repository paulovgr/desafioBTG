//
//  ConversionModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation
import UIKit

struct QuotesListModel: Decodable {
    let  source: String
    let quotes: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case quotes
        case source
    }
}
