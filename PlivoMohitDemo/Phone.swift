//
//  Phone.swift
//  PlivoMohitDemo
//
//  Created by Mohit Totlani on 12/07/18.
//  Copyright © 2018 test. All rights reserved.
//
import UIKit
class Phone: NSObject {
    
    
    var endPoint: PlivoEndpoint!
    
    override init() {
        super.init()
        endPoint = PlivoEndpoint()
    }
    
    func login(){
        let userName = "mohittest"
        let password = "Ilovehenry14@"
        endPoint.login(userName, andPassword: password)
    }
    
    func setDelegate(sender: AnyObject){
        endPoint.delegate = sender
    }
    
    func keepAlive(){
        endPoint.keepAlive()
    }
    
}
