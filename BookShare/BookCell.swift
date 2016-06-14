//
//  BookCell.swift
//  BookShare
//
//  Created by Brandon Coll on 6/13/16.
//  Copyright © 2016 Brandon Coll. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var costLabel:UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    var book: Book! {
        didSet {
            titleLabel.text = book.title
            authorLabel.text = book.author
            costLabel.text = String(book.cost)
            coverImageView.image = book.getImage()
        }
    }

}
