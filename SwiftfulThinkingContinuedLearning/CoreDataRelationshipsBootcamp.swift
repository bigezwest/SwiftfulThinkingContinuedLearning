//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/15/25.
//

import CoreData
import SwiftUI

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
        container = NSPersistentContainer(name: "CoreDataContainer")
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

    init() {
        getBusinesses()
    }

    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(
            entityName: "BusinessEntity"
        )
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error Fetching: \(error.localizedDescription)")
        }
    }
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
    }
    func save() {
        manager.save()
        getBusinesses()
        print("Saved Successfully")
    }
}

struct CoreDataRelationshipsBootcamp: View {

    @StateObject var vm = CoreDataRelationshipViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Button(
                        action: {
                            vm.addBusiness()
                        },
                        label: {
                            Text("Perform Action")
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.cornerRadius(10))
                        })
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                        
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

struct BusinessView: View {
    let entity: BusinessEntity
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 20,
            content: {
                Text("Name: \(entity.name ?? "")")
                    .bold()
                if let departments = entity.departments?.allObjects
                    as? [DepartmentEntity]
                {
                    Text("Departments")
                        .bold()
                    ForEach(departments) { department in
                        Text(department.name ?? "")
                    }
                }
                if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                    Text("Employees:")
                        .bold()
                    ForEach(employees) { employee in
                        Text(employee.name ?? "")
                    }
                }
            })
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
