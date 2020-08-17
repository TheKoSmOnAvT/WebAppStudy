//
//  HeroesView.swift
//  webStudyApp
//
//  Created by Никита Попов on 17.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct HeroesView: View {
    @ObservedObject var viewModel = HeroesViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.heroes) { hero in
                HStack {
                    VStack(alignment: .leading) {
                        
                        NavigationLink(destination: HeroView(id: hero.id)) {
                           Text(hero.name)
                        }
                        
                    }
                }
            }
        }
        .navigationBarTitle("Navigation", displayMode: .inline)
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView()
    }
}
