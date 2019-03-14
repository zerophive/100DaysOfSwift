//
//  FlagViewController.swift
//  Milestone Project 1-3
//
//  Created by oaccamsrazor on 10.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class FlagViewController: UIViewController {
	@IBOutlet var flagImage: UIImageView!
	var flagName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
		
		flagImage.layer.borderWidth = 1
		flagImage.layer.borderColor = UIColor.lightGray.cgColor

		title = flagName?.uppercased()
		
		if let imageToLoad = flagName {
			flagImage.image = UIImage(named: imageToLoad)
		}
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
	}
	
	@objc func shareFlag() {
		guard let image = flagImage.image?.jpegData(compressionQuality: 0.8) else {
			print("Nop Image")
			return
		}
		
		let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
