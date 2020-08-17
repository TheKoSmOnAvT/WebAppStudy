//
//  HeroView.swift
//  webStudyApp
//
//  Created by Никита Попов on 17.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI
import URLImage

struct HeroView: View {
   var id: Int?
    
    @ObservedObject var viewModel = HeroViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.hero?.name ?? "")
            .font(.title)
            Image(url: viewModel.hero?.images?.large ?? "")
        }.onAppear {
            self.viewModel.getHero(id: self.id ?? 0)
        }
        
    }
}

struct Image: View {
    var url: String?

    var body: some View {
        guard let u = URL(string: url ?? "") else {
            return AnyView(Text("Loading..."))
        }
        return AnyView(URLImage(u))
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
