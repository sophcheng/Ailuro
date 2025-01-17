//
//  CrashView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData

struct KitKotView: View {
    
    //View model
    @StateObject var vm = KitKotViewModel()

    //Store whether heart was pressed
    @State var foot1 = FootData(index: 1)
    @State var foot2 = FootData(index: 2)
    @State var foot3 = FootData(index: 3)
    
    //Update data operations
    @Environment(\.modelContext) private var context
    @Query(sort: \FootData.index, order: .forward) var feet: [FootData]
    
    var body: some View {

        NavigationStack{
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                
                TabView{
                    ZStack{
                        ScrollView(showsIndicators: false){
                            VStack{
                                Page0View()
                                Page1View()
                            }
                        }
                        ButtonsView(foot: $foot1)
                            .onAppear{
                                foot1 = vm.findFoot(target: 1, context: context)
                            }
                    }
                    .onTapGesture(
                        count: 2,
                        perform:{
                            self.foot1.isHearted.toggle()
                            vm.updateData(foot: foot1, context: context)
                        })
                    
                    ZStack{
                        Page2View()
                        ButtonsView(foot: $foot2)
                            .onAppear{
                                foot2 = vm.findFoot(target: 2, context: context)
                            }
                    }
                    .onTapGesture(
                        count: 2,
                        perform:{
                            self.foot2.isHearted.toggle()
                            vm.updateData(foot: foot2, context: context)
                        })
                    ZStack{
                        Page3View()
                        ButtonsView(foot: $foot3)
                            .onAppear{
                                foot3 = vm.findFoot(target: 3, context: context)
                            }
                    }
                    .onTapGesture(
                        count: 2,
                        perform:{
                            self.foot3.isHearted.toggle()
                            vm.updateData(foot: foot3, context: context)
                        })
                }
            }
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .font(.system(size: 18, weight: .semibold, design: .monospaced))
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
@Observable
class KitKotViewModel: ObservableObject{
    func fetchFeet(context: ModelContext) -> [FootData]{
        let fetchDescriptor = FetchDescriptor<FootData>()
        do{
            let feet = try context.fetch(fetchDescriptor)
            return feet
        }
        catch{
            print("Error fetching: \(error)")
            return []
        }
    }
    
    func findFoot(target: Int, context: ModelContext) -> FootData{
        let feet = fetchFeet(context: context)
            for foot in feet {
                if (foot.index == target){
                    return foot
                }
            }
        return FootData(index: target)
    }
    
    func updateData(foot: FootData, context: ModelContext){
            context.insert(foot)
        do{
            try context.save()
        }
        catch{
            print("Error: \(error)")
        }
    }
}

#Preview {
    KitKotView()
        .modelContainer(for: [CatData.self, FootData.self], inMemory: false)
}
