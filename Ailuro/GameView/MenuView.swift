//
//  ChatView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData

struct ChatView: View {

    @StateObject var vm = ChatViewModel()
    
    //Header image
    @State var rotation = 0
    
    //Add Cat button
    @State var listCol = Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1))
    @State var lab = "Hire a Cat or AI!"
    @State var addCol = Color.yellow
    @State var count = 0
    @State var litterIndex = 0
    @State var canAdvance = false
    @State var isLocked = false
    let maxCount = 6
    
    //Game stats
    @State var work = 0
    @State var envCost = 0
    
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
                Color.black
                    .ignoresSafeArea()
                VStack{
                    Image("ailuroCat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        .foregroundStyle(.pink)
                        .fontWeight(.semibold)
                        .rotationEffect(.degrees(Double(rotation)))
//                        .scaleEffect(rotation % 2 == 0 ? 2 : 1.5)
                        .onAppear{
                            withAnimation(.linear(duration: 6).repeatForever()){
                                rotation = 45
                            }
                        }
                    VStack{
                        Text("Welco-meow to AI-LURO.")
                            .fontWeight(.heavy)
                            .foregroundStyle(.yellow)
                            .padding(.bottom, 0.7)
                        Text("(Earth, but with way more cats.)")
                            .padding(.bottom, 0.7)
                            .multilineTextAlignment(.center)
                    }
                        .foregroundStyle(.white)
                        .padding()
                    List {
                        ForEach (cats) { cat in
                            Text(cat.name)
                                .foregroundStyle(cat.isAI() ? Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)) : Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                                .fontWeight(.heavy)
                        }
                        .onDelete { indices in
                            for index in indices {
                                vm.kickCat(cat: cats[index], context: context)
                            }
                            work = 0
                            envCost = 0
                            isLocked = false
                            count = cats.count
                            if(count == maxCount - 1){
                                lab = "Click to add a cat!"
                                addCol = Color.yellow
                            }
                        }
                    }
                    .frame(height: 250)
                        .listStyle(PlainListStyle())
                        .cornerRadius(10)
                    VStack{
                        Text("Meet your 5 cat-workers:")
                            .foregroundColor(.yellow)
                        Text("some ailuro")
                            .foregroundStyle(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                            .fontWeight(.heavy)
                        + Text(", ")
                            .foregroundStyle(.yellow)
                        + Text("some AI")
                            .foregroundStyle(Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                            .fontWeight(.heavy)
                        + Text("!")
                            .foregroundStyle(.yellow)
                        Text("(swipe right to kick)")
                            .italic()
                    }
                    HStack{
                        Button(action:{
                            for kitty in cats{
                                vm.kickCat(cat: kitty, context: context)
                            }
                            work = 0
                            envCost = 0
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
                                vm.addCat(name: litter[litterIndex], context: context)
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
                        .disabled(!canAdvance) // Adds cat
  
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
            //TODO: Could use tasks to randomly update state of the app?
            .font(.system(size: 16, weight: .semibold, design: .monospaced))
        }
        .navigationBarBackButtonHidden(true)
}
    func lockCats() -> Bool {
        if(count > 0){
            for cat in cats {
                work += cat.getWorkCost()
                envCost += cat.getEnvCost()
                print("\(cat.name) W: \(cat.getWorkCost()), E: \(cat.getEnvCost())")
            }
            print("LOCKED CATS")
            print("Work: \(work) \nEnv Cost: \(envCost)\n")
        }
        canAdvance = true
        return count > 0
    }
}


@Observable
class ChatViewModel: ObservableObject{
    func addCat(name: String, context: ModelContext){
            //Create cat
            let cat = CatData(name: name)
            //Add cat to data context
            context.insert(cat)
        do{
            try context.save()
//            print("SAVED")
        }
        catch{
            print("Failed to save: \(error)")
        }
    }
    
    func kickCat(cat: CatData, context: ModelContext){
        context.delete(cat)
        do{
            try context.save()
//            print("DELETED")
        }
        catch{
            print("Failed to save: \(error)")
        }
    }
}

#Preview {
    ChatView().modelContainer(for: CatData.self, inMemory: false)
}
