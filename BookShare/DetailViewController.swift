//
//  DetailViewController.swift
//  BookShare
//
//  Created by Brandon Coll on 5/24/16.
//  Copyright © 2016 Brandon Coll. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    
    var detailBook: Book? {
        didSet (newBook) {
            self.refreshUI()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func refreshUI() {
        if let detailBook = detailBook {
            if let titleLabel = titleLabel, authorLabel = authorLabel, genreLabel = genreLabel {
                titleLabel.text = detailBook.title
                authorLabel.text = detailBook.author
                genreLabel.text = detailBook.genre
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: BookSelectiondelegate {
    func bookSelected(newBook: Book) {
        detailBook = newBook
    }
}