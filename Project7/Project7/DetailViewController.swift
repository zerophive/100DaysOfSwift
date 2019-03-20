//
//  DetailViewController.swift
//  Project7
//
//  Created by oaccamsrazor on 20.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
	var webView: WKWebView!
	var detailItem: Petition?

	override func loadView() {
		webView = WKWebView()
		view = webView
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		guard let detailItem = detailItem else { return }
		
		let html = """
		<html>
		<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style> body { font-size: 125%; font-family: Arial, Helvetica, sans-serif;} </style>
		</head>
		<body>
		\(detailItem.body)
		</body>
		</html>
		"""
		
		webView.loadHTMLString(html, baseURL: nil)
    }
}
