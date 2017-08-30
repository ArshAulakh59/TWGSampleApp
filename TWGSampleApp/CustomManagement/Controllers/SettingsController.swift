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
		case Color.red.values.color:
			sender.selectedSegmentIndex = Color.red.values.index
		case Color.blue.values.color:
			sender.selectedSegmentIndex = Color.blue.values.index
		case Color.gray.values.color:
			sender.selectedSegmentIndex = Color.gray.values.index
		case Color.green.values.color:
			sender.selectedSegmentIndex = Color.green.values.index
		case Color.white.values.color:
			sender.selectedSegmentIndex = Color.white.values.index
		case Color.yellow.values.color:
			sender.selectedSegmentIndex = Color.yellow.values.index
		default:
			return
		}
	}
	
	//MARK: Deinitilization
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}

//MRK:- Implementation
extension SettingsController {
	//MARK: System
	override func viewDidLoad() {
		super.viewDidLoad()
		applyConfigurations()
		NotificationCenter.default.addObserver(self, selector: #selector(applyConfigurations), name: NSNotification.Name(rawValue: ConfigurationUpdatedKey), object: nil)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		showCurrentSelections()
		updateAvailableOptionsByCurrentConfiguration()
	}
	
	//MARK: Apply Configurations
	func applyConfigurations() {
		tableView.backgroundColor = configuration.settingsConfiguration.backgroundColor
		navigationController?.navigationBar.barTintColor = configuration.settingsConfiguration.navigationBarTintColor
		navigationController?.navigationBar.tintColor = configuration.settingsConfiguration.navigationBarTextColor
		navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15), NSForegroundColorAttributeName: configuration.settingsConfiguration.navigationBarTextColor]
		
		//Set Labels Color
		themeColorOneLabel.textColor = configuration.settingsConfiguration.themeOneLabelColor
		themeColorTwoLabel.textColor = configuration.settingsConfiguration.themeTwoLabelColor
		
		//Set Segment Control Color
		themeColorOneSegmentColor.tintColor = configuration.settingsConfiguration.themeOneSegmentTintColor
		themeColorTwoSegmentControl.tintColor = configuration.settingsConfiguration.themeTwoSegmentTintColor
		
		//Set Buttons Colors
		defaultThemeButton.backgroundColor = configuration.secondaryThemeColor
		defaultThemeButton.setTitleColor(configuration.mainThemeColor, for: UIControlState())
		checkOnboardingButton.backgroundColor = configuration.secondaryThemeColor
		checkOnboardingButton.setTitleColor(configuration.mainThemeColor, for: UIControlState())
	}
}

extension SettingsController {
	//MARK: Handle Button Actions
	//Handle Resetting to default theme
	@IBAction func resetToDefaultThemeClicked(_ sender: UIButton) {
		configuration = Configuration()
		showCurrentSelections()
		updateAvailableOptionsByCurrentConfiguration()
	}
	
	//Handle Theme Override
	@IBAction func colorSelected(_ sender: UISegmentedControl) {
		guard let color = Color(rawValue: sender.selectedSegmentIndex), sender.selectedSegmentIndex >= 0 && sender.selectedSegmentIndex <= 5 else {
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
	@IBAction func checkOnboardingFlowClicked(_ sender: AnyObject) {
		if let welcomeObject = storyboard?.instantiateViewController(withIdentifier: "WelcomeController") as? WelcomeController {
			welcomeObject.isDismissable = true
			present(welcomeObject, animated: true, completion: nil)
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
		if !themeColorOneSegmentColor.isSelected {
			showCurrentSelectionForSegmentControl(configuration.mainThemeColor, themeColorOneSegmentColor)
		}
		if !themeColorTwoSegmentControl.isSelected {
			showCurrentSelectionForSegmentControl(configuration.secondaryThemeColor, themeColorTwoSegmentControl)
		}
		
		//Update Options
		let updateOptions = { (color: UIColor, sender: UISegmentedControl) in
			//Enable All Options
			for index in 0..<sender.numberOfSegments {
				sender.setEnabled(true, forSegmentAt: index)
			}
			
			//Disable Unavailable Option
			switch color {
			case Color.red.values.color:
				sender.setEnabled(false, forSegmentAt: Color.red.values.index)
			case Color.blue.values.color:
				sender.setEnabled(false, forSegmentAt: Color.blue.values.index)
			case Color.gray.values.color:
				sender.setEnabled(false, forSegmentAt: Color.gray.values.index)
			case Color.green.values.color:
				sender.setEnabled(false, forSegmentAt: Color.green.values.index)
			case Color.white.values.color:
				sender.setEnabled(false, forSegmentAt: Color.white.values.index)
			case Color.yellow.values.color:
				sender.setEnabled(false, forSegmentAt: Color.yellow.values.index)
			default:
				sender.setEnabled(false, forSegmentAt: Color.yellow.values.index)
				return
			}
		}
		
		//Perform options updations
		updateOptions(configuration.mainThemeColor, themeColorTwoSegmentControl)
		updateOptions(configuration.secondaryThemeColor, themeColorOneSegmentColor)
	}
}
