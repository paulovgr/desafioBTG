//
//  CurrenciesListViewModelTest.swift
//  desafioBTGTests
//
//  Created by Paulo Victor Guimaraes Rosa on 11/07/21.
//

import XCTest
@testable import desafioBTG

class CurrenciesListViewModelTest: XCTestCase {
    var sut: CurrenciesListViewModel!


    override  func setUp() {
        sut = CurrenciesListViewModel(service: NetworkManagerMock())
        
    }
    
    func test() {
        XCTAssertNotNil(sut.currencies)
        XCTAssertNoThrow(sut.deleteData(bool: true, key: "3" ))
        XCTAssertNoThrow(sut.saveCurrenciesCoreData(CurrencyModel("", "", false)))
        XCTAssertNoThrow(sut.showMessage())
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
