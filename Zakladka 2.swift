//
//  Zakladka 2.swift
//  Projekt
//
//  Created by Wiktor on 08/06/2025.
//

import Foundation
import SwiftUI

struct Zakladka2: View {
    @Binding var wybranaZakladka: Int
    var body: some View {
        ZStack {
        
            LinearGradient(colors: [.pink, .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .all)
            VStack {
                
                
                ZakladkaContentView()
            }
        }
        
    }
}

