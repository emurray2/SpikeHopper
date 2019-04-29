//
//  SpikeStatus.swift
//  Spike Hopper
//
//  Created by Sevan Productions on 8/22/15.
//  Copyright (c) 2015 Evan Murray. All rights reserved.
//

import Foundation

//Class for the spike randomizer

class SpikeStatus {
    
    //Boolean for whether the spike randomizer is running or not
    
    var isRunning = false
    
    //Unsigned Integer 32 for how long before the next spike runs
    
    var timeGapForNextRun = UInt32(0)
    
    //Unsigned Integer 32 for how long it has been since the last spike ran
    
    var currentInterval = UInt32(0)
    
    init(isRunning:Bool, timeGapForNextRun:UInt32, currentInterval:UInt32) {
        self.isRunning = isRunning
        self.timeGapForNextRun = timeGapForNextRun
        self.currentInterval = currentInterval
    }
    
    func shouldRunBlock() -> Bool {
        return self.currentInterval > self.timeGapForNextRun
    }
}