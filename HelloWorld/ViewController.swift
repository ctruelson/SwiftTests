//
//  ViewController.swift
//  HelloWorld
//
//  Created by Truelson, Charles on 5/15/19.
//  Copyright © 2019 Truelson, Charles. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getWindow()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

func getWindow() {
    let finderBundleIdentifier = "com.apple.finder"
    let finderApp : NSRunningApplication? = NSRunningApplication
        .runningApplications(withBundleIdentifier: finderBundleIdentifier).last as NSRunningApplication?
    
    if let pid = finderApp?.processIdentifier {
        
        let axuiFinderApp = AXUIElementCreateApplication(pid)
        
        // Get the list of the process's windows.
        var value: AnyObject?
        let result: AXError = AXUIElementCopyAttributeValue(axuiFinderApp, kAXWindowsAttribute as CFString, &value)
        
        print(result)
        
    }
}

