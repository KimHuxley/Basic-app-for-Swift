//
//  ContentView.swift
//  Projekt
//
//  Created by Wiktor on 08/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State var wybranaZakladka = 1
    var body: some View {
        
        TabView(selection: $wybranaZakladka){
            Zakladka1(wybranaZakladka: $wybranaZakladka)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }.tag(1)
            Zakladka2(wybranaZakladka: $wybranaZakladka)
                .tabItem{
                    Image(systemName: "info.circle")
                    Text("Newsy")
                }.tag(2)
            Zakladka3(wybranaZakladka: $wybranaZakladka)
                .tabItem{
                    Image(systemName:"figure.walk")
                    Text("Do zrobienia")
                }.tag(3)
            Zakladka4(wybranaZakladka: $wybranaZakladka)
                .tabItem{
                    Image(systemName: "gear")
                    Text("Ustawiena")
                }.tag(4)
        }
    }
}



#Preview {
    ContentView()
}
