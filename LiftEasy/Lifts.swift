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
    var weights =
    [
        0.0, //orm
        0.0, //ninety
        0.0, //eighty
        0.0, //seventy
        0.0, //sixty
        0.0  //fifty
    ]
    
    func equalise(value: Double)
    {
        let orm = value
        
        weights[0] = orm
        weights[1] = orm * 0.9
        weights[2] = orm * 0.8
        weights[3] = orm * 0.7
        weights[4] = orm * 0.6
        weights[5] = orm * 0.5
        
        for i in 0...5
        {
            weights[i] = rounding(value: weights[i])
        }
        
    }
    
    
    //round to the nearest 2.5kg (this is the smallest weight increment in gyms
    func rounding(value: Double) -> Double
    {
        var value = value
        
        //round to nearest 2.5
        value = value / 2.5
        value.round()
        value = value * 2.5
        
        return value
    }
}
