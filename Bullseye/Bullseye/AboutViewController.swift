//
//  AboutViewController.swift
//  Bullseye
//
//  Created by Zhandos Baimurat on 19.05.2022.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet weak var descriptionTextView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.backgroundColor = .brown
    
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
