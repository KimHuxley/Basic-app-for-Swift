//
//  kraj.swift
//  Projekt
//
//  Created by Wiktor on 12/06/2025.
//
import SwiftUI
import WebKit

struct kraj: Hashable {
    let nazwa: String
    let flaga: String
}
struct opcjeZakladki3: View {
    @State private var ilosc = 1
    @State private var min: Int = 1
    @State private var max: Int = 10
    @State private var kraje = [
        kraj(nazwa: "Naczynia", flaga: "naczynia"),
        kraj(nazwa: "Pranie", flaga: "pranie"),
        kraj(nazwa: "Odkurzanie", flaga: "odkurzanie"),
        kraj(nazwa: "Zakupy", flaga: "zakupy"),
    ]
    var body: some View {
        
            NavigationView {
                List {
                    
                    ForEach(kraje, id: \.self){
                        (kraj) in NavigationLink(destination:
                                                    VStack{
                            Text(kraj.nazwa).bold()
                            Image(kraj.flaga).resizable() .frame(width: 150, height: 100)
                        }
                        ){
                            HStack{
                                Image(kraj.flaga).resizable() .frame(width: 40, height: 30)
                                Text(kraj.nazwa)
                                
                            }
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                .navigationBarTitle("Do zrobienia")
                .navigationBarItems(leading: Button(action: dodajKraj, label: {Text("Dodaj")}), trailing: EditButton())
            
        }
        
 
    }
    func move(from source: IndexSet, to destination: Int){
        kraje.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets: IndexSet){
        
        kraje.remove(atOffsets: offsets)
    }
    func dodajKraj(){
        kraje.append(contentsOf:[                          //z podpowiedzi zeby dzialalo
            kraj(nazwa: "Gotowanie", flaga: "gotowanie"),
            kraj(nazwa: "Zadanie Domowe", flaga: "zadanie domowe"),
            kraj(nazwa: "Pranie", flaga: "pranie"),
            kraj(nazwa: "Odkurzanie", flaga: "odkurzanie"),
            kraj(nazwa: "Zakupy", flaga: "zakupy"),
        ])
    }
}



