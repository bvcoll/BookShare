//
//  FirstViewController.swift
//  BookShare
//
//  Created by Brandon Coll on 5/22/16.
//  Copyright © 2016 Brandon Coll. All rights reserved.
//

import UIKit


protocol BookSelectiondelegate: class {
    func bookSelected(newBook: Book)
}

class FindBooksViewController: UITableViewController{
    
    weak var delegate: BookSelectiondelegate?
    let searchController = UISearchController(searchResultsController: nil)
    
    // This array will need to be replaced with an API for pulling data from our storage server.
    // Additional methods will be necessary to determine how much data should be pulled and what should be pulled.
    var localBooks:[Book] = [Book]()
    var filteredLocalBooks:[Book] = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        
        self.localBooks.append(Book(title: "Test", author: "TestAuthor", genre: "TestGenre", condition: "TestCondition"))
        self.localBooks.append(Book(title: "Second", author: "SecondAuthor", genre: "SecondGenre", condition: "Secondcondition"))
        self.localBooks.append(Book(title: "Third", author: "ThirdAuthor", genre: "ThirdGenre", condition: "Secondcondition"))
        self.localBooks.append(Book(title: "Fourth", author: "FourthAuthor", genre: "FourthGenre", condition: "Fourthcondition"))
        
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
        if searchController.active && searchController.searchBar.text != "" {
            return filteredLocalBooks.count
        }
        return self.localBooks.count
    }
    
    // Creates each individual cell in the table.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let book:Book
        if searchController.active && searchController.searchBar.text != "" {
            book = self.filteredLocalBooks[indexPath.row]
        } else {
        book = self.localBooks[indexPath.row]
        }
        
        cell.textLabel?.text = book.title
        return cell
    }
    
    // Handles selected cells.
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedBook = self.localBooks[indexPath.row]
        
        if searchController.active && searchController.searchBar.text != "" {
            selectedBook = self.filteredLocalBooks[indexPath.row]
        }
        
        self.delegate?.bookSelected(selectedBook)
        
        if let detailViewController = self.delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController.navigationController!, sender: nil)
        }
    }
    
    // Filters the titles of each book to correspond to the search text.
    func filterContentforSearchText(searchText:String, scope:String = "All"){
        filteredLocalBooks = localBooks.filter{ book in
            return book.title.lowercaseString.containsString(searchText.lowercaseString)
        }
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let book: Book
                
                if searchController.active && searchController.searchBar.text != "" {
                    book = filteredLocalBooks[indexPath.row]
                } else {
                    book = localBooks[indexPath.row]
                }
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailBook = book
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}

extension FindBooksViewController: UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentforSearchText(searchController.searchBar.text!)
    }
}




