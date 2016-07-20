//
//  MainTabBarController.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

//MARK:- Interface
class MainTabController: UITabBarController {
	//MARK: Deinitilization
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
}

//MARK:- Implementation
extension MainTabController {
	//MARK: System
	override func viewDidLoad() {
		super.viewDidLoad()
		applyInitialConfigurations()
		
		//Handle Configurations
		applyConfigurations()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applyConfigurations), name: ConfigurationUpdatedKey, object: nil)
	}

	//MARK: Initial Configurations 
	func applyInitialConfigurations() {
		//Configure Tab Bar
		//Set Translucency
		tabBar.translucent = false
		applyConfigurations()
	}
	
	//MARK: Apply Configurations
	func applyConfigurations() {
		//Set Tab Bar Colors
		tabBar.barTintColor = configuration.secondaryThemeColor
		tabBar.tintColor = configuration.mainThemeColor
		
		//Set Updated Title Attributes
		setTabBarItemsColor(configuration.secondaryThemeColor != Color.Gray.values.color ? Color.Gray.values.color : UIColor.darkTextColor().colorWithAlphaComponent(0.25), forState: .Normal)
		setTabBarItemsColor(configuration.mainThemeColor, forState: .Selected)
		
		//Update Status Bar
		if configuration.secondaryThemeColor == Color.White.values.color {
			UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: false)
		} else {
			UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
		}
	}
}

extension MainTabController {
	//MARK: Additionals
	//Set Title Color for TabBar Items
	func setTabBarItemsColor(color: UIColor, forState state: UIControlState) {
		if let items = tabBar.items {
			for item in items as [UITabBarItem] {
				item.setTitleTextAttributes([NSFontAttributeName: UIFont.thinFontOfSize(11), NSForegroundColorAttributeName: color], forState: state)
			}
		}
	}
}