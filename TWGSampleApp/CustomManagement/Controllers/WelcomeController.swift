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
	@objc var isDismissable: Bool = false
	
	//MARK: Deinitilization
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}

//MARK:- Implementation
extension WelcomeController {
	//MARK: System
	override func viewDidLoad() {
		super.viewDidLoad()
		applyInitialConfigurations()
		applyConfigurations()
		NotificationCenter.default.addObserver(self, selector: #selector(applyConfigurations), name: NSNotification.Name(rawValue: ConfigurationUpdatedKey), object: nil)
	}
	
	//MARK: Initial Configuration
	@objc func applyInitialConfigurations() {
		getStartedButton.layer.cornerRadius = 5
		getStartedButton.setTitle(isDismissable ? "Dismiss" : "Get Started", for: UIControlState())
		getStartedButton.addTarget(self, action: (isDismissable ? #selector(dismissOnboardingController) : #selector(proceedToGallery)), for: .touchUpInside)
	}
	
	//MARK: Apply Configurations
	@objc func applyConfigurations() {
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
		getStartedButton.setTitleColor(configuration.onboardingConfiguration.buttonTextColor, for: UIControlState())
		getStartedButton.backgroundColor = configuration.onboardingConfiguration.buttonBackgroundColor
		getStartedButton.layer.borderWidth = 1
		getStartedButton.layer.borderColor = configuration.onboardingConfiguration.buttonTextColor.cgColor
		
		//Set Page Control Color
		pageControl.pageIndicatorTintColor = configuration.onboardingConfiguration.pageControlTintColor.withAlphaComponent(0.5)
		pageControl.currentPageIndicatorTintColor = configuration.onboardingConfiguration.pageControlTintColor
	}
}

extension WelcomeController: UIScrollViewDelegate {
	//MARK: Handle Page Control Updation
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		//Set Current Page Indicator
		pageControl.currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
	}
}

extension WelcomeController {
	//MARK: Handle Button Actions
	@objc func dismissOnboardingController() {
		dismiss(animated: true, completion: nil)
	}
	
	@objc func proceedToGallery() {
		if let tabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as? MainTabController {
			present(tabController, animated: true, completion: nil)
		}
	}
}
