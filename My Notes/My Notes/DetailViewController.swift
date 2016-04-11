//
//  DetailViewController.swift
//  My Notes
//
//  Created by Ovidiu Bortas on 4/11/16.
//  Copyright © 2016 Ovidiu Bortas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UITextView!
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if objects.count == 0 {
            return
        }
        
        if let label = self.detailDescriptionLabel {
            label.text = objects[currentIndex]
            if label.text == BLANK_NOTE {
                label.text = ""
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        detailViewController = self
        detailDescriptionLabel.becomeFirstResponder()
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if objects.count == 0 {
            return
        }
        
        // update the text typed in
        objects[currentIndex] = detailDescriptionLabel.text
        
        // If text is empty update with empty string
        if detailDescriptionLabel.text == "" {
            objects[currentIndex] = BLANK_NOTE
        }
        
        saveAndUpdate()
    }
    
    // Tells the master to save data
    func saveAndUpdate() {
        masterView?.save()
        masterView?.tableView.reloadData()
    }
    
    
}

