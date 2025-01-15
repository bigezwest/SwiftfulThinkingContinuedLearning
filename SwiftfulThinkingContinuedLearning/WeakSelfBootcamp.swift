//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/15/25.
//

import SwiftUI

struct WeakSelfBootcamp: View {

    @AppStorage("count") var count: Int?
    init() {
         count = 0
    }
    var body: some View {
        
        NavigationView {
            NavigationLink("Navigate", destination:
                WeakSelfSecondScreen())
                .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.cornerRadius(10))
            , alignment: .topTrailing
        )
    }
}
struct WeakSelfSecondScreen: View {

    @StateObject var vm = WeakSelfSecondScreenViewModel()

    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .foregroundColor(.red)
        if let data = vm.data {
            Text(data)
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("INITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    deinit {
        print("DEINITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    func getData() {
        data = "NEW DATA!!!"
    }
    
}

#Preview {
    WeakSelfBootcamp()
}
