//
//  WorldView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData

struct WorldView: View {
    
    @State var rotationA = 0.0
    @State var rotationB = 0.0
    
    //Update data operations
    @Environment(\.modelContext) private var context
    
    var body: some View {
        //TODO: ScrollView -> WATER, TabView -> WIND, single page -> FOSSIL FUELS...? SOLAR?
        NavigationStack{
            ZStack{
                Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1))
//                LinearGradient(gradient: Gradient(colors: [.black, Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
            VStack{
                HStack{
                    NavigationLink(destination: ContentView()){
                    ZStack{
                        Circle()
                            .fill(.black)
                        Image(systemName: "house.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.yellow)
                    }
                    .frame(width: 50)
                    }
                    .padding()
                    ZStack{
                        CircularTextView(title: "the meow yorker", radius: 50, degrees: -120, kerning: 2)
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .shadow(color: .black, radius: 6)
                            .foregroundColor(.white)
                            .frame(width: 130, height: 130)
                            .rotationEffect(.degrees(rotationB))
                            .onAppear{
                                withAnimation(.linear(duration: 100).repeatForever(autoreverses: false)){
                                    rotationB = 360
                                }
                            }
                        Circle()
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)), .blue]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 80)
                        Image(systemName: "globe.americas.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.green)
                            .frame(width: 80)
                    } //Centre globe
                    .rotationEffect(.degrees(rotationA))
                    .onAppear{
                        withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)){
                            rotationA = 360
                        }
                    }
                    
                    NavigationLink(destination: MenuView()){
                    ZStack{
                        Circle()
                            .fill(.black)
                        Image(systemName: "pawprint.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(Color(#colorLiteral(red: 0.9606881738, green: 0.4666238427, blue: 0.5169212222, alpha: 1)))
                    }
                    .frame(width: 50)
                    .padding()
                    }
                }
                
                ZStack{
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(20)
                        .ignoresSafeArea()
                        .frame(width: 370)
                    ScrollView{
                        VStack{
                            VStack{
                            Text("Examining AI's Indirect Impact on Our Planet")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 25, weight: .bold, design: .monospaced))
                                .foregroundStyle(.black)
                                HStack{
                                    Text("by Bob Purrson")
                                    Image("offCatP.emo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50)
                                        .shadow(radius: 5)
                                }
                                    .padding(.top, 5)
                            }
                            .padding()
                            Group{
                                Text("AI can track trends, crunch data, & create new datasets WAY faster.")
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.pink)
                                    .padding(.top, -10)
                                ZStack{
                                    Rectangle()
                                        .fill(.yellow)
                                        .cornerRadius(25)
                                    VStack(alignment: .center){
                                        Text("With AI, we can:")
                                            .foregroundStyle(.pink)
                                        HStack{
                                            Image("offCatK")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 70)
                                                .shadow(radius: 5)
                                                .padding(.trailing, 20)
                                            Text("Better assess Earth's current state")
                                        }
                                        HStack{
                                            Text("Better predict Earth's future")
                                            Image("offCatP")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60)
                                                .shadow(radius: 5)
                                            
                                        }
                                        HStack{
                                            Text("Design more eco-friendly!")
                                                .italic()
                                                .foregroundStyle(.pink)
                                                .padding(.trailing, 20)
                                            Image("offCatO.click")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 70)
                                                .shadow(radius: 5)
                                        }
                                    }
                                    .padding()
                                    .foregroundStyle(.blue)
                                    .fontWeight(.heavy)
                                } //With AI, we can...
                            }
                            .padding()
                            VStack(alignment: .center){
                                Text("EX. 1: Agriculture: 90% of deforestation!")
                                    .fontWeight(.heavy)
                                VStack(alignment: .leading){
                                Text("- AI: Track growth patterns")
                                Text("- Monitor, predict soil health")
                                Text("- Increase efficiency!")
                                }
                                .padding()
                                Text("EX. 2: ")
                                    .fontWeight(.heavy)
                                + Text("Google's Albedo meter: Observe local Greenhouse Effect")
                                    .fontWeight(.heavy)
                                Image("googleAlbedo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300)
                                    .cornerRadius(20)
                                    .padding()
                                Text("EX. 3: Maximize Clean Energy")
                                    .fontWeight(.heavy)
                                VStack(alignment: .leading){
                                Text("- Solar, wind, water power")
                                Text("- Fickle due to weather dependency")
                                Text("- AI: Track + anticipate nature trends!")
                                }
                                .padding()
                            }
                            Image("envGround1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300)
                                .padding()
                            ZStack{
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 0.9606881738, green: 0.4666238427, blue: 0.5169212222, alpha: 1)))
                                    .cornerRadius(25)
                                VStack(alignment: .center){
                                    Text("However, AI can:")
                                        .foregroundStyle(Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)))
                                    HStack{
                                        Image("offCatG")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 70)
                                            .shadow(radius: 5)
                                            .padding(.trailing, 20)
                                        Text("Accelerate MANY processes...")
                                    }
                                    HStack{
                                        Text("(Creative, Design, Developmental)")
                                        Image("offCatP.click")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 60)
                                            .shadow(radius: 5)
                                        
                                    }
                                    HStack{
                                        Text("Result in excess of product")
                                        Image("offCatP")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 60)
                                            .shadow(radius: 5)
                                    }
                                    HStack{
                                        Text("Promote overconsumption!")
                                            .italic()
                                            .foregroundStyle(Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)))
                                            .padding(.trailing, 20)
                                        Image("offCatP.emo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 70)
                                            .shadow(radius: 5)
                                    }
                                }
                                .padding()
                                .foregroundStyle(.white)
                                .fontWeight(.heavy)
                            }
                            .padding()
                            
                            ZStack{
                                Image("officeDraft")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(0.3)
                                VStack{
                                    Image(systemName:"exclamationmark.triangle.fill")
                                        .foregroundStyle(.pink)
                                        .imageScale(.large)
                                        .padding()
                                    Text("AI ")
                                    + Text("SEEMS like unlimited resource, ")
                                        .fontWeight(.heavy)
                                    + Text("since it's digital & growing fast. But it's ")
                                    + Text("NOT!")
                                        .fontWeight(.heavy)
                                    Text("\nFiguring technicals of energy sources, etc. are important...")
                                    Text("\nBut we must")
                                    + Text(" apply AI in moderation ")
                                            .foregroundStyle(.pink)
                                            .fontWeight(.heavy)
                                    + Text("for a healthy physical & cultural biome!")
                                        .foregroundStyle(.blue)
                                        .fontWeight(.heavy)
                                }
                                .frame(width: 250)
                                .multilineTextAlignment(.center)
                                .padding()
                            }
                            .padding()
                            
                            Text("Liked Bob's article?")
                                .italic()
                            NavigationLink(destination: KitKotView()){
                                ZStack{
                                    Rectangle()
                                        .fill(.yellow)
                                        .frame(width: 320, height: 30)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                            Text("Visit our social meow-dia!")
                                .fontWeight(.heavy)
                                .foregroundStyle(.pink)
                                .padding()
                                }
                            }
                        }
                        .foregroundStyle(Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)))
                        .frame(maxWidth: .infinity)
                        .lineLimit(15)
                        .padding()
                        .font(.system(size: 18, weight: .semibold, design: .monospaced))
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
        }
    }
}

#Preview {
    WorldView().modelContainer(for: CatData.self, inMemory: false)
}
