//
//  SecondViewController.swift
//  BookShare
//
//  Created by Brandon Coll on 5/22/16.
//  Copyright © 2016 Brandon Coll. All rights reserved.
//

import UIKit

class SellBooksViewController: UITableViewController {
    
    var myBooks:[Book] = sampleMyBooks

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BookCell
        
        let book = self.myBooks[indexPath.row]
        cell.book = book
        
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBooks.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func cancelToSellBooksViewController(segue: UIStoryboardSegue) {
    }
    
    
    @IBAction func saveNewBook(segue: UIStoryboardSegue) {
    }
}

