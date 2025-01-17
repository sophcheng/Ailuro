//
//  PlanetView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/3/25.
//

import SwiftUI
import SwiftData

struct PlanetView: View {
    
    //Manage pop-up sheet
    @State var isPopped = false
    
    //Update data operations
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        NavigationView{
                TabView{
                    Tab("How to Play", systemImage: "info.circle"){
                        ZStack{
                            Image("off0")
                                .opacity(0.5)
                            Image("foreOffGround")
                                .opacity(0.5)
                            VStack{
                                Image(systemName: "cat.fill")
                                    .foregroundStyle(.blue)
                                Text("R U L E S")
                                    .font(.system(size: 25, weight: .heavy, design: .monospaced))
                                    .padding(.top, 5)
                                HStack(alignment: .center){
                                    VStack{
                                        Text("Paw-er:")
                                            .fontWeight(.heavy)
                                        Text("Measures")
                                            .foregroundStyle(Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)))
                                        + Text(" work capacity. ")
                                            .fontWeight(.heavy)
                                        + Text("Work supports Clean Energy!")
                                            .foregroundStyle(Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)))

                                    }
                                    .padding()
                                    VStack{
                                        Text("Pawprint:")
                                            .fontWeight(.heavy)
                                        Text("Measures ")
                                            .foregroundStyle(Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)))
                                        + Text("environmental cost. ")
                                            .fontWeight(.heavy)
                                        + Text("Counteracted by Paw-er.")
                                            .foregroundStyle(Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)))
                                    }
                                }

                                .multilineTextAlignment(.leading)
                                Text("Tap on an AILURO")
                                    .foregroundStyle(.pink)
                                    .fontWeight(.heavy)
                                + Text (" to see or update their stats!")
                                    .foregroundStyle(Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)))
                                Button(action:{
                                    isPopped = true
                                },
                                       label:{
                                    ZStack{
                                        Rectangle()
                                            .fill(.white)
                                            .frame(width: 220, height: 50)
                                            .cornerRadius(20)
                                            .shadow(radius: 10)
                                        HStack{
                                            Image(systemName: "book.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30)
                                                .foregroundStyle(.blue)
                                            Text("IN-DEPTH RULES")
                                                .fontWeight(.heavy)
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                    
                                })
                                .sheet(isPresented: $isPopped){
                                    VStack{
                                        Text("IN-DEPTH RULES")
                                            .foregroundStyle(.blue)
                                            .padding()
                                            .italic()
                                    ScrollView{
                                    VStack{
                                        Group{
                                            Image("offCatK")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 70)
                                                .shadow(radius:10)
                                            Text("Calculations behind each stat:")
                                                .fontWeight(.heavy)
                                            ZStack{
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .cornerRadius(20)
                                            Text("Cats have a fixed Pawprint, while AI's is variable. All AILUROs have variable Paw-er Level. Both stats reroll when tapping an AILURO or leaving the page.")
                                                .padding()
                                            }
                                        }
                                        
                                        Group{
                                            HStack{
                                                Image("offCatB")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                Image("offCatB.click")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                Image("offCatB.emo")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                            }
                                            .shadow(radius:10)
                                            .frame(height: 60)
                                            Text("Multiple of same AILURO on the list:")
                                                .fontWeight(.heavy)
                                            ZStack{
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .cornerRadius(20)
                                                Text("Each rolled stat is combined into a megastat for that one AILURO.\nSo, Paw-er & Pawprint each have an absolute Max of 60. (Min: 0, 18, respectively)")
                                                    .padding()
                                            }
                                        }
                                        
                                        Group{
                                            Image("offCatO.emo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .shadow(radius:10)
                                                .frame(width: 70)
                                            Text("Cats' Emotional State:")
                                                .fontWeight(.heavy)
                                            ZStack{
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .cornerRadius(20)
                                                Text("If >50% of Paw-er comes from an AI, cats in the Paw-ffice will look demotivated. (Reflects the psychological impact of pawning work off to AI!)")
                                                    .padding()
                                            }
                                        }
                                        Group{
                                            Image("offCatP.emo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .shadow(radius:10)
                                                .frame(width: 70)
                                            Text("Hard Cut-Offs:")
                                                .fontWeight(.heavy)
                                            ZStack{
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .cornerRadius(20)
                                                Text("Though Paw-er strengthens Clean Energy sources and can counteract Pawprint, it cannot if Pawprint >40. \nReflects how Clean Energy is finite, and Fossil Fuels are still crucial for heavy reliance on AI (& data centers).")
                                                    .padding()
                                            }
                                        }
                                    }
                                    }
                                    .padding()
                                    }
                                }
                                
                                Text("GOAL: Balance work & environment!")
                                    .shadow(color: .white, radius: 3)
                                    .italic()
                                    .fontWeight(.heavy)
                                    .padding()
                                    .foregroundStyle(.pink)
                                    
                                NavigationLink(destination: MenuView()){
                                    ZStack{
                                        Circle()
                                            .fill(.white)
                                            .frame(width:70)
                                            .shadow(radius: 10)
                                        Image(systemName: "arrow.uturn.backward.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .foregroundStyle(.yellow)
                                        
                                    }
                                }
                            }
                            .frame(width: 300)
                        }
                        .multilineTextAlignment(.center)
                        .font(.system(size: 18, weight: .semibold, design: .monospaced))
                    }
                    Tab("Paw-ffice", systemImage: "pawprint.fill"){
                        OfficeView()
                    }
                }
                
            }
        .tabViewStyle(DefaultTabViewStyle())
                    .navigationBarBackButtonHidden(true)
        }
    }

#Preview {
    PlanetView().modelContainer(for: CatData.self, inMemory: false)
}
