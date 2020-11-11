//
//  TimeTableModel.swift
//  HealthNotification
//
//  Created by Rotach Roman on 07.11.2020.
//

import UIKit

public struct TimeTableModel {
    
    public var timeLable: String
    public var iDistributer: Bool
    
    init(time: String) {
        self.timeLable = time
        self.iDistributer = true
    }
    
}

