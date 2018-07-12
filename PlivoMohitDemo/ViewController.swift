//
//  ViewController.swift
//  PlivoMohitDemo
//
//  Created by Mohit Totlani on 12/07/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PlivoEndpointDelegate{

    @IBOutlet weak var answerBtn: UIButton!
    @IBOutlet weak var hangupBtn: UIButton!
    @IBOutlet weak var LoginLbl: UILabel!
    @IBOutlet weak var callLbl: UILabel!
    var providerDelegate: ProviderDelegate!
    
    var phone: Phone!
    var incCall: PlivoIncoming?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Login */
        self.LoginLbl.text = "Loggin in"
        self.phone.login()
        self.resetUI()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func resetUI(){
        /* disable answer & hangup button */
        self.answerBtn.isEnabled = false
        self.hangupBtn.isEnabled = false
        OperationQueue.main.addOperation { 
            self.callLbl.text = ""
        }

    }

    //MARK: PivoEndpoint Delegate
    func onLogin() {
        print("Login successful")
    }
    
    func onLoginFailed() {
        print("Login failed")
    }
    
    func onIncomingCall(_ incoming: PlivoIncoming!) {
        OperationQueue.main.addOperation {
            self.callLbl.text = incoming.fromContact
        }
        self.incCall = incoming;
        self.answerBtn.isEnabled = true
        self.hangupBtn.isEnabled = true

    }
    
    func onIncomingCallHangup(_ incoming: PlivoIncoming!) {
        self.resetUI()
    }

    func onIncomingCallRejected(_ incoming: PlivoIncoming!) {
        self.resetUI()
    }
    
    @IBAction func answerCall(_ sender: UIButton){
        if let inCall = incCall{
            inCall.answer()
            self.answerBtn.isEnabled = false
        }
    }

    @IBAction func hangupCall(_ sender: UIButton){
        if let inCall = incCall{
            inCall.hangup()
            self.answerBtn.isEnabled = false
        }
        self.resetUI()
    }



    
}

