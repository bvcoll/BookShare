//
//  FirstViewController.swift
//  BookShare
//
//  Created by Brandon Coll on 5/22/16.
//  Copyright © 2016 Brandon Coll. All rights reserved.
//

import UIKit

class FindBooksViewController: UITableViewController{
    
    // This array will need to be replaced with an API for pulling data from our storage server.
    // Additional methods will be necessary to determine how much data should be pulled and what should be pulled.
    var localBooks:[Book] = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.localBooks.append(Book(title: "Test", author: "TestAuthor", genre: "TestGenre", condition: "TestCondition"))
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Counts the number of items to be displayed in the table. Returns this value as an Int.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.localBooks.count
    }
    
    // Creates each individual cell in the table.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let book = self.localBooks[indexPath.row]
        cell.textLabel?.text = book.title
        
        return cell
    }
    
    // Handles selected cells. Currently needs to be implemented.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
}