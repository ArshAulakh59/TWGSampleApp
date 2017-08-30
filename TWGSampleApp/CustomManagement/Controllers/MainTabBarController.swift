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
		NotificationCenter.default.removeObserver(self)
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
		NotificationCenter.default.addObserver(self, selector: #selector(applyConfigurations), name: NSNotification.Name(rawValue: ConfigurationUpdatedKey), object: nil)
	}

	//MARK: Initial Configurations 
	func applyInitialConfigurations() {
		//Configure Tab Bar
		//Set Translucency
		tabBar.isTranslucent = false
		applyConfigurations()
	}
	
	//MARK: Apply Configurations
	func applyConfigurations() {
		//Set Tab Bar Colors
		tabBar.barTintColor = configuration.secondaryThemeColor
		tabBar.tintColor = configuration.mainThemeColor
		
		//Set Updated Title Attributes
		setTabBarItemsColor(color: configuration.secondaryThemeColor != Color.gray.values.color ? Color.gray.values.color : UIColor.darkText.withAlphaComponent(0.25), forState: .normal)
		setTabBarItemsColor(color: configuration.mainThemeColor, forState: .selected)
		
		//Update Status Bar
		if configuration.secondaryThemeColor == Color.white.values.color {
			UIApplication.shared.setStatusBarStyle(.default, animated: false)
		} else {
			UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)
		}
	}
}

extension MainTabController {
	//MARK: Additionals
	//Set Title Color for TabBar Items
	func setTabBarItemsColor(color: UIColor, forState state: UIControlState) {
		if let items = tabBar.items {
			for item in items as [UITabBarItem] {
				item.setTitleTextAttributes([NSFontAttributeName: UIFont.thinFontOfSize(11), NSForegroundColorAttributeName: color], for: state)
			}
		}
	}
}
