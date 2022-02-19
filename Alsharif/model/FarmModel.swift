//
//  FarmModel.swift
//  Alsharif
//
//  Created by Ali Shaheen on 09/02/2022.
//

import Foundation
struct FarmModel :Codable {
    var EstateType : String?
    let title:String
    let contract:String
    let area:String
    let numberOfWells:String
    let numberOfPalms:String
    let contact:String
    let price:String
    let details:String
    let longitude:Double
    let latitude:Double
    let image1:String
    let image2:String
    let image3:String
}
