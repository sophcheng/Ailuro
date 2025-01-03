//
//  ChatView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData
//TODO: Diff # of each cat proportional to their priority?
struct ChatView: View {

    //Specify path with backslash
    @StateObject var vm = ChatViewModel()
    
    //Header image
    @State var rotation = 0
    
    //Add Cat button
    @State var lab = "Hire a Cat or AI!"
    @State var buttonCol = Color.yellow
    @State var count = 0
    @State var litterIndex = 0
    
    //Cats to be added
    var litter = [
        "M-IT-10s",
        "CatGPT",
        "Kitt-E",
        "Mr. Whiskers",
        "Snoop",
        "Purrcy"
    ]
    
    //Update data operations
    @Environment(\.modelContext) private var context //Update operations via context
    @Query(sort: \CatData.name, order: .forward) var cats: [CatData] //from local data store into arr
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        
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
                    }
                    
                    Text("Welco-meow to Planet AI-LURO.")
                        .foregroundStyle(.yellow)
                        .padding()
                    List {
                        ForEach (cats) { cat in
                            Text(cat.name)
                                .foregroundStyle(Color.black)
                        }
                        .onDelete { indices in
                            for index in indices {
                                vm.kickCat(cats[index], context: context)
                            }
                            count = cats.count
                            if(count == 9){
                                lab = "Click to add a cat!"
                                buttonCol = Color.yellow
                            }
                        }
                    }
                    .cornerRadius(10)
                    HStack{
                        Button(action:{
                            for kitty in cats{
                                vm.kickCat(kitty, context: context)
                            }
                        }, label:{
                            Text("Restart")
                                .foregroundStyle(buttonCol == Color(#colorLiteral(red: 0.5052474141, green: 0.530225575, blue: 0.8416277766, alpha: 1)) || count == 0 ? Color.yellow : Color.black)
                            //TODO: add animation?
                                .frame(height: 80)
                                .frame(maxWidth: .infinity)
                                .background(buttonCol == Color(#colorLiteral(red: 0.5052474141, green: 0.530225575, blue: 0.8416277766, alpha: 1)) || count == 0 ? Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)) : Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                                .cornerRadius(20)
                                .font(.system(size: 16, weight: .heavy, design: .monospaced))
//                                .onTapGesture {
//                                    withAnimation(.linear(duration: 2)){
//                                        TODO
//                                    }
//
//                                }
                                                    })
                        Button(action: {
                            litterIndex = Int.random(in: 0..<6)
                            count = cats.count
                            if(count < 10){
                                lab = "Hire a Cat or AI!"
                                buttonCol = Color(.yellow)
                                vm.addCat(name: litter[litterIndex], context: context)
                                count += 1
                            }
                            else{
                                lab = "Too many cats...paw-se."
                                buttonCol = Color(#colorLiteral(red: 0.5052474141, green: 0.530225575, blue: 0.8416277766, alpha: 1))
                            }
                        }, label:{
                            Text(lab)
                                .foregroundStyle(Color.black)
                                .frame(height: 80)
                                .frame(maxWidth: .infinity)
                                .background(buttonCol)
                                .cornerRadius(20)
                                .font(.system(size: 16, weight: .heavy, design: .monospaced))
                            
                        }) // Adds cat
                        
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
    
    func kickCat(_ cat: CatData, context: ModelContext){
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
    ChatView().modelContainer(for: CatData.self)
}
