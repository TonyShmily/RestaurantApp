//
//  Restaurant.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/11.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import Foundation

struct Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var isVisited: Bool
    var rating = ""
    
    init(name: String, type: String, location: String,image: String,isVisited: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
    
    
}

//let re = Restaurant(name: <#T##String#>, type: <#T##String#>, location: <#T##String#>, image: <#T##String#>, isVisited: <#T##Bool#>)