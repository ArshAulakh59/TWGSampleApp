//
//  PicturesController.swift
//  TWGSampleApp
//
//  Created by Arsh Aulakh BHouse on 16/07/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import UIKit
import Foundation

//MARK:- Interface
class PicturesController: UITableViewController {
	//MARK: Properties
	//Variables
	var picturesDatasource: [PictureData] = [
		(UIImage(named: "sampleImage1")!, "Sunset lighting up El Capitan."),
		(UIImage(named: "sampleImage2")!, "Mountains are they way to go."),
		(UIImage(named: "sampleImage3")!, "What better image can go here than this 😉."),
		(UIImage(named: "sampleImage4")!, "Just another mountain image."),
		(UIImage(named: "sampleImage5")!, "Yet another mountain image.")
	]
	
	//Constants
	let reuseIdentifier = "PictureCell"
	
	//MARK: Deinitilization
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
}

//MARK:- Implementation
extension PicturesController {
	//MARK: System
	override func viewDidLoad() {
		//Configure Table
		tableView.estimatedRowHeight = 100.0
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		
		//Handle Configurations
		applyConfigurations()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applyConfigurations), name: ConfigurationUpdatedKey, object: nil)
	}
	
	//MARK: Apply Configurations
	func applyConfigurations() {
		tableView.backgroundColor = configuration.galleryControllerConfiguration.backgroundColor
		navigationController?.navigationBar.barTintColor = configuration.galleryControllerConfiguration.navigationBarTintColor
		navigationController?.navigationBar.tintColor = configuration.galleryControllerConfiguration.navigationBarTextColor
		navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(15), NSForegroundColorAttributeName: configuration.galleryControllerConfiguration.navigationBarTextColor]
	}
}

extension PicturesController {
	//MARK: Configure Table
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return picturesDatasource.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PictureCell
		if !cell.isPopulated {
			cell.data = picturesDatasource[indexPath.row]
		}
		
		return cell
	}
}