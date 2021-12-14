//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by Peter Mihók on 11/12/2021.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
