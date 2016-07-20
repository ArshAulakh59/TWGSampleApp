//
//  Configuration.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit
import Foundation

//MARK: Configuration
struct Configuration {
	var mainThemeColor: UIColor
	var secondaryThemeColor: UIColor
	var onboardingConfiguration: OnboardingConfiguration
	var galleryControllerConfiguration: GalleryConfiguration
	var galleryCellConfiguration: GalleryCellConfiguration
	var settingsConfiguration: SettingsConfiguration
	
	//MARK: Initialisation
	init(mainThemeColor: UIColor = Color.Green.values.color, secondaryThemeColor: UIColor = Color.White.values.color) {
		self.mainThemeColor = mainThemeColor
		self.secondaryThemeColor = secondaryThemeColor
		self.onboardingConfiguration = OnboardingConfiguration(backgroundColor: secondaryThemeColor, labelsColor: mainThemeColor, buttonTextColor: secondaryThemeColor, buttonBackgroundColor: mainThemeColor, pageControlTintColor: mainThemeColor)
		self.galleryControllerConfiguration = GalleryConfiguration(backgroundColor: secondaryThemeColor, navigationBarTintColor: secondaryThemeColor, navigationBarTextColor: mainThemeColor)
		self.galleryCellConfiguration = GalleryCellConfiguration(captionLabelColor: mainThemeColor)
		self.settingsConfiguration = SettingsConfiguration(backgroundColor: secondaryThemeColor, navigationBarTintColor: secondaryThemeColor, navigationBarTextColor: mainThemeColor, themeOneLabelColor: mainThemeColor, themeOneSegmentTintColor: mainThemeColor, themeTwoLabelColor: mainThemeColor, themeTwoSegmentTintColor: mainThemeColor)
	}
	
	init(mainThemeColor: UIColor, secondaryThemeColor: UIColor, onboardingConfiguration: OnboardingConfiguration, galleryControllerConfiguration: GalleryConfiguration, galleryCellConfiguration: GalleryCellConfiguration, settingsConfiguration: SettingsConfiguration) {
		self.mainThemeColor = mainThemeColor
		self.secondaryThemeColor = secondaryThemeColor
		self.onboardingConfiguration = onboardingConfiguration
		self.galleryControllerConfiguration = galleryControllerConfiguration
		self.galleryCellConfiguration = galleryCellConfiguration
		self.settingsConfiguration = settingsConfiguration
	}
}

//MARK: Onboarding Configuration
struct OnboardingConfiguration {
	var backgroundColor: UIColor
	var labelsColor: UIColor
	var buttonTextColor: UIColor
	var buttonBackgroundColor: UIColor
	var pageControlTintColor: UIColor
}

//MARK: Gallery Configuration
struct GalleryConfiguration {
	var backgroundColor: UIColor
	var navigationBarTintColor: UIColor
	var navigationBarTextColor: UIColor
}

//MARK: Gallery Cell Configuration
struct GalleryCellConfiguration {
	var captionLabelColor: UIColor
}

//MARK: Settings Configuration
struct SettingsConfiguration {
	var backgroundColor: UIColor
	var navigationBarTintColor: UIColor
	var navigationBarTextColor: UIColor
	var themeOneLabelColor: UIColor
	var themeOneSegmentTintColor: UIColor
	var themeTwoLabelColor: UIColor
	var themeTwoSegmentTintColor: UIColor
}