//
//  SampleData.swift
//  BookShare
//
//  Created by Brandon Coll on 6/5/16.
//  Copyright © 2016 Brandon Coll. All rights reserved.
//

import Foundation

let sampleLocalBooks = [
    Book(title: "TestOne", author: "AuthorOne", genre: "GenreOne", condition: "New", cost: 200),
    Book(title: "TestTwo", author: "AuthorTwo", genre: "GenreTwo", condition: "Used", cost: 100),
    Book(title: "TestThree", author: "AuthorThree", genre: "GenreThree", condition: "Used", cost: 299.99)]

let sampleMyBooks = [
    Book(title: "MyBook", author: "MyBookAuthor", genre: "MyBookGenre", condition: "New", cost: 50),
    Book(title: "MySecondBook", author: "SecondAuthor", genre: "SecondGenre", condition: "New", cost: 14.99),
    Book(title: "BookWithReallyReallyReallyReallyLongTitle", author: "Test", genre: "Test", condition: "New", cost: 9.99)]

let pickerData = ["Fixed Cost", "Auction", "Auction with Limit"]