//
//  QuotesListViewModelTest.swift
//  desafioBTGTests
//
//  Created by Paulo Victor Guimaraes Rosa on 30/11/21.
//

import XCTest
@testable import desafioBTG


class QuotesListViewModelTest: XCTestCase {
    var service = NetworkManager()
    lazy var sut = QuotesListViewModel(service: service)
    
    func testConvertValue_whenFromEqualsOne_shouldToTimesValue(){
        //1) Setup
        var result = Double()

        //2) Exercitar
        result = sut.convertValue(from: 1, to: 5, value: 10)
        
        //3) Verify
        XCTAssertEqual(result, 5*10)
    }
    
    func testConvertValue_whenFromIsntOne_shouldDivideFromTimesValue(){
        var result = Double()
        
        result = sut.convertValue(from: 2, to: 5, value: 10)
        
        XCTAssertEqual(result, 5/2 * 10)
    }
    
    func testConvertValue_whenFromIsNegative_shouldDivideFromTimesValue(){
        var result = Double()
        
        result = sut.convertValue(from: -2, to: 5, value: 10)
        
        XCTAssertEqual(result, 5/(-2) * 10)
    }

}
