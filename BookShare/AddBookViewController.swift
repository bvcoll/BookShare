//
//  AddBookViewController.swift
//  BookShare
//
//  Created by Brandon Coll on 6/18/16.
//  Copyright © 2016 Brandon Coll. All rights reserved.
//

import UIKit

class AddBookViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var selectedMethod: String = ""
    
    @IBOutlet weak var titleSearchBar: UISearchBar!
    @IBOutlet weak var methodPicker: UIPickerView!
    @IBOutlet weak var firstValTextField: UITextField!
    @IBOutlet weak var secondValTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.methodPicker.delegate = self
        self.methodPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Returns the number of columns of data in the picker.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Returns the number of rows of data in the picker.
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // Returns the data that has been passed into the picker.
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Captures the selected item.
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMethod = pickerData[row]
        if selectedMethod == "Fixed Cost"{
            firstValTextField.placeholder = "Price"
        } else {
            firstValTextField.placeholder = "Starting Price"
        }
        tableView.reloadSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.None)
    }
    
    // Determines if CASH VALUES should have one or two rows.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 2)&&(selectedMethod=="Auction with Limit") {
            return 2
        } else {
            return 1
        }
    }
}
