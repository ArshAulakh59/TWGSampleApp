//
//  Configuration.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit
import Foundation

struct Configuration {
	var themeColorOne: UIColor
	var themeColorTwo: UIColor
	var onboardingConfiguration: OnboardingConfiguration
	var galleryControllerConfiguration: GalleryConfiguration
	var galleryCellConfiguration: GalleryCellConfiguration
	var settingsConfiguration: SettingsConfiguration
	
	//MARK: Initialisation
	init(themeColorOne: UIColor = Color.White.values.color, themeColorTwo: UIColor = Color.Green.values.color) {
		self.themeColorOne = themeColorOne
		self.themeColorTwo = themeColorTwo
		self.onboardingConfiguration = OnboardingConfiguration(backgroundColor: themeColorTwo, labelsColor: themeColorOne, buttonTextColor: themeColorTwo, buttonBackgroundColor: themeColorOne, pageControlTintColor: themeColorOne)
		self.galleryControllerConfiguration = GalleryConfiguration(backgroundColor: themeColorOne, navigationBarTintColor: themeColorTwo, navigationBarTextColor: themeColorOne)
		self.galleryCellConfiguration = GalleryCellConfiguration(captionLabelColor: themeColorTwo, allowParallax: true)
		self.settingsConfiguration = SettingsConfiguration(backgroundColor: themeColorOne, navigationBarTintColor: themeColorTwo, navigationBarTextColor: themeColorOne, themeOneLabelColor: themeColorTwo, themeOneSegmentTintColor: themeColorTwo, themeTwoLabelColor: themeColorTwo, themeTwoSegmentTintColor: themeColorTwo)
	}
	
	init(themeColorOne: UIColor, themeColorTwo: UIColor, onboardingConfiguration: OnboardingConfiguration, galleryControllerConfiguration: GalleryConfiguration, galleryCellConfiguration: GalleryCellConfiguration, settingsConfiguration: SettingsConfiguration) {
		self.themeColorOne = themeColorOne
		self.themeColorTwo = themeColorTwo
		self.onboardingConfiguration = onboardingConfiguration
		self.galleryControllerConfiguration = galleryControllerConfiguration
		self.galleryCellConfiguration = galleryCellConfiguration
		self.settingsConfiguration = settingsConfiguration
	}
}

struct OnboardingConfiguration {
	var backgroundColor: UIColor
	var labelsColor: UIColor
	var buttonTextColor: UIColor
	var buttonBackgroundColor: UIColor
	var pageControlTintColor: UIColor
}

struct GalleryConfiguration {
	var backgroundColor: UIColor
	var navigationBarTintColor: UIColor
	var navigationBarTextColor: UIColor
}

struct GalleryCellConfiguration {
	var captionLabelColor: UIColor
	var allowParallax: Bool = false
}

struct SettingsConfiguration {
	var backgroundColor: UIColor
	var navigationBarTintColor: UIColor
	var navigationBarTextColor: UIColor
	var themeOneLabelColor: UIColor
	var themeOneSegmentTintColor: UIColor
	var themeTwoLabelColor: UIColor
	var themeTwoSegmentTintColor: UIColor
}
