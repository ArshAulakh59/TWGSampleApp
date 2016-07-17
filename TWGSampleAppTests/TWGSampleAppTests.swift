//
//  TWGSampleAppTests.swift
//  TWGSampleAppTests
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import XCTest
@testable import TWGSampleApp

//MARK:- Interface
class TWGSampleAppTests: XCTestCase {
    let appDelegateObject = AppDelegate()
	let picturesControllerObject = PicturesController()
}

//MARK:- Implementation
extension TWGSampleAppTests {
	//MARK: System
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
}

extension TWGSampleAppTests {
	//MARK: Tests
	//Test First Launch And Onboarding
	func testFirstLaunch() {
		if NSUserDefaults.standardUserDefaults().boolForKey("launchedBefore") {
			XCTAssertTrue(appDelegateObject.isFirstLaunch, "Is Not First Time Launch")
		} else {
			XCTAssertFalse(appDelegateObject.isFirstLaunch, "Is First Time Launch")
		}
	}
	
	func testOnboarding() {
		if appDelegateObject.isFirstLaunch {
			
		} else {
			XCTAssertNil("", "")
		}
	}
	
	//Test Gallery
	func testNumberOfPicturesInGallery() {
		
	}
}

extension TWGSampleAppTests {
	//MARK: Performance Test
	func sampleTestPerformanceMethod() {
		// This is an example of a performance test case.
		self.measureBlock {
			// Put the code you want to measure the time of here.
		}
	}
}