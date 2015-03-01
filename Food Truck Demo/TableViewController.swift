//
//  TableViewController.swift
//  Food Truck Demo
//
//  Created by Shaobo Sun on 2/8/15.
//  Copyright (c) 2015 Shaobo Sun. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var theTableView: UITableView!
    var cellContent:[String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("supposed to load truck list")
        
        
        // TODO: better to intialize data fetch in main view controller
        var trucks = Trucks()
        var imageFetcher = ImageFetcher()
        var scheduleFetcher = ScheduleFetcher()

        scheduleFetcher.fetchTrucksInfoFromRemote() {
            println("Schedules are ready")
            self.cellContent = scheduleFetcher.getSchedulesName()
            self.theTableView.reloadData()
        }
        
        trucks.fetchTrucksInfoFromRemote {
            loadedImages in
            self.theTableView.reloadData()
            imageFetcher.fetchImages {
                println("imageFetch is done")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // dynamically define how many rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    // define the content of each individual cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let cell = TableCellCustomView()
        
     //   cell = cellContent[indexPath.row]
        
        return cell
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ToTruckDetailSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var indexPath: NSIndexPath = self.theTableView.indexPathForSelectedRow()!//indexPathForSelectedRow
        var destViewController : ScheduleDetailsViewController = segue.destinationViewController as ScheduleDetailsViewController
        destViewController.setPrevViewController("Table!")
    }
    
    
    

}
