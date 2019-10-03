//
//  EntryTableViewCell.swift
//  JournalWCD
//
//  Created by Michael Flowers on 10/2/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextlabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
 
    private func updateViews(){
        guard let passedInEntry = entry, let date = passedInEntry.timestamp else { return }
        titleLabel.text = passedInEntry.title
        bodyTextlabel.text = passedInEntry.bodyText
        timestampLabel.text = formatter.string(from: date)
    }

}
