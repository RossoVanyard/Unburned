//
//  DummyData.swift
//  Unburned
//
//  Created by Roland Vanhöfen on 03.07.22.
//

import Foundation

struct Info {
    var type: InfoType
    var time: Int?
    var cost: Float?
    var prep: Bool?
}

enum InfoType{
    case Time
    case Cost
    case Prep
}
