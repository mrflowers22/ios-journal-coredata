//
//  EntryDetailViewController.swift
//  JournalWCD
//
//  Created by Michael Flowers on 10/2/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    var entry: Entry?
    var entryController: EntryController?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    

}
