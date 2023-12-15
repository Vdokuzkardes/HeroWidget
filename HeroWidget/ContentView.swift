//
//  ContentView.swift
//  HeroWidget
//
//  Created by Vedat Dokuzkardeş on 4.12.2023.
//

import SwiftUI
import WidgetKit

let superHeroArray = [superman,batman,captan]

struct ContentView: View {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.com.vedatdokuzkardes.HeroWidget"))
    var heroData : Data = Data()
    
    var body: some View {
        VStack {
            ForEach(superHeroArray) { hero in
                HeroView(hero: hero).onTapGesture {
                    saveToDefaults(hero: hero)
                }
            }
        }
        .padding()
    }
    
    func saveToDefaults(hero : SuperHero) {
        
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetHero")
            
        }
    }
}

#Preview {
    ContentView()
}
