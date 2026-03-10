//
//  Zakladka 4.swift
//  Projekt
//
//  Created by Wiktor on 08/06/2025.
//

import Foundation
import SwiftUI

struct Zakladka4: View {
    @State private var pokazCos = true
    @State private var sliderVolume = 50.0
    @State private var ilosc = 1
    @State private var min = 0
    @State private var max = 10
    @State private var wybraneMiasto = 0
    var minVolume = 0.0
    var maxVolume = 100.0
    var typyMiast =
    ["Wroclaw", "Warszawa", "Krakow", "Gdansk",
    "Szczecin", "Poznan", "Bielsko-Biala"]
    @State private var wibracje = false
    @State private var notifMode = 0
    var modes = ["Wyłączony", "Nocny", "Nauka", "Nie Przeszkadzaj"]
    @Binding var wybranaZakladka: Int
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [.pink, .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .all)
            
            VStack {
                Toggle(isOn: $pokazCos){
                    Text("Wybierz tryb:")
                    
                        .bold()
                }
                .padding()
                .background(pokazCos ? Color.green : Color.gray)
                
                
                if pokazCos == true{
                    Text("online")
                }
                else{
                    Text("offline")
                }
                Spacer()
            }
            VStack{
                
                HStack{
                    Text("\(Int(minVolume))")
                    Slider(value: $sliderVolume,
                           in: minVolume...maxVolume)
                    Text("\(Int(maxVolume))")
                }.padding()
                Text("Dźwięk: \(Int(sliderVolume))")
                
                
                
                Spacer()
                    .frame(minHeight: 200, maxHeight: 350)
            }
            Spacer()
                .frame(minHeight:200, maxHeight: 350)
            VStack{
                Picker(selection: $wybraneMiasto,
                       label: Text("Miasto").bold()) {
                    ForEach(0 ..< typyMiast.count){
                        Text(self.typyMiast[$0]).tag($0)
                    }
                }
                       .padding()
                       .frame(minHeight: 250)
                
                Text("Twoje miasto: \(typyMiast[wybraneMiasto])")
                Spacer()
                    .frame(maxHeight: 50)
                
                Form {
                    Section(header: Text("Zadanie")) {
                        Toggle(isOn: $wibracje){
                            Text("Wibracje")
                        }
                        Picker(selection: $notifMode,
                               label: Text(
                                "Wybierz tryb")) {
                                    ForEach(0..<modes.count) {
                                        Text(self.modes[$0])
                                    }
                                }
                    }
                    Section(header: Text("Coś o Apce")) {
                        HStack {
                            Text("Nazwa")
                            Spacer()
                            Text("HOmeSCreen")
                        }
                        HStack {
                            Text("Version")
                            Spacer()
                            Text("beta 1.0")
                        }
                        HStack {
                            Text("Developed by")
                            Spacer()
                            Text("Wiktor Krywult")
                        }
                    }
                }
                .frame(height:350)
                
                Spacer()
                    .frame(maxHeight: 250)
            }
        }
    }
}

