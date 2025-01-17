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
    var cancellables = Set<AnyCancellable>()
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    init() {
        setUpTimer()
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
            }
            .store(in: &cancellables)
    }
    func addTextFieldSubscriber() {
        $textFieldText
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.textIsValid, on: self)
            .store(in: &cancellables)
    }
}

struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            TextField("type something here.. ", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    SubscriberBootcamp()
}
