//
//  EntryController.swift
//  JournalWCD
//
//  Created by Michael Flowers on 10/2/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    var entries: [Entry] {
        return loadFromPersistentStore()
    }
    
    func createEntryWith(title: String, bodyText: String){
        let _ = Entry(title: title, bodyText: bodyText)
        saveToPersistentStore()
    }
    
    func update(entry: Entry, withTitle title: String, andBodyText bodytext: String, timestamp: Date = Date()){
        entry.title = title
        entry.bodyText = bodytext
        entry.timestamp = timestamp
        saveToPersistentStore()
    }
    
    func delete(entry: Entry){
        CoreDataStack.shared.mainContext.delete(entry)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch  {
            print("Error in the save to persistent store function: \(error) ////\(#function)")
        }
    }
    
    func loadFromPersistentStore() -> [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        
        do {
           return try CoreDataStack.shared.mainContext.fetch(fetchRequest)
        } catch  {
            print("Error in the load function: \(error)///\(error.localizedDescription) \(#function)")
            return []
        }
    }
}
