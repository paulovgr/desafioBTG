//
//  UtilsMock.swift
//  desafioBTGTests
//
//  Created by Paulo Victor Guimaraes Rosa on 11/07/21.
//

import Foundation
@testable import desafioBTG

class UtilsMock: Utils {
      func removeCaracters(word: String, num: Int) -> String {
       var word = word
       while word.count != num {
           word.remove(at: word.index(word.startIndex, offsetBy: 0))
       }
       return word
   }
}
