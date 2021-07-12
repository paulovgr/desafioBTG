//
//  ConversionViewControllerTest.swift
//  desafioBTGTests
//
//  Created by Paulo Victor Guimaraes Rosa on 11/07/21.
//

import XCTest
@testable import desafioBTG

class CurrenciesTableViewTest: XCTestCase {
    var service: NetworkManagerMock!
    var sut : CurrenciesTableView!
    var quoteModel = QuoteModel(12, "12" )
    
    
    override  func setUp() {
        sut = CurrenciesTableView(service: NetworkManagerMock())
        sut.quote = quoteModel
        service = NetworkManagerMock()
        super.setUp()
        
    }
    func test() {
        XCTAssertNotNil(sut.currencies)
        XCTAssertNotNil(sut.currenciesTableView)
        XCTAssertNotNil(sut.currenciesTableView.dataSource)
        XCTAssertNotNil(sut.currenciesTableView.delegate)
        XCTAssertEqual(sut.quote, quoteModel)
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))

    }
    
    override  func tearDown() {
        sut = nil
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
