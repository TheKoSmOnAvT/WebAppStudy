//
//  HeroesViewModel.swift
//  webStudyApp
//
//  Created by Никита Попов on 17.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Alamofire
import Combine
import Foundation

class HeroesViewModel : ObservableObject {
    @Published var heroes : [Hero] = []
    var cancellation: AnyCancellable?
    let service = HeroService() 
    
    init() {
        fetchHeroes()
    }
    
    func fetchHeroes() {
        cancellation = service.fetch()
        .mapError({ (error) -> Error in
            print(error)
            return error
        })
        .sink(receiveCompletion: { _ in }, receiveValue: { heroes in
                self.heroes = heroes
        })
    }
}
