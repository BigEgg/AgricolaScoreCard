//
//  PersistenceControllerExtensions.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/24/20.
//

import CoreData

extension PersistenceController {
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        mockData(viewContext: viewContext)
                
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    private static func mockData(viewContext: NSManagedObjectContext) {
        let player1 = Player(context: viewContext)
        player1.id = UUID()
        player1.name = "BigEgg"
        let player3 = Player(context: viewContext)
        player3.id = UUID()
        player3.name = "Nemo"
        let player4 = Player(context: viewContext)
        player4.id = UUID()
        player4.name = "Nice"
        let player2 = Player(context: viewContext)
        player2.id = UUID()
        player2.name = "Chang"
    }
}
