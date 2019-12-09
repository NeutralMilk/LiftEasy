//
//  Lifts.swift
//  LiftEasy
//
//  Created by Colin White on 07/12/2019.
//  Copyright © 2019 Colin White. All rights reserved.
//

import Foundation

class Lifts
{
    var name = ""
    var orm = 0.0
    var ninety = 0.0
    var eighty = 0.0
    var seventy = 0.0
    var sixty = 0.0
    var fifty = 0.0
    
    func equalise(percent: Int, value: Double)
    {
        let percent = percent
        let orm = value
        if(percent == 1)
        {
            ninety = orm * 0.9
            eighty = orm * 0.8
            seventy = orm * 0.7
            sixty = orm * 0.6
            fifty = orm * 0.5
        }
        
    }
}
