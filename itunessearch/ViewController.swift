//
//  ViewController.swift
//  itunessearch
//
//  Created by Jean Frederic Plante on 6/23/14.
//  Copyright (c) 2014 Jean Frederic Plante. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableData: NSArray = []
    @IBOutlet var appsTableView : UITableView
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        cell.text = "Row #\(indexPath.row)"
        cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        return cell
    }
    
    func searchItunesFor(searchTerm: String) -> NSArray {
        var urlPath = "https://itunes.apple.com/search?term=\(formatSearchTerm(searchTerm))&media=software"
        var url:NSURL = NSURL(string: urlPath)
        var session = NSURLSession.sharedSession()
        var result: NSArray = NSArray()
        var sessionTask = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            })
        return result
    }
    
    func formatItunesSearchAsJSONArray(searchResults: NSData) -> NSArray {
        var err: NSError?
        var results: NSArray
        var jsonResult = NSJSONSerialization.JSONObjectWithData(searchResults, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
        if(err?) {
            // If there is an error parsing JSON, print it to the console
            println("JSON Error \(err!.localizedDescription)")
            results = NSArray()
        } else {
         results = jsonResult["results"] as NSArray
        }
        return results
    }
    
    func formatSearchTerm(searchTerm: String) ->String {
        var formattedString: String = searchTerm
        // Replace spaces with +
        formattedString = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        // Escape non url friendly parts
        formattedString = formattedString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        return formattedString
    }
    





}

