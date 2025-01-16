//
//  CodableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/16/25.
//

import SwiftUI

struct CustomerModel: Identifiable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
}

class CodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = CustomerModel(
        id: "1",
        name: "Tom",
        points: 5,
        isPremium: true
    )
}

struct CodableBootcamp: View {
    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack (spacing: 20) {
            if let customer = vm.customer {
                Text("Customer ID: \(customer.id)")
                Text("Customer Name: \(customer.name)")
                Text("Customer Points: \(customer.points)")
                Text("Is Premium: \(customer.isPremium)")
            } else {
                Text("Loading...")
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}