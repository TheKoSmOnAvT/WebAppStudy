//
//  HeroViewModel.swift
//  webStudyApp
//
//  Created by Никита Попов on 17.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation
import Combine

class HeroViewModel: ObservableObject {

    @Published var hero: Hero?
    var cancellation: AnyCancellable?
    let service = HeroService()
   
    func getHero(id: Int) {
       cancellation = service.get(id: id)
       .mapError({ (error) -> Error in
           print(error)
           return error
       })
       .sink(receiveCompletion: { _ in },
             receiveValue: { hero in
               self.hero = hero
       })
   }
}
