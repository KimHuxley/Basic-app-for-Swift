//
//  Zakladka 1.swift
//  Projekt
//
//  Created by Wiktor on 08/06/2025.
//

import Foundation
import SwiftUI

struct Zakladka1: View {
    @Binding var wybranaZakladka: Int
    var body: some View {
        ZStack{
            LinearGradient(colors: [.pink, .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .all)
            
            VStack{
                Text("Home")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .bold()
                    .padding()
                    
                Spacer()
                
                Image("Home")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 250, height: 250)
                
                
                Spacer()
                Spacer()
                
                Button(action:
                        {
                    self.wybranaZakladka = 4
                }
                       
                )
                {
                    Text("Ustawienia")
                }
            }
        }
    }
}

