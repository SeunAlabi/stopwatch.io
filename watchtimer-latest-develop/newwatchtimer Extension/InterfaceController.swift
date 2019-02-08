//
//  InterfaceController.swift
//  newwatchtimer Extension
//
//  Created by Seun Alabi on 08.01.19.
//  Copyright © 2019 Seun Alabi. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var lblCounter: WKInterfaceLabel!
    
    var counter: Int!
    var timer: Timer!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        counter = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(InterfaceController.updateTimer), userInfo: nil, repeats: true)
        // Configure interface objects here.
    }
    
    func updateTimer(){
        counter = counter + 1
        if (counter < 31)
        {
            lblCounter.setText(String(counter))
        }
        else
        {
            if (timer != nil){
                timer.invalidate()
            }
            timer = nil
            counter = 0
            lblCounter.setText(String(counter))
        }
        
        
        }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func stop() {
        if (timer != nil){
            timer.invalidate()
        }
        timer = nil
        counter = 0
    }
    
    @IBAction func start() {
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(InterfaceController.updateTimer), userInfo: nil, repeats: true)
        
        
    }
    @IBAction func pauseTimer() {
        if (timer != nil){
            timer.invalidate()
        }
        self.updateTimer()
        
    }
    
    
}
