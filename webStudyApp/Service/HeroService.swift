//
//  HeroService.swift
//  webStudyApp
//
//  Created by Никита Попов on 17.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class HeroService {
    let url =  "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/"
    
    func fetch() -> AnyPublisher<[Hero],AFError>{
        let publisher = AF.request(url+"all.json").publishDecodable(type : [Hero].self)
        return publisher.value()
    }
    func get(id: Int)  -> AnyPublisher<Hero, AFError> {
        let publisher = AF.request("\(url)id/\(id).json").publishDecodable(type: Hero.self)
        return publisher.value()
    }
}
