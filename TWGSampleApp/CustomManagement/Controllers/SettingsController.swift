//
//  SettingsController.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

//MARK:- Interface
class SettingsController: UITableViewController {
	//MARK: Properties
	//Outlets
	@IBOutlet weak var defaultThemeButton: UIButton!
	@IBOutlet weak var themeColorOneLabel: UILabel!
	@IBOutlet weak var themeColorOneSegmentColor: UISegmentedControl!
	@IBOutlet weak var themeColorTwoLabel: UILabel!
	@IBOutlet weak var themeColorTwoSegmentControl: UISegmentedControl!
	@IBOutlet weak var checkOnboardingButton: UIButton!
	
	//Constants
	let showCurrentSelectionForSegmentControl = { (color: UIColor, sender: UISegmentedControl) in
		switch color {
		case Color.Red.values.color:
			sender.selectedSegmentIndex = Color.Red.values.index
		case Color.Blue.values.color:
			sender.selectedSegmentIndex = Color.Blue.values.index
		case Color.Gray.values.color:
			sender.selectedSegmentIndex = Color.Gray.values.index
		case Color.Green.values.color:
			sender.selectedSegmentIndex = Color.Green.values.index
		case Color.White.values.color:
			sender.selectedSegmentIndex = Color.White.values.index
		case Color.Yellow.values.color:
			sender.selectedSegmentIndex = Color.Yellow.values.index
		default:
			return
		}
	}
	
	//MARK: Deinitilization
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
}

//MRK:- Implementation
extension SettingsController {
	//MARK: System
	override func viewDidLoad() {
		super.viewDidLoad()
		applyConfigurations()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applyConfigurations), name: ConfigurationUpdatedKey, object: nil)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		showCurrentSelections()
		updateAvailableOptionsByCurrentConfiguration()
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
		
		//Set Buttons Colors
		defaultThemeButton.backgroundColor = configuration.secondaryThemeColor
		defaultThemeButton.setTitleColor(configuration.mainThemeColor, forState: .Normal)
		checkOnboardingButton.backgroundColor = configuration.secondaryThemeColor
		checkOnboardingButton.setTitleColor(configuration.mainThemeColor, forState: .Normal)
	}
}

extension SettingsController {
	//MARK: Handle Button Actions
	//Handle Resetting to default theme
	@IBAction func resetToDefaultThemeClicked(sender: UIButton) {
		configuration = Configuration()
		showCurrentSelections()
		updateAvailableOptionsByCurrentConfiguration()
	}
	
	//Handle Theme Override
	@IBAction func colorSelected(sender: UISegmentedControl) {
		guard let color = Color(rawValue: sender.selectedSegmentIndex) where sender.selectedSegmentIndex >= 0 && sender.selectedSegmentIndex <= 5 else {
			return
		}
		
		//Update Configuration
		var oldConfiguration = configuration
		if sender.tag == 1 {
			oldConfiguration.mainThemeColor = color.values.color
		} else {
			let color = color.values.color
			oldConfiguration.secondaryThemeColor = color
		}
		
		//Check For same colors in the theme
		configuration = Configuration(mainThemeColor: oldConfiguration.mainThemeColor, secondaryThemeColor: oldConfiguration.secondaryThemeColor)
		updateAvailableOptionsByCurrentConfiguration()
	}
	
	//Check Onboarding Flow
	@IBAction func checkOnboardingFlowClicked(sender: AnyObject) {
		if let welcomeObject = storyboard?.instantiateViewControllerWithIdentifier("WelcomeController") as? WelcomeController {
			welcomeObject.isDismissable = true
			presentViewController(welcomeObject, animated: true, completion: nil)
		}
	}
}

extension SettingsController {
	//MARK: Additionals
	func showCurrentSelections() {
		showCurrentSelectionForSegmentControl(configuration.mainThemeColor, themeColorOneSegmentColor)
		showCurrentSelectionForSegmentControl(configuration.secondaryThemeColor, themeColorTwoSegmentControl)
	}
	
	func updateAvailableOptionsByCurrentConfiguration() {
		//Show Selections If user leaves the segment unselected
		if !themeColorOneSegmentColor.selected {
			showCurrentSelectionForSegmentControl(configuration.mainThemeColor, themeColorOneSegmentColor)
		}
		if !themeColorTwoSegmentControl.selected {
			showCurrentSelectionForSegmentControl(configuration.secondaryThemeColor, themeColorTwoSegmentControl)
		}
		
		//Update Options
		let updateOptions = { (color: UIColor, sender: UISegmentedControl) in
			//Enable All Options
			for index in 0..<sender.numberOfSegments {
				sender.setEnabled(true, forSegmentAtIndex: index)
			}
			
			//Disable Unavailable Option
			switch color {
			case Color.Red.values.color:
				sender.setEnabled(false, forSegmentAtIndex: Color.Red.values.index)
			case Color.Blue.values.color:
				sender.setEnabled(false, forSegmentAtIndex: Color.Blue.values.index)
			case Color.Gray.values.color:
				sender.setEnabled(false, forSegmentAtIndex: Color.Gray.values.index)
			case Color.Green.values.color:
				sender.setEnabled(false, forSegmentAtIndex: Color.Green.values.index)
			case Color.White.values.color:
				sender.setEnabled(false, forSegmentAtIndex: Color.White.values.index)
			case Color.Yellow.values.color:
				sender.setEnabled(false, forSegmentAtIndex: Color.Yellow.values.index)
			default:
				sender.setEnabled(false, forSegmentAtIndex: Color.Yellow.values.index)
				return
			}
		}
		
		//Perform options updations
		updateOptions(configuration.mainThemeColor, themeColorTwoSegmentControl)
		updateOptions(configuration.secondaryThemeColor, themeColorOneSegmentColor)
	}
}