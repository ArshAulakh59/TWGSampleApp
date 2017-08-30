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
	@objc var isPopulated: Bool {
		return captionLabel.text == nil && pictureImageView.image == nil && backgroundImageView.image == nil
	}
	
	//MARK: Initialization
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		NotificationCenter.default.addObserver(self, selector: #selector(applyConfigurations), name: NSNotification.Name(rawValue: ConfigurationUpdatedKey), object: nil)
	}
	
	//MARK: Deinitilization
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}

extension PictureCell {
	//MARK: System
	override func awakeFromNib() {
		super.awakeFromNib()
		applyConfigurations()
	}
	
	@objc func applyConfigurations() {
		captionLabel.textColor = configuration.galleryCellConfiguration.captionLabelColor
	}
}

extension PictureCell {
	//MARK: Populate Cell From Data
	func populateCellFromData(_ data: PictureData?) {
		guard let data = data else {
			return
		}
		
		//Set Data
		captionLabel.text = data.caption
		DispatchQueue.main.async { 
			self.pictureImageView.image = data.picture
			self.backgroundImageView.image = data.picture
		}
	}
}
