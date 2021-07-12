//
//  ConversionViewTest.swift
//  desafioBTGTests
//
//  Created by Paulo Victor Guimaraes Rosa on 11/07/21.
//

import XCTest
@testable import desafioBTG

class ConversionViewTest: XCTestCase {
    var sut: ConversionViewController!
    var quote = QuoteModel(12, "BR")
    var Currency = CurrencyModel("12", "BR", false)

    override  func setUp() {
        sut = ConversionViewController()
        
        super.setUp()
        
    }
    
    func teste()  {
        XCTAssertEqual(sut.getConversionView().getTextField(), String())
        sut.isEqual(ConversionViewController())
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
