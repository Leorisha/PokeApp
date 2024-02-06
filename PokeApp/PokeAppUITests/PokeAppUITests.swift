//
//  PokeAppUITests.swift
//  PokeAppUITests
//
//  Created by Ana Neto on 06/02/2024.
//

import XCTest

final class PokeAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGoIntoDetail() throws {
      // UI tests must launch the application that they test.
      let app = XCUIApplication()
      app.launch()
      let elementsQuery = XCUIApplication().scrollViews.otherElements

      // Check if first screen elements are present.
      let bulbasaurInList = elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["Bulbasaur"]/*[[".buttons[\"Bulbasaur\"].staticTexts[\"Bulbasaur\"]",".staticTexts[\"Bulbasaur\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      XCTAssertTrue(bulbasaurInList.exists)

      // Tap list element
      bulbasaurInList.tap()

      // Check if detail is displayed
      let bulbasaurInDetail = elementsQuery.staticTexts["Name: bulbasaur"]
      XCTAssertTrue(bulbasaurInDetail.exists)
    }

  func testGoNextAndGoPrevious() throws {
    let app = XCUIApplication()
    app.launch()
    let elementsQuery = XCUIApplication().scrollViews.otherElements
    let ele1 =  elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["Bulbasaur"]/*[[".buttons[\"Bulbasaur\"].staticTexts[\"Bulbasaur\"]",".staticTexts[\"Bulbasaur\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    let ele2 =  elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["Spearow"]/*[[".buttons[\"Spearow\"].staticTexts[\"Spearow\"]",".staticTexts[\"Spearow\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    
    //Check if first screen is present
    XCTAssertTrue(ele1.exists)
    XCTAssertFalse(ele2.exists)

    // press next button
    app.buttons["Next"].tap()
    
    // Check if element in second list are being displayed
    XCTAssertTrue(ele2.exists)
    XCTAssertFalse(ele1.exists)

    // press previous
    app.buttons["Previous"].tap()

    //Check if first screen is present
    XCTAssertTrue(ele1.exists)
    XCTAssertFalse(ele2.exists)

  }
}
