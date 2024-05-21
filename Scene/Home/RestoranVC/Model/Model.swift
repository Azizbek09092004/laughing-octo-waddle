//
//  Model.swift
//  Uzum Tezkor App
//
//  Created by islombek on 01/02/24.
//

import UIKit

struct MainModel {
    var category: [RestaurantCategory]
    var recomendation: [RestaurantRecomendation]
    var restaurants: [RestaurantModel]
}

struct RestaurantRecomendation {
    let imageName: String
    let title: String
}

struct RestaurantCategory {
    let imageName: String
}

struct RestaurantModel {
    
    let image: String
    let title: String
}
