//
//  ChatView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData

struct MenuView: View {
    
    //Header image
    @State var rotationA = 0
    @State var rotationB = 0
    @State var rotationC = 0
    
    //Add Cat button style
    @State var listCol = Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1))
    @State var lab = "Hire a Cat or AI!"
    @State var addCol = Color.yellow
    
    //Add Cat button logic
    @State var count = 0
    @State var litterIndex = 0
    
    //Go button logic
    @State var canAdvance = false
    @State var isLocked = false
    
    //Max # of cats addable
    let maxCount = 6
    
    //Cats to be added
    let litter = [
        "MIT-10s",
        "CatGPT",
        "Kitt-E",
        "Boss",
        "Meowfficial",
        "Purrson"
    ]

    //Update data operations
    @Environment(\.modelContext) private var context
    
    //From local data store into array
    @Query(sort: \CatData.name, order: .forward) var cats: [CatData]
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)), .black, .black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Image("ailuroCrash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(Double(rotationA)))
                    .frame(width: 160)
                    .position(x: 320, y:-5)
                    .rotationEffect(.degrees(Double(rotationA)))
                    .onAppear{
                        withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)){
                            rotationA = 360
                        }
                    }

                Image("ailuroWorld")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 30)
                    .rotationEffect(.degrees(Double(rotationC)))
                    .frame(width: 260)
                    .position(x: 50, y: -50)
                    .rotationEffect(.degrees(Double(rotationC)))
                    .onAppear{
                        withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)){
                            rotationC = 360
                        }
                    }

                VStack{
                    Image("ailuroCat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                        .foregroundStyle(.pink)
                        .fontWeight(.semibold)
                        .rotationEffect(.degrees(Double(rotationB)))
                        .onAppear{
                            withAnimation(.linear(duration: 6).repeatForever()){
                                rotationB = 45
                            }
                        }
                    VStack{
                        Text("Welco-meow to AI-LURO.")
                            .fontWeight(.heavy)
                            .foregroundStyle(.yellow)
                            .padding(.bottom, 0.7)
                        Text("(Earth, but with more cats.)")
                            .padding(.bottom, 0.7)
                        Text("Cats & AI are AILUROs. They do Clean Energy planning!")
                    }
                    .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                    List {
                        ForEach (cats) { cat in
                            Text(cat.name)
                                .foregroundStyle(cat.isAI() ? Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)) : Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                                .fontWeight(.heavy)
                        }
                    }
                    .frame(height: 170)
                        .listStyle(PlainListStyle())
                        .cornerRadius(10)
                    VStack{
                        Text("Meet your employees:")
                        Text("some ailuro")
                            .foregroundStyle(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                            .fontWeight(.heavy)
                        + Text(", ")
                        + Text("some AI")
                            .foregroundStyle(Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                            .fontWeight(.heavy)
                        + Text("!")
                    }
                    .foregroundColor(.yellow)
                    .padding()
                    HStack{
                        Button(action:{
                            for kitty in cats{
                                kickCat(cat: kitty)
                            }
                            canAdvance = false
                            isLocked = false
                        }, label:{
                            Image(systemName: "arrow.clockwise")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.black)
                                .frame(width: 60, height: 80)
                                .background(addCol == Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)) || count == 0 ? Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)) : Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                                .cornerRadius(50)
                        })
                        Button(action: {
                            litterIndex = Int.random(in: 0..<6)
                            count = cats.count
                            if(count < maxCount){
                                lab = "Hire a Cat or AI!"
                                addCol = Color(.yellow)
                                addCat(name: litter[litterIndex])
                                count += 1
                            }
                            else{
                                lab = "Ready to go?"
                                addCol = Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1))
                                if(!isLocked){
                                    isLocked = lockCats()
                                }
                            }
                        }, label:{
                            Text(lab)
                                .foregroundStyle(Color.black)
                                .frame(height: 80)
                                .frame(maxWidth: .infinity)
                                .background(addCol)
                                .cornerRadius(20)
                                .opacity(!canAdvance ? 1 : 0.6)
                                .font(.system(size: 16, weight: .heavy, design: .monospaced))
                            
                        })
                        NavigationLink(destination: PlanetView()){
                            Text("GO!")
                                .frame(width: 40, height: 40)
                                .foregroundStyle(canAdvance ? Color.black : Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                                .frame(width: 60, height: 80)
                                .background(canAdvance ? Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)) : .black )
                                .opacity(canAdvance ? 1 : 0.5)
                                .cornerRadius(50)
                        }
                        .disabled(!canAdvance)
  
                    }
                    NavigationLink(destination: ContentView()){
                        Image(systemName: "house.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.white)
                            .opacity(0.8)
                                }
                    .padding(7)
                }
                .padding(40)
            }
            .font(.system(size: 16, weight: .semibold, design: .monospaced))
        }
        .navigationBarBackButtonHidden(true)
}
    func lockCats() -> Bool {
        canAdvance = true
        return count > 0
    }
    func addCat(name: String){
        
            //Create cat
            let cat = CatData(name: name)
        
            //Add cat to data context
            context.insert(cat)
        do{
            try context.save()
        }
        catch{
            print("Failed to save: \(error)")
        }
    }
    func kickCat(cat: CatData){
        context.delete(cat)
        do{
            try context.save()
        }
        catch{
            print("Failed to save: \(error)")
        }
    }
}

#Preview {
    MenuView().modelContainer(for: [CatData.self, FootData.self], inMemory: false)
}
