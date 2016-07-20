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
	override func setUp() {
		super.setUp()
		continueAfterFailure = false
		XCUIApplication().launch()
	}
}

//MARK:- Implementation
extension TWGSampleAppUITests {
	//MARK: Tests
	//Test Theme Change
	func testThemeChange() {
		//Get Application
		let app = XCUIApplication()
		
		//Get Tab bar and go to settings
		let tabBar = app.tabBars
		let settingsButton = tabBar.buttons["Settings"]
		settingsButton.tap()
		
		//Fetch Table
		let settingsTable = app.tables
		
		//Fetch Cell
		let customThemeCell = settingsTable.cells.containingType(.StaticText, identifier: "Theme Color One:").element
		
		//Get Segment Control
		let themeColorTwoSegmentControl = customThemeCell.childrenMatchingType(.SegmentedControl).elementBoundByIndex(1)
		
		//Change Theme Second Color
		let redButton = themeColorTwoSegmentControl.buttons["Red"]
		redButton.tap()
		let blueButton = themeColorTwoSegmentControl.buttons["Blue"]
		blueButton.tap()
		let grayButton = themeColorTwoSegmentControl.buttons["Gray"]
		grayButton.tap()
		let greenButton = themeColorTwoSegmentControl.buttons["Green"]
		greenButton.tap()
		let yellowButton = themeColorTwoSegmentControl.buttons["Yellow"]
		yellowButton.tap()
	}
	
	//Test Resetting Theme
	func testResettingThemeToDefault() {
		//Get Application
		let app = XCUIApplication()
		
		//Get Tab bar and go to settings
		let tabBar = app.tabBars
		let settingsButton = tabBar.buttons["Settings"]
		settingsButton.tap()
		
		//Fetch Table
		let settingsTable = app.tables
		
		//Change to custom theme before resetting
		let customThemeCell = settingsTable.cells.containingType(.StaticText, identifier: "Theme Color One:").element
		let themeColorTwoSegmentControl = customThemeCell.childrenMatchingType(.SegmentedControl).elementBoundByIndex(1)
		let redButton = themeColorTwoSegmentControl.buttons["Red"]
		redButton.tap()
		
		//Reset To Default Theme
		let defaultThemeButton = settingsTable.buttons["Use Default Theme"]
		defaultThemeButton.tap()
	}
}