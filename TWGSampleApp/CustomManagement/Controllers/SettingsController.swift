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
		defaultThemeButton.backgroundColor = configuration.themeColorTwo
		defaultThemeButton.setTitleColor(configuration.themeColorOne, forState: .Normal)
		checkOnboardingButton.backgroundColor = configuration.themeColorTwo
		checkOnboardingButton.setTitleColor(configuration.themeColorOne, forState: .Normal)
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
			oldConfiguration.themeColorOne = color.values.color
		} else  {
			oldConfiguration.themeColorTwo = color.values.color
		}
		
		//Check For same colors in the theme
		guard oldConfiguration.themeColorOne != oldConfiguration.themeColorTwo else {
			return
		}
		configuration = Configuration(themeColorOne: oldConfiguration.themeColorOne, themeColorTwo: oldConfiguration.themeColorTwo)
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
		showCurrentSelectionForSegmentControl(configuration.themeColorOne, themeColorOneSegmentColor)
		showCurrentSelectionForSegmentControl(configuration.themeColorTwo, themeColorTwoSegmentControl)
	}
	
	func updateAvailableOptionsByCurrentConfiguration() {
		//Show Selections If user leaves the segment unselected
		if !themeColorOneSegmentColor.selected {
			showCurrentSelectionForSegmentControl(configuration.themeColorOne, themeColorOneSegmentColor)
		}
		if !themeColorTwoSegmentControl.selected {
			showCurrentSelectionForSegmentControl(configuration.themeColorTwo, themeColorTwoSegmentControl)
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
		updateOptions(configuration.themeColorOne, themeColorTwoSegmentControl)
		updateOptions(configuration.themeColorTwo, themeColorOneSegmentColor)
	}
}