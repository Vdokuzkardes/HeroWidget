//
//  HeroView.swift
//  HeroWidget
//
//  Created by Vedat Dokuzkardeş on 4.12.2023.
//

import SwiftUI

struct HeroView: View {
    
    let hero : SuperHero
    var body: some View {
        
        HStack{
            CircularImageView(image: Image(hero.image)).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100,alignment: .center).padding()
            
            Spacer()
            VStack{
                Text(hero.name).font(.largeTitle).fontWeight(.bold).foregroundColor(.purple)
                
                Text(hero.realName).fontWeight(.bold)
            }.padding()
                Spacer()
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
    }
}

#Preview {
    HeroView(hero: batman)
}
