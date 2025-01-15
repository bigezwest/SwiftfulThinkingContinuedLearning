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
    }
}
struct CoreDataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoreDataViewModel()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoreDataRelationshipsBootcamp()
}
