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
	class func thinFontOfSize(size: CGFloat) -> UIFont {
		return UIFont.systemFontOfSize(size, weight: UIFontWeightThin)
	}
}

//Color
extension UIColor {
	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	convenience init(hex: Int) {
		self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
	}
}

//UIScrollView
extension UIScrollView {
	var currentPage: CGFloat {
		return round(self.contentOffset.x / self.frame.width)
	}
}