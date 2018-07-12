//
//  CircularCustomButton.swift
//  PlivoMohitDemo
//
//  Created by Mohit Totlani on 12/07/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class CircularCustomButton: UIButton {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.layer.cornerRadius = self.layer.frame.size.height/2;
        
    }
    
}
