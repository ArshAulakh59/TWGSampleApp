//
//  Extensions.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

//MARK:- Extensions
//Font
extension UIFont {
	//Convenience method to get thin system font for a given size
	class func thinFontOfSize(size: CGFloat) -> UIFont {
		return UIFont.systemFontOfSize(size, weight: UIFontWeightThin)
	}
}

//Color
extension UIColor {
	//Convenience method to get UIColor from hex value
	convenience init(hex: Int) {
		self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
	}
	
	//Convenience method to initialize UIColor with Int values and without alpha value
	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
}