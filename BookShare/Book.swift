//
//  Book.swift
//  BookShare
//
//  Created by Brandon Coll on 5/24/16.
//  Copyright © 2016 Brandon Coll. All rights reserved.
//

import UIKit

class Book: NSObject {
    
    let title:String
    let author:String
    let genre:String
    let condition:String
    let cost:Double
    
    init(title:String, author:String, genre:String, condition:String, cost:Double) {
        self.title = title
        self.author = author
        self.genre = genre
        self.condition = condition
        self.cost = cost
    }
    
    func getImage() -> UIImage? {
        return UIImage(named: "first")
    }
}
