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
	
	override func tearDown() {
		super.tearDown()
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
		let customizeButton = tabBar.buttons["Customize"]
		customizeButton.tap()
		
		//Fetch Table
		let settingsTable = app.tables
		
		//Fetch Cell
		let customThemeCell = settingsTable.cells.containing(.staticText, identifier: "Primary Color:").element
		
		//Get Segment Control
		let themeColorOneSegmentControl = customThemeCell.children(matching: .segmentedControl).element(boundBy: 0)
		
		//Change Theme Main Color
		let redButton = themeColorOneSegmentControl.buttons["Red"]
		redButton.tap()
		let blueButton = themeColorOneSegmentControl.buttons["Blue"]
		blueButton.tap()
		let grayButton = themeColorOneSegmentControl.buttons["Gray"]
		grayButton.tap()
		let greenButton = themeColorOneSegmentControl.buttons["Green"]
		greenButton.tap()
		let yellowButton = themeColorOneSegmentControl.buttons["Yellow"]
		yellowButton.tap()
	}
	
	//Test Resetting Theme
	func testResettingThemeToDefault() {
		//Get Application
		let app = XCUIApplication()
		
		//Get Tab bar and go to settings
		let tabBar = app.tabBars
		let customizeButton = tabBar.buttons["Customize"]
		customizeButton.tap()
		
		//Fetch Table
		let settingsTable = app.tables
		
		//Change to custom theme before resetting
		let customThemeCell = settingsTable.cells.containing(.staticText, identifier: "Primary Color:").element
		let themeColorOneSegmentControl = customThemeCell.children(matching: .segmentedControl).element(boundBy: 0)
		let redButton = themeColorOneSegmentControl.buttons["Red"]
		redButton.tap()
		
		//Reset To Default Theme
		let resetThemeButton = settingsTable.buttons["Reset Theme"]
		resetThemeButton.tap()
	}
}
