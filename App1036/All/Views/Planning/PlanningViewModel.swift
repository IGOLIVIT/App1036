//
//  PlanningViewModel.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI
import CoreData

final class PlanningViewModel: ObservableObject {
    
    @AppStorage("numProd") var numProd: Int = 0
    @AppStorage("sum") var sum: Int = 0
    @AppStorage("person") var person: Int = 0

    @AppStorage("products") var products: [String] = []
    @AppStorage("prices") var prices: [String] = []
    @AppStorage("masses") var masses: [String] = []
    
    @Published var addProd: String = ""
    @Published var addprice: String = ""
    @Published var addMass: String = ""

    @Published var photos: [String] = ["1", "2", "3"]
    @Published var currentPhoto: String = ""
    
    @Published var days: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @Published var currentDay: String = ""
    @Published var currentFilterDay: String = "Mon"

    @Published var types: [String] = ["Breakfast", "Lunch", "Dinner", "Snack"]
    @Published var currentType: String = "All"
    @Published var currentTypeForFilter: String = "All"

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isShopping: Bool = false
    @Published var isAddProducts: Bool = false

    @Published var plPhoto: String = ""
    @Published var plNameDish: String = ""
    @Published var plType: String = ""
    @Published var plTech: String = ""
    @Published var plPort: String = ""
    @Published var plTime: String = ""
    @Published var plDay: String = ""
    @Published var plIng: String = ""

    @Published var plans: [PlanModel] = []
    @Published var selectedPlan: PlanModel?

    func addPlan() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlanModel", into: context) as! PlanModel

        loan.plPhoto = plPhoto
        loan.plNameDish = plNameDish
        loan.plType = plType
        loan.plTech = plTech
        loan.plPort = plPort
        loan.plTime = plTime
        loan.plDay = plDay
        loan.plIng = plIng

        CoreDataStack.shared.saveContext()
    }

    func fetchPlans() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlanModel>(entityName: "PlanModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.plans = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.plans = []
        }
    }
}
