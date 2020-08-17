//
//  Hero.swift
//  webStudyApp
//
//  Created by Никита Попов on 17.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let images: Images?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case images
    }
}

struct Images: Codable {
    let large: String
    
    enum CodingKeys: String, CodingKey {
        case large = "lg"
    }
}
