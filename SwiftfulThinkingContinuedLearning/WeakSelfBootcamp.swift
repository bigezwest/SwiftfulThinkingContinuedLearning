//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/15/25.
//

import SwiftUI

struct WeakSelfBootcamp: View {
 
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination:
                WeakSelfSecondScreen())
                .navigationTitle("Screen 1")
    
        }
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
        getData()
    }
    deinit {
        print("DEINITIALIZE NOW")
    }
    func getData() {
        data = "NEW DATA!!!"
    }
    
}

#Preview {
    WeakSelfBootcamp()
}
