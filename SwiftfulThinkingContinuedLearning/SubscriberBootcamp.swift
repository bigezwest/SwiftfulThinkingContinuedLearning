//
//  SubscriberBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/17/25.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    var timer: AnyCancellable?
    
    init() {
        setUpTimer()
    }
    
    func setUpTimer() {
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.count += 1
            }
    }
}

struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    SubscriberBootcamp()
}
