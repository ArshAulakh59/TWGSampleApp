//
//  Extensions.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

//MARK:- Global Declarations
//Constant
let configurationUpdatedKey = "ConfigurationUpdated"

//Variable
var configuration: Configuration = Configuration() {
	didSet {
		NSNotificationCenter.defaultCenter().postNotificationName(configurationUpdatedKey, object: nil)
	}
}

//Enumeration
enum Color: Int {
	case Red = 0
	case Blue = 1
	case Gray = 2
	case Green = 3
	case White = 4
	case Yellow = 5
	
	var values: (index: Int, color: UIColor) {
		switch self {
		case .Red:
			return (self.rawValue, UIColor(hex: 0xD0021B))
		case .Blue:
			return (self.rawValue, UIColor(hex: 0x0177C0))
		case .Gray:
			return (self.rawValue, UIColor.lightGrayColor())
		case .Green:
			return (self.rawValue, UIColor(hex: 0x21AC73))
		case .White:
			return (self.rawValue, UIColor.whiteColor())
		case .Yellow:
			return (self.rawValue, UIColor(hex: 0xE3A522))
		}
	}
}

//Typealias
typealias PictureData = (picture: UIImage, caption: String)