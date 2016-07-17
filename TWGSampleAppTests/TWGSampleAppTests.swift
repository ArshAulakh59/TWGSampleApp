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
	//MARK: Properties
	//Constants
    let appDelegateObject = AppDelegate()
	let picturesControllerObject = PicturesController()
}

//MARK:- Implementation
extension TWGSampleAppTests {
	//MARK: System
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
}

extension TWGSampleAppTests {
	//MARK: Tests
	//Test Gallery Objects
	func testGalleryNotEmpty() {
		XCTAssertGreaterThan(picturesControllerObject.picturesDatasource.count, 0)
	}
}