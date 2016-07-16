//
//  SettingsController.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
	@IBOutlet weak var themeColorOneLabel: UILabel!
	@IBOutlet weak var themeColorOneSegmentColor: UISegmentedControl!
	@IBOutlet weak var themeColorTwoLabel: UILabel!
	@IBOutlet weak var themeColorTwoSegmentControl: UISegmentedControl!
	
	//MARK: Deinitilization
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
}

extension SettingsController {
	//MARK: System
	override func viewDidLoad() {
		super.viewDidLoad()
		applyConfigurations()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applyConfigurations), name: configurationUpdatedKey, object: nil)
	}
	
	//MARK: Apply Configurations
	func applyConfigurations() {
		tableView.backgroundColor = configuration.settingsConfiguration.backgroundColor
		navigationController?.navigationBar.barTintColor = configuration.settingsConfiguration.navigationBarTintColor
		navigationController?.navigationBar.tintColor = configuration.settingsConfiguration.navigationBarTextColor
		navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(15), NSForegroundColorAttributeName: configuration.settingsConfiguration.navigationBarTextColor]
		
		//Set Labels Color
		themeColorOneLabel.textColor = configuration.settingsConfiguration.themeOneLabelColor
		themeColorTwoLabel.textColor = configuration.settingsConfiguration.themeTwoLabelColor
		
		//Set Segment Control Color
		themeColorOneSegmentColor.tintColor = configuration.settingsConfiguration.themeOneSegmentTintColor
		themeColorTwoSegmentControl.tintColor = configuration.settingsConfiguration.themeTwoSegmentTintColor
	}
	
	//MARK: Changed Theme Color
	@IBAction func colorSelected(sender: UISegmentedControl) {
		guard sender.selectedSegmentIndex >= 0 && sender.selectedSegmentIndex <= 5 else {
			return
		}
		
		var color: UIColor
		switch sender.selectedSegmentIndex {
		case 0:
			color = Color.Red.colorValue
		case 1:
			color = Color.Blue.colorValue
		case 2:
			color = Color.Gray.colorValue
		case 3:
			color = Color.Green.colorValue
		case 4:
			color = Color.White.colorValue
		case 5:
			color = Color.Yellow.colorValue
		default:
			return
		}
		
		if sender.tag == 1 {
			configuration.themeColorOne = color
		} else  {
			configuration.themeColorTwo = color
		}
	}
}