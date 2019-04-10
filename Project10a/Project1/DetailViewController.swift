//
//  DetailViewController.swift
//  Project1
//
//  Created by oaccamsrazor on 5.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet var imageView: UIImageView!
	var selectedImage: String?
	var imageCount: Int?
	var imageIndex: Int?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
//		title = "Picture \(imageIndex!) of \(imageCount!)"
//		imageIndex = nil
		if let theIndex = imageIndex, let theCount = imageCount {
			title = "Picture \(theIndex) of \(theCount)"
		}
		navigationItem.largeTitleDisplayMode = .never

		if let imageToLoad = selectedImage {
			imageView.image = UIImage(named: imageToLoad)
		}
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super .viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
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
