//
//  SuperHero.swift
//  HeroWidget
//
//  Created by Vedat Dokuzkardeş on 4.12.2023.
//

import Foundation

struct SuperHero : Identifiable, Codable {
    
    let image : String
    let name : String
    let realName : String
    
    var id : String {image}
    
}

let superman = SuperHero(image: "superman", name: "SuperMan", realName: "Clark Kent")

let batman = SuperHero(image: "batman", name: "Batman", realName: "Bruce Wayne")

let captan = SuperHero(image: "captan", name: "Captain America", realName: "Chris Evans")
