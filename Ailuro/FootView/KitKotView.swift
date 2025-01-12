//
//  CrashView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData

struct CrashView: View {
    
    @State private var isTextSwitched = false

    //Store whether heart was pressed
    @State var foot1 = FootData(index: 1)
    @State var foot2 = FootData(index: 2)
    @State var foot3 = FootData(index: 3)
    @State var foot4 = FootData(index: 4)
    
    //Update data operations
    @Environment(\.modelContext) private var context
    
    var body: some View {

        NavigationStack{
            TabView{
                        ZStack{
                            ScrollView(showsIndicators: false){
                                VStack{
                                    Page0View()
                                    Page1View()
                                }
                            }
                                Buttons1View(foot: $foot1)
                    }
                        .onTapGesture(
                            count: 2,
                            perform:{
                                self.foot1.isHearted.toggle()
//                                    updateData(foot: foot1)
                            })
                
                ZStack{
                    Page2View()
                    Buttons1View(foot: $foot2)
                }
                .onTapGesture(
                    count: 2,
                    perform:{
                        self.foot2.isHearted.toggle()
//                        updateData(foot: foot2)
                    })
                ZStack{
                    Page3View()
                    Buttons1View(foot: $foot3)
                }
                .onTapGesture(
                    count: 2,
                    perform:{
                        self.foot3.isHearted.toggle()
//                        updateData(foot: foot3)
                    })
                ZStack{
                    Page4View()
                    Buttons1View( foot: $foot4)
                }
                .onTapGesture(
                    count: 2,
                    perform:{ self.foot4.isHearted.toggle()
//                        updateData(foot: foot4)
                    })
            }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .font(.system(size: 18, weight: .semibold, design: .monospaced))
            .navigationBarBackButtonHidden(true)

//            .rotationEffect(.degrees(90))
        }
//    func fetchFeet() -> [FootData]{
//        let fetchDescriptor = FetchDescriptor<FootData>()
//        do{
//            let feet = try context.fetch(fetchDescriptor)
//            return feet
//        }
//        catch{
//            print("Error fetching: \(error)")
//            return []
//        }
//    }
//    
//    func hasFoot(target: FootData) -> FootData{
//            let feet = fetchFeet()
//            for foot in feet {
//                if (foot.id == target.id){
//                    return foot
//                }
//            }
//        return FootData(index: -1)
//    }
//    
//    func updateData(foot: FootData){
//        print("FETCHED: \(fetchFeet())")
//        let found = hasFoot(target: foot)
//        if(found.index != -1){
//            found.isHearted = foot.isHearted
//            print("FOUND: \(found.isHearted)")
//        }
//        else{
//            context.insert(foot)
//            print("INSERTED: \(foot.isHearted)")
//        }
//
//        do{
//            try context.save()
//            if context.hasChanges {
//                print("There are changes")
//            }
//        }
//        catch{
//            print("Error: \(error)")
//        }
//    }

    }
    


#Preview {
    CrashView().modelContainer(for: CatData.self, inMemory: false)
}
