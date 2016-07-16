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
		
		//Configure Tab Bar
		tabBar.translucent = false
		
		//Handle Configurations
		applyConfigurations()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applyConfigurations), name: configurationUpdatedKey, object: nil)
	}

	//MARK: Configurations
	func applyConfigurations() {
		//Set Tab Bar Colors
		tabBar.barTintColor = configuration.themeColorOne
		tabBar.tintColor = configuration.themeColorTwo
		
		//Get Updated Attributes
		let tabBarButtonItemsTitleTextAttributes = [NSFontAttributeName: UIFont.thinFontOfSize(11), NSForegroundColorAttributeName: Color.Gray.values.color]
		let tabBarButtonItemsSelectedTitleTextAttributes = [NSFontAttributeName: UIFont.thinFontOfSize(11), NSForegroundColorAttributeName: configuration.themeColorTwo ?? Color.Blue.values.color]
		
		//Set Updated Attributes
		UITabBarItem.appearanceWhenContainedInInstancesOfClasses([MainTabController.self]).setTitleTextAttributes(tabBarButtonItemsTitleTextAttributes, forState: .Normal)
		UITabBarItem.appearanceWhenContainedInInstancesOfClasses([MainTabController.self]).setTitleTextAttributes(tabBarButtonItemsSelectedTitleTextAttributes, forState: .Selected)
	}
}