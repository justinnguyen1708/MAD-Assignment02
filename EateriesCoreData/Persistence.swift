//
//  Persistence.swift
//  EateriesCoreData
//
//  Created by Nguyen Chanh Tin on 5/11/21.
//

import CoreData

struct PersistenceController {
    static var shared: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let eateryModel = EateryModel(context: viewContext)
        eateryModel.name = "Best eateries"
        
        let firstEatery = Eatery(context: viewContext)
        firstEatery.image = "https://www.visitbrisbane.com.au/~/media/articles/2021/february/coppaspuntinopasta_20210223_wide.ashx"
        firstEatery.name = "Coppa Spuntino"
        firstEatery.notes = """
The love affair between Brisbane and Italy continues with the much-awaited opening of COPPA at Eagle Street Pier. \
COPPA brings Italian flavours and flair to the table with indoor and alfresco spaces available when it opens in mid January.
"""
        firstEatery.location = Location(context: viewContext)
        firstEatery.locationObject.name = "Brisbane"
        firstEatery.locationObject.lookupPosition()
        firstEatery.addReview()
        
        eateryModel.addToEateries(firstEatery)
        
        let secondEatery = Eatery(context: viewContext)
        secondEatery.image = "https://www.visitbrisbane.com.au/~/media/inner-city/the-city/2020/bars/citywinery720x405.ashx"
        secondEatery.name = "City Winery"
        secondEatery.notes = """
A winery in the city? We're sold! City Winery is bringing wine making to the heart of Fortitude Valley and has opened a space that house's not only Gerler's wine barrels and bar but also a restaurant and private dining area. \
One of three inner-city wineries in Australia, drinkers will be able to enjoy tastes from the barrel and paddock-to-plate food within this industrial space on Wandoo St, or sip on wines at the CBD cellar door location on Edward St.
"""
        secondEatery.location = Location(context: viewContext)
        secondEatery.locationObject.name = "Brisbane"
        secondEatery.locationObject.lookupPosition()
        secondEatery.addReview()
        
        eateryModel.addToEateries(secondEatery)
        
        let thirdEatery = Eatery(context: viewContext)
        thirdEatery.image = "https://www.visitbrisbane.com.au/~/media/articles/2021/march/bisou.ashx"
        thirdEatery.name = "Bisou Bisou"
        thirdEatery.notes = """
Craving caviar for breakfast? \
No worries. \
Brisbane’s newest French brasserie and aperitivo bar awaits you in Fortitude Valley, serving up breakfast, lunch and dinner plus lobby snacks (it’s conveniently located under Hotel X on Brunswick Street). \
Transport yourself to the streets of Paris while indulging in a French-inspired menu and self proclaimed “revolutionary cocktails”. \
We’ll take the plat du jour, s’il vous plait.
"""
        thirdEatery.location = Location(context: viewContext)
        thirdEatery.locationObject.name = "Brisbane"
        thirdEatery.locationObject.lookupPosition()
        thirdEatery.addReview()
        
        eateryModel.addToEateries(thirdEatery)
        
        let fourthEatery = Eatery(context: viewContext)
        fourthEatery.image = "https://www.visitbrisbane.com.au/~/media/choose/convention-bureau/news/boomboomroomrefurb_20201209_wide.ashx"
        fourthEatery.name = "Boom Boom Room Izakaya"
        fourthEatery.notes = """
Newly opened Boom Boom Room Izakaya is a reimagined Japanese-style restaurant and bar that takes over from the Boom Boom Room cocktail bar under Donna Chang’s. \
There’s plenty of Japanese-inspired eats to share and stunning cocktails still on offer.
"""
        fourthEatery.location = Location(context: viewContext)
        fourthEatery.locationObject.name = "Brisbane"
        fourthEatery.locationObject.lookupPosition()
        fourthEatery.addReview()
        
        eateryModel.addToEateries(fourthEatery)
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

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let eateryModel = EateryModel(context: viewContext)
        eateryModel.name = "Best eateries"
        for i in 0...3 {
            let eatery = Eatery(context: viewContext)
            eatery.name = "Eatery #\(i)"
            eatery.image = "blank"
            eatery.location = Location(context: viewContext)
            eatery.notes = ""
            eateryModel.addEatery()
        }
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

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EateriesCoreData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
