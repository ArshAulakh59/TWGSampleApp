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
	let picturesControllerObject = PicturesController()
}

//MARK:- Implementation
extension TWGSampleAppTests {
	//MARK: Tests
	//Test Gallery Objects
	func testGalleryNotEmpty() {
		print(picturesControllerObject.picturesDatasource.count)
		XCTAssertGreaterThan(picturesControllerObject.picturesDatasource.count, 0)
	}
}