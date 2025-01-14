//
//  SortFilterMapBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/14/25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationVewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Thomas", points: 100, isVerified: true)
        let user2 = UserModel(name: "Dick", points: 200, isVerified: false)
        let user3 = UserModel(name: "Harry", points: 300, isVerified: true)
        let user4 = UserModel(name: "Joe", points: 400, isVerified: false)
        let user5 = UserModel(name: "Sue", points: 500, isVerified: true)
        let user6 = UserModel(name: "Fred", points: 600, isVerified: false)
        let user7 = UserModel(name: "Barney", points: 700, isVerified: true)
        let user8 = UserModel(name: "Wilma", points: 800, isVerified: false)
        let user9 = UserModel(name: "Betty", points: 900, isVerified: true)
        let user10 = UserModel(name: "Dr. DoLittle", points: 1000, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10
        ])
    }
    
    func updateFilteredArray() {
        // Sorted array --------------------------------------------------------
//        filteredArray = dataArray.sorted { (user1, user2) -> Bool in
//            return user1.points > user2.points
//        }
//        filteredArray = dataArray.sorted(by: { $0.points < $1.points } )
        
        // Filtered Array ------------------------------------------------------
//        filteredArray = dataArray.filter( { (user) -> Bool in
//            return user.points > 500      // Greater than 500
//            return !user.isVerified        Non verified user
//            return user.name.contains("i")// USer with an "i" in their name
//        })
        // Or
//        filteredArray = dataArray.filter({ $0.isVerified })
            
        // Mapped Array --------------------------------------------------------
    }
}

struct SortFilterMapBootcamp: View {
    
    @StateObject var vm = ArrayModificationVewModel()
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                ForEach(vm.filteredArray) { user in
                    VStack (alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        HStack {
                            Text("Points: \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.cornerRadius(10))
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    SortFilterMapBootcamp()
}
