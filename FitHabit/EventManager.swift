//
//  EventManager.swift
//  FitHabit
//
//  Created by Natasha Murashev on 7/8/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import EventKit

class EventManager {

    let eventStore = EKEventStore()
    var eventsAccessGranted: Bool = {
        if case .Authorized = EKEventStore.authorizationStatusForEntityType(.Event) {
            return true
        }
        return false
        }()
    
}
