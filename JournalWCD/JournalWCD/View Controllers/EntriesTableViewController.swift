//
//  EntriesTableViewController.swift
//  JournalWCD
//
//  Created by Michael Flowers on 10/2/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class EntriesTableViewController: UITableViewController {

    let entryController = EntryController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entryController.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath) as! EntryTableViewCell
        let entryToPass = entryController.entries[indexPath.row]
        cell.entry = entryToPass //because we are going to a cell/ not a view controller
        // Configure the cell...

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entryToDelete = entryController.entries[indexPath.row]
            entryController.delete(entry: entryToDelete)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("inside the segue")
        
        if segue.identifier == "cellSegue" {
            guard let destination = segue.destination as? EntryDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                print("Error in the segue guard statement")
                return }
            let entryToPass = entryController.entries[indexPath.row]
            destination.entryController = entryController
            print("table view entry controller: \(entryController)")
            destination.entry = entryToPass
        } else if segue.identifier == "addButtonSegue" {
            guard let destination = segue.destination as? EntryDetailViewController else {
                print("Error in the addButton segue guard statement")
                return }
        
            destination.entryController = entryController
        }
    }
   

}
