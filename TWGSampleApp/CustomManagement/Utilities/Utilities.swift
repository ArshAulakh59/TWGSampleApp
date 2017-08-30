//
//  Extensions.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

//MARK:- Global Declarations
//Typealias
typealias PictureData = (picture: UIImage, caption: String)

//Constant
let ConfigurationUpdatedKey = "ConfigurationUpdated"

//Variable
var configuration: Configuration = Configuration() {
	didSet {
		NotificationCenter.default.post(name: Notification.Name(rawValue: ConfigurationUpdatedKey), object: nil)
	}
}

//Enumeration
enum Color: Int {
	case red = 0
	case blue = 1
	case gray = 2
	case green = 3
	case white = 4
	case yellow = 5
	
	var values: (index: Int, color: UIColor) {
		switch self {
		case .red:
			return (self.rawValue, UIColor(hex: 0xD0021B))
		case .blue:
			return (self.rawValue, UIColor(hex: 0x0177C0))
		case .gray:
			return (self.rawValue, UIColor.lightGray)
		case .green:
			return (self.rawValue, UIColor(hex: 0x21AC73))
		case .white:
			return (self.rawValue, UIColor.white)
		case .yellow:
			return (self.rawValue, UIColor(hex: 0xE3A522))
		}
	}
}
