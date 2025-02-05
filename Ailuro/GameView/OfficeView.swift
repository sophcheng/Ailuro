//
//  OfficeView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/5/25.
//

import SwiftUI
import SwiftData

struct OfficeView: View {

    //Store fetched data
    @State private var cats: [CatData] = []
    @State var totalWork = 0
    @State var totalEnvCost = 0
    @State var aiWork = 0
    
    //Image names
    @State private var bossPic = "offCatB"
    @State private var meowPic = "offCatO"
    @State private var purrPic = "offCatP"
    
    //Manage pop-overs:
    @State private var popBoss = false
    @State private var popMitt = false
    @State private var popGPT = false
    @State private var popKitt = false
    @State private var popMeow = false
    @State private var popPurr = false
    
    @State private var boss = CatData()
    @State private var mitt = CatData()
    @State private var gpt = CatData()
    @State private var kitt = CatData()
    @State private var meow = CatData()
    @State private var purr = CatData()
    
    //Update data operations
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
            VStack{
                ZStack{
                    
                    /*GAME OBJECTIVE: Balance paw-er & pawprint
                    Hard cutoff alt. condition represents how clean energy (paw-er) can only sustain so long (restricted by nature's variables)
                    Cats' moods will be affected by aiWork value (fulfillment) (slack off/sad)*/
                    
                    Image("off0")
                    if(totalEnvCost - totalWork > 5 || totalEnvCost > 35){
                        Image("off1")
                    }
                    if(totalEnvCost - totalWork > 10 || totalEnvCost > 40){
                        Image("off2")
                    }
                    
                    Image("foreOffGround")
                    
                    // AI Cats
                    if(mitt.name != "null"){
                        Button(action:{
                            updatePic()
                            popMitt = true
                        },label:{
                            Image(popMitt ? "offCatM.click" : "offCatM")
                        })
                        .shadow(radius: 5)
                        .popover(isPresented: $popMitt, attachmentAnchor: .point(.center), arrowEdge: .top){
                            showPop(cat: mitt)
                        }.offset(x: 85, y:-230)
                        
                    }
            
                    if(gpt.name != "null"){
                        Button(action:{
                            updatePic()
                            popGPT = true
                        },label:{
                            Image(popGPT ? "offCatG.click" : "offCatG")
                        })
                        .shadow(radius: 5)
                        .popover(isPresented: $popGPT, attachmentAnchor: .point(.top), arrowEdge: .bottom){
                            showPop(cat: gpt)
                        }
                        .offset(x: 0, y:-50)
                    }
                    
                    if(kitt.name != "null"){
                        Button(action:{
                            updatePic()
                            popKitt = true
                        },label:{
                            Image(popKitt ? "offCatK.click" : "offCatK")
                        })
                        .shadow(radius: 5)
                        .popover(isPresented: $popKitt, attachmentAnchor: .point(.top), arrowEdge: .bottom){
                            showPop(cat: kitt)
                        }
                        .offset(x: -100, y: 55)
                    }
                    
                    // Cats
                    if(boss.name != "null"){
                        Button(action:{
                            updatePic()
                            popBoss = true
                        },label:{
                            Image(popBoss ? "offCatB.click" : bossPic)
                        })
                        .shadow(radius: 5)
                        .popover(isPresented: $popBoss, attachmentAnchor: .point(.top), arrowEdge: .bottom){
                            showPop(cat: boss)
                        }
                        .offset(x: 150, y: -35)
                    }
                    
                    if(meow.name != "null"){
                        Button(action:{
                            updatePic()
                            popMeow = true
                        },label:{
                            Image(popMeow ? "offCatO.click" : meowPic)
                        })
                        
                        .shadow(radius: 5)
                        .popover(isPresented: $popMeow, attachmentAnchor: .point(.top), arrowEdge: .bottom){
                            showPop(cat: meow)
                        }
                        .offset(x: 80, y: 85)
                    }
                    
                    if(purr.name != "null"){
                        Button(action:{
                            updatePic()
                            popPurr = true
                        },label:{
                            Image(popPurr ? "offCatP.click" : purrPic)
                        })
                        .popover(isPresented: $popPurr, attachmentAnchor: .point(.trailing), arrowEdge: .leading){
                            showPop(cat: purr)
                        }
                        .shadow(radius: 3)
                        .offset(x: -120, y:250)
                    }
                    
                }
                VStack{
                Text("COR-PURR-ATE REVIEW:")
                    .fontWeight(.heavy)
                    HStack{
                        Text("Paw-er: \(totalWork),")
                        Text("Pawprint: \(totalEnvCost)")
                    }
                }
                .padding(.bottom, 5)
            }
            .onAppear{
                //Store cats list
                self.cats = fetchCats()
                
                //Assign listed cats
                boss = findCat(name: "Boss")
                mitt = findCat(name: "MIT-10s")
                gpt = findCat(name: "CatGPT")
                kitt = findCat(name: "Kitt-E")
                meow = findCat(name: "Meowfficial")
                purr = findCat(name: "Purrson")
                
                //Get preliminary stats/visuals
                let stat = getMegastat(name: "null")
                totalWork = stat[2]
                totalEnvCost = stat[3]
                aiWork = stat[4] //catWork = totalWork - aiWork
                updatePic()
            }
            .font(.system(size: 16, weight: .semibold, design: .monospaced))
            .frame(height: 750)
    }
    
    //Data Functions
    func fetchCats() -> [CatData]{
        let fetchDescriptor = FetchDescriptor<CatData>()
        do{
            let cats = try context.fetch(fetchDescriptor)
            return cats
        }
        catch{
            print("Error fetching: \(error)")
            return []
        }
    }
    
    //Separate func to fetch specific cat from menu list
    func findCat(name: String) -> CatData {
            for cat in cats {
                if (cat.name == name){
                    return cat
                }
            }
            return CatData()
    }
    
    //Update all stats
    func getMegastat(name: String) -> [Int]{
        var work = 0
        var envCost = 0
        var totWork = 0
        var totEnvCost = 0
        var aiWork = 0
        for cat in cats{
            let w = cat.getWorkCost()
            let e = cat.getEnvCost()
            if(name != "null" && cat.name == name){
                work += w
                envCost += e
            }
            if(cat.isAI()){
                aiWork += w
            }
            totWork += w
            totEnvCost += e
        }
        return [work, envCost, totWork, totEnvCost, aiWork]
    }

    //Display Functions
    func updatePic(){
        if aiWork > totalWork - aiWork {
            bossPic = "offCatB.emo"
            meowPic = "offCatO.emo"
            purrPic = "offCatP.emo"
        }
        else{
            bossPic = "offCatB"
            meowPic = "offCatO"
            purrPic = "offCatP"
        }
    }
    func showPop(cat: CatData) -> some View{
        ZStack{
            Color(cat.isAI() ? #colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1) : .white)
                .ignoresSafeArea()
        VStack{
            Group{
                let stat = getMegastat(name: cat.name)
            Text(cat.name)
                .fontWeight(.heavy)
                .onAppear{
                    totalWork = stat[2]
                    totalEnvCost = stat[3]
                }
                Text("Paw-er Level:")
                + Text(" \(stat[0])")
                    .fontWeight(.heavy)
                Text("Carbon Pawprint:")
                + Text(" \(stat[1])")
                    .fontWeight(.heavy)
                    
            }
            .foregroundStyle(cat.isAI() ? Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)) : Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
        }
        .padding()
        }
        .presentationCompactAdaptation(.none)
    }
}

#Preview {
    OfficeView().modelContainer(for: CatData.self, inMemory: false)
}
