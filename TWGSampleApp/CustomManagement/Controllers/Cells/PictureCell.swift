//
//  PictureCell.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit

//MARK:- Interface
class PictureCell: UITableViewCell {
	//MARK: Properties
	//Outlets
	@IBOutlet weak var captionLabel: UILabel!
	@IBOutlet weak var pictureImageView: UIImageView!
	@IBOutlet weak var backgroundImageView: UIImageView!
	@IBOutlet weak var pictureImageViewTopSpaceConstraint: NSLayoutConstraint!
	@IBOutlet weak var pictureImageViewHeightConstraint: NSLayoutConstraint!
	
	//Variables
	var data: PictureData? = nil {
		didSet {
			populateCellFromData(data)
		}
	}
	var isPopulated: Bool {
		return captionLabel.text == nil && pictureImageView.image == nil && backgroundImageView.image == nil
	}
	
	//MARK: Initialization
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applyConfigurations), name: configurationUpdatedKey, object: nil)
	}
	
	//MARK: Deinitilization
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
}

extension PictureCell {
	//MARK: System
	override func awakeFromNib() {
		super.awakeFromNib()
		applyConfigurations()
	}
	
	func applyConfigurations() {
		if configuration.galleryCellConfiguration.allowParallax {
			addParallaxToImageView(pictureImageView)
		}
		captionLabel.textColor = configuration.galleryCellConfiguration.captionLabelColor
	}
}

extension PictureCell {
	//MARK: Populate Cell From Data
	func populateCellFromData(data: PictureData?) {
		guard let data = data else {
			return
		}
		
		//Set Data
		captionLabel.text = data.caption
		dispatch_async(dispatch_get_main_queue()) { 
			self.pictureImageView.image = data.picture
			self.backgroundImageView.image = data.picture
		}
	}
}

extension PictureCell {
	//MARK: Handle parallax
	func addParallaxToImageView(imageView: UIImageView) {
		// Set horizontal effect
		let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
		horizontalMotionEffect.minimumRelativeValue = -8
		horizontalMotionEffect.maximumRelativeValue = 8
		
		// Add both effects to your view
		imageView.addMotionEffect(horizontalMotionEffect)
	}
}