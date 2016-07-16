//
//  Extensions.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

//MARK:- Globals
//Constants
let configurationUpdatedKey = "ConfigurationUpdated"

//Variables
var configuration: Configuration = Configuration()

//Colors
enum Color: Int {
	case Red = 0xD0021B
	case Blue = 0x0177C0
	case Gray = 0x2C384B
	case Green = 0x21AC73
	case White = 0xFFFFFF
	case Yellow = 0xE3A522
	
	var colorValue: UIColor {
		return UIColor(hex: self.rawValue)
	}
}

//Typealises
typealias PictureData = (picture: UIImage, caption: String)