//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/15/25.
//

import SwiftUI
import CoreData

/*
 3 Entities
     - Business entity
     - Departemtn entity
     - Employee entity
 */

class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
        context = container.viewContext
    }
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error Saving Core Data: \(error.localizedDescription)")
        }
    }
}
class CoreDataRelationshipViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
    }
    func save() {
        manager.save()
        print("Saved Successfully")
    }
}

struct CoreDataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoreDataRelationshipViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    Button(action: {
                        vm.addBusiness()
                    }, label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    })
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

#Preview {
    CoreDataRelationshipsBootcamp()
}
