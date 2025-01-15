//
//  CoreDataBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/15/25.
//

import SwiftUI
import CoreData

/* MVVM Architecture
     View - UI
     Model - Datapoint
     ViewModel - Manages Data for a view
 */

class CoreDataViewModel: ObservableObject {

    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loading CoreData: \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        fetchFruits()
    }
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching \(error)")
        }
    }
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error Saving: \(error)")
        }
    }
}

struct CoreDataBootcamp: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                TextField("Add fruit here", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                Button(action: {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(10)
                        
                })
                .padding(.horizontal)

                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "No Name")
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle(Text("Fruits"))

        }
    }
}

#Preview {
    CoreDataBootcamp()
}
