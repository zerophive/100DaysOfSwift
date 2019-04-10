//
//  CollectionViewController.swift
//  Project1
//
//  Created by oaccamsrazor on 9.4.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
	var pictures = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Storm Viewer"
		navigationController?.navigationBar.prefersLargeTitles = true
		performSelector(inBackground: #selector(loadImages), with: nil)
    }


    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pictures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as? PictureCell else {
			fatalError("Unable to dequeue a PictureCell")
		}
		
		let image = pictures[indexPath.item]
		
		cell.name.text = image
		
		cell.imageView.image = UIImage(named: image)

        return cell
    }

    // MARK: - UICollectionViewDelegate
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			let cell = collectionView.cellForItem(at: indexPath) as? PictureCell
			vc.selectedImage = cell?.name.text
			vc.imageCount = pictures.count
			vc.imageIndex = indexPath.item + 1
			navigationController?.pushViewController(vc, animated: true)
		}
	}

	// MARK: - ObjC methods
	
	@objc func loadImages() {
		let fm = FileManager.default
		let path = Bundle.main.resourcePath!
		let items = try! fm.contentsOfDirectory(atPath: path)
		
		for item in items {
			if item.hasPrefix("nssl") {
				pictures.append(item)
			}
		}
		
		pictures.sort()
		
		collectionView.performSelector(onMainThread: #selector(UICollectionView.reloadData), with: nil, waitUntilDone: false)
	}
}
