//
//  PlanetView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/3/25.
//

import SwiftUI
import SwiftData

struct PlanetView: View {
    @State var isShown = false
    
    //Update data operations
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationView{
                TabView{
                    Tab("How to Play", systemImage: "info.circle"){
                        VStack{
                            Image(systemName: "cat")
                            Text("Inspired by cat-care games I'd played before, AILURO is meant to ease the user into the concept of AI.")
                                .padding()
                            Text("Take care of these cats like we take care of our planet!")
                                .italic()
                                .padding()
                                
                        }
                        .frame(width: 300)
                    }
                    
                    //            .badge("!")
                    Tab("Paw-ffice", systemImage: "pawprint.fill"){
                        OfficeView()
                    }
                    Tab("Outside", systemImage: isShown ? "door.right.hand.open" : "door.right.hand.closed"){
                        OutView()
                            .onAppear{
                                isShown = true
                            }
                            .onDisappear{
                                isShown = false
                            }
                    }
                }
                
            }
        .font(.system(size: 18, weight: .semibold, design: .monospaced))
            //        .navigationBarBackButtonHidden(true)
            
        }
    }

#Preview {
    PlanetView().modelContainer(for: CatData.self, inMemory: false)
}
