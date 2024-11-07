//
//  RecipesViewModel.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI
import CoreData
import Combine

final class RecipesViewModel: ObservableObject {
    
    @Published var photos: [String] = ["1", "2", "3"]
    @Published var currentPhoto: String = ""

    @AppStorage("categories") var categories: [String] = []
    @Published var currentCat: String = "All"
    @Published var currentCatForFilter: String = "All"
    
    @AppStorage("dishes") var dishes: Int = 0
    @AppStorage("cooked") var cooked: Int = 0

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddCategory: Bool = false
    @Published var isEvent: Bool = false
    @Published var isTimer: Bool = false
    @Published var isEventView: Bool = false
    
    @Published var addingCategory: String = ""

    @Published var recPhoto: String = ""
    @Published var recNameDish: String = ""
    @Published var recCat: String = ""
    @Published var recTech: String = ""
    @Published var recPort: String = ""
    @Published var recTime: String = ""
    @Published var recRec: String = ""

    @Published var recipes: [RecModel] = []
    @Published var selectedRec: RecModel?

    func addRec() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "RecModel", into: context) as! RecModel

        loan.recPhoto = recPhoto
        loan.recNameDish = recNameDish
        loan.recCat = recCat
        loan.recTech = recTech
        loan.recPort = recPort
        loan.recTime = recTime
        loan.recRec = recRec

        CoreDataStack.shared.saveContext()
    }

    func fetchRecs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RecModel>(entityName: "RecModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.recipes = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.recipes = []
        }
    }
    
    @Published var remainingTime: Int
    @Published var isRunning = false
    private var timer: AnyCancellable?
    let initialTime: Int = 15 * 60  // 15 минут в секундах

    init() {
        self.remainingTime = initialTime
    }

    func start() {
        guard !isRunning else { return }
        isRunning = true
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
    }

    func stop() {
        isRunning = false
        timer?.cancel()
    }

    func finish() {
        stop()
        remainingTime = 0
    }

    func reset() {
        stop()
        remainingTime = initialTime
    }

    private func tick() {
        if remainingTime > 0 {
            remainingTime -= 1
        } else {
            finish()
        }
    }
}
