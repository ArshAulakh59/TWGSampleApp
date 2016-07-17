//
//  TWGSampleAppUITests.swift
//  TWGSampleAppUITests
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import XCTest

//MARK:- Interface
class TWGSampleAppUITests: XCTestCase {
}

//MARK:- Implementation
extension TWGSampleAppUITests {
	//MARK: System
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
		XCUIApplication().launch()
	}
    
    override func tearDown() {
       super.tearDown()
    }
}

extension TWGSampleAppUITests {
	//MARK: Tests
	//Test Theme Change
	func testThemeChange() {
		//Get Table
		let tablesQuery = XCUIApplication().tables
		
		//Get Theme One Cell
		let themeColorOneCellsQuery = tablesQuery.cells.containingType(.StaticText, identifier:"Theme Color One:")
		//Get Theme Color One Selector
		let segmentedControl = themeColorOneCellsQuery.childrenMatchingType(.SegmentedControl).elementBoundByIndex(1)
		//Change Theme Color One
		segmentedControl.buttons["Red"].tap()
		
		//Get Theme Color Two Selector
		let segmentedControl2 = themeColorOneCellsQuery.childrenMatchingType(.SegmentedControl).elementBoundByIndex(0)
		//Change Theme Color One
		segmentedControl2.buttons["Yellow"].tap()
		segmentedControl.buttons["Green"].tap()
		segmentedControl2.buttons["White"].tap()
		segmentedControl.buttons["Yellow"].tap()
	}
	
	func testResettingThemeToDefault() {
		let app = XCUIApplication()
		
		let tabBarsQuery = app.tabBars
		let settingsButton = tabBarsQuery.buttons["Settings"]
		settingsButton.tap()
		
		let tablesQuery = app.tables
		tablesQuery.cells.containingType(.StaticText, identifier:"Theme Color One:").childrenMatchingType(.SegmentedControl).elementBoundByIndex(0).buttons["Blue"].tap()
		tablesQuery.buttons["Use Default Theme"].tap()
	}
}