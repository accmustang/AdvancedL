//
//  GenericsAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 11.05.2024.
//

import SwiftUI

struct StringModel{
    let info: String?
    func removeInfo()->StringModel{
        StringModel(info: nil)
    }
}
struct BoolModel{
    let info: Bool?
    func removeInfo()->BoolModel{
        BoolModel(info: nil)
    }
}

struct GenericModel<T>{
    let info: T?
    func removeInfo()-> GenericModel{
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject{
    
    @Published var stringModel = StringModel(info: "Test2")
    @Published var boolModel = BoolModel(info: true)
    @Published var genericStringModel = GenericModel(info: "Test 1 falan")
    @Published var genericBoolModel = GenericModel(info: true)
    
}
struct GenericsAL: View {
    @StateObject private var vm = GenericsViewModel()
    var body: some View {
        VStack{
            Text("\(vm.stringModel.info ?? "no data string")")
            Text("\(vm.boolModel.info?.description ?? "no data bool")")
            Text("\(vm.genericBoolModel.info?.description ?? "no data bool")")
            Text("\(vm.genericStringModel.info?.description ?? "no string bool")")
        }
    }
}

#Preview {
    GenericsAL()
}
