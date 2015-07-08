//
//  FitnessSummaryViewController.swift
//  FitHabit
//
//  Created by Natasha Murashev on 7/8/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

class FitnessSummaryViewController: UITableViewController {

    let eventManager = EventManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAccessToEvents()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}

private extension FitnessSummaryViewController {
    
    func requestAccessToEvents() {
        eventManager.eventStore.requestAccessToEntityType(.Event) { [weak self] (accessGranted, error) in
            if accessGranted {
                self?.eventManager.eventsAccessGranted = true
            } else {
                dispatch_async(dispatch_get_main_queue()) {
                    self?.showEventsAcessDeniedAlert()
                }
            }
        }
    }
    
    func showEventsAcessDeniedAlert() {
        let alertController = UIAlertController(title: "Oh no!", message: "The calendar permission was not authorized. Please enable it in Settings to continue.", preferredStyle: .Alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (alertAction) -> Void in
            if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(appSettings)
            }
        }
        alertController.addAction(settingsAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}
