//
//  ViewController.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

//MARK:- Interface
class WelcomeController: UIViewController {
	//MARK: Properties
	//Outlets
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var welcomeView: UIView!
	@IBOutlet weak var welcomeLabel: UILabel!
	@IBOutlet weak var functionalityView: UIView!
	@IBOutlet weak var functionalityLabel: UILabel!
	@IBOutlet weak var configurationsInfoView: UIView!
	@IBOutlet weak var configurationsInfoLabel: UILabel!
	@IBOutlet weak var getStartedView: UIView!
	@IBOutlet weak var getStartedButton: UIButton!
	@IBOutlet weak var pageControl: UIPageControl!
	
	//Variables
	var isDismissable: Bool = false
	
	//MARK: Deinitilization
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
}

//MARK:- Implementation
extension WelcomeController {
	//MARK: System
	override func viewDidLoad() {
		super.viewDidLoad()
		applyInitialConfigurations()
		applyConfigurations()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applyConfigurations), name: configurationUpdatedKey, object: nil)
	}
	
	//MARK: Initial Configuration
	func applyInitialConfigurations() {
		getStartedButton.setTitle(isDismissable ? "Dismiss" : "Get Started", forState: .Normal)
		getStartedButton.addTarget(self, action: (isDismissable ? #selector(dismissOnboardingController) : #selector(proceedToGallery)), forControlEvents: .TouchUpInside)
	}
	
	//MARK: Apply Configurations
	func applyConfigurations() {
		//Set Background Color
		welcomeView.backgroundColor = configuration.onboardingConfiguration.backgroundColor
		functionalityView.backgroundColor = configuration.onboardingConfiguration.backgroundColor
		configurationsInfoView.backgroundColor = configuration.onboardingConfiguration.backgroundColor
		getStartedView.backgroundColor = configuration.onboardingConfiguration.backgroundColor
		
		//Set Labels Color
		welcomeLabel.textColor = configuration.onboardingConfiguration.labelsColor
		functionalityLabel.textColor = configuration.onboardingConfiguration.labelsColor
		configurationsInfoLabel.textColor = configuration.onboardingConfiguration.labelsColor
		
		//Set Button Colors
		getStartedButton.setTitleColor(configuration.onboardingConfiguration.buttonTextColor ?? Color.Blue.values.color, forState: .Normal)
		getStartedButton.backgroundColor = configuration.onboardingConfiguration.buttonBackgroundColor
		
		//Set Page Control Color
		pageControl.pageIndicatorTintColor = configuration.onboardingConfiguration.pageControlTintColor.colorWithAlphaComponent(0.75)
		pageControl.currentPageIndicatorTintColor = configuration.onboardingConfiguration.pageControlTintColor
	}
}

extension WelcomeController: UIScrollViewDelegate {
	//MARK: Handle Page Control Updation
	func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
		//Set Current Page Indicator
		pageControl.currentPage = Int(scrollView.currentPage)
	}
}

extension WelcomeController {
	//MARK: Handle Button Action
	func dismissOnboardingController() {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	func proceedToGallery() {
		if let tabController = storyboard?.instantiateViewControllerWithIdentifier("MainTabController") as? MainTabController {
			presentViewController(tabController, animated: true, completion: nil)
		}
	}
}