//
//  EntryDetailViewController.swift
//  JournalWCD
//
//  Created by Michael Flowers on 10/2/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    var entry: Entry?{
        didSet {
            print("entry set in  detail")
            updateViews()
        }
    }
    var entryController: EntryController? {
        didSet {
            print("Entry controller set in detial")
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        print("this is the ec: \(entryController)")
        guard let entryController = entryController,
            let title = titleTextField.text, !title.isEmpty,
            let  body = bodyTextView.text, !body.isEmpty else {
            print("Error unwrapping entrycontroller")
            return
        }
        
        if let passedInEntry = entry {
            //update
            entryController.update(entry: passedInEntry, withTitle: title, andBodyText: body)
        } else {
            //create
            entryController.createEntryWith(title: title, bodyText: body)
        }
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    private func updateViews(){
        guard let passedInEntry = entry, isViewLoaded else {
            self.title = "Please create an Entry."
            return }
        self.title = passedInEntry.title
        titleTextField.text = passedInEntry.title
        bodyTextView.text = passedInEntry.bodyText
    }

}
