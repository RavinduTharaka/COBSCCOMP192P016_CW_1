//
//  EntityModel.swift
//  COBSCCOMP192P016_CW
//
//  Created by Ravindu Tharaka Ranathunga on 2021-04-26.
//

import Foundation

struct User{
    var userName: String
    var userEmail: String
    var userMobile: String
    var userPassword: String
}

struct FoodItems {
    var id: String
    var foodName: String
    var foodDescription: String
    var foodPrice: Double
    var discount: Int
    var Image: String
    var category: String
}
struct FoodCategory {
    var id: String
    var Name : String
}
