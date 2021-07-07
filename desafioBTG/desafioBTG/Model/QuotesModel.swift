//
//  ConversionModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation
import UIKit

struct QuotesModel: Decodable {
    let success:  Bool
    let quotes: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case success
        case quotes
    }
}
