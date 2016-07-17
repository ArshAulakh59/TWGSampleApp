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
	//Test Onboarding Flow
    func testOnboardingFlow() {
		//Scroll Onboarding Scroll View
		let scrollViewsQuery = XCUIApplication().scrollViews
		let onboardingScrollView = scrollViewsQuery.childrenMatchingType(.Other).element
		onboardingScrollView.childrenMatchingType(.Other).elementBoundByIndex(0).swipeLeft()
		onboardingScrollView.childrenMatchingType(.Other).elementBoundByIndex(1).tap()
		onboardingScrollView.childrenMatchingType(.Other).elementBoundByIndex(2).tap()
		
		//Go to Gallery From Onboarding
		let getStartedButton = scrollViewsQuery.otherElements.buttons["Get Started"]
		getStartedButton.tap()
	}
	
	//Test Table Scrolling Performance
	func testTableScrolling() {
		let table = XCUIApplication().tables.elementBoundByIndex(0)
		XCTAssertLessThanOrEqual(table.tableRows.count, 100)
		
		//Only Do this check if cells less than 100
		measureBlock {
			let lastCell = table.cells.elementBoundByIndex(table.cells.count-1)
			table.scrollToElement(lastCell)
		}
	}

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
		//Check Default
		
	}
	
	func testOnboardingFlowFromSettings() {
		//Fetch And Click Onboarding Button
		
		
		//Click
		let element = XCUIApplication().childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
		element.tap()
		element.tap()
		element.tap()
		XCUIApplication().scrollViews.otherElements.buttons["Dismiss"].tap()
	}
}

extension XCUIElement {
	func scrollToElement(element: XCUIElement) {
		while !element.visible() {
			swipeUp()
		}
	}
	
	func visible() -> Bool {
		guard self.exists && !CGRectIsEmpty(self.frame) else { return false }
		return CGRectContainsRect(XCUIApplication().windows.elementBoundByIndex(0).frame, self.frame)
	}
}