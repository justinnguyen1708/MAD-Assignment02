//
//  EateriesApp.swift
//  Eateries
//
//  Created by Nguyen Chanh Tin on 4/22/21.
//

import SwiftUI

@main
struct EateriesApp: App {
    var eateryViewModel: EateryViewModel {
        let listOfEateries = [
            Eatery(image: "https://www.visitbrisbane.com.au/~/media/articles/2021/february/coppaspuntinopasta_20210223_wide.ashx", name: "Coppa Spuntino", location: "CBD", notes: "The love affair between Brisbane and Italy continues with the much-awaited opening of COPPA at Eagle Street Pier. COPPA brings Italian flavours and flair to the table with indoor and alfresco spaces available when it opens in mid January.", reviews: [["A","I like it"], ["B","I do not like it"]]),
            Eatery(image: "https://www.visitbrisbane.com.au/~/media/inner-city/the-city/2020/bars/citywinery720x405.ashx", name: "City Winery", location: "CBD", notes: "A winery in the city? We're sold! City Winery is bringing wine making to the heart of Fortitude Valley and has opened a space that house's not only Gerler's wine barrels and bar but also a restaurant and private dining area. One of three inner-city wineries in Australia, drinkers will be able to enjoy tastes from the barrel and paddock-to-plate food within this industrial space on Wandoo St, or sip on wines at the CBD cellar door location on Edward St.", reviews: [["A","I like it"], ["B","I do not like it"]]),
            Eatery(image: "https://www.visitbrisbane.com.au/~/media/articles/2021/march/bisou.ashx", name: "Bisou Bisou", location: "Fortitude Valley", notes: "Craving caviar for breakfast? No worries. Brisbane’s newest French brasserie and aperitivo bar awaits you in Fortitude Valley, serving up breakfast, lunch and dinner plus lobby snacks (it’s conveniently located under Hotel X on Brunswick Street). Transport yourself to the streets of Paris while indulging in a French-inspired menu and self proclaimed “revolutionary cocktails”. We’ll take the plat du jour, s’il vous plait.", reviews: [["A","I like it"], ["B","I do not like it"]]),
            Eatery(image: "https://www.visitbrisbane.com.au/~/media/choose/convention-bureau/news/boomboomroomrefurb_20201209_wide.ashx", name: "Boom Boom Room Izakaya", location: "CBD", notes: "Newly opened Boom Boom Room Izakaya is a reimagined Japanese-style restaurant and bar that takes over from the Boom Boom Room cocktail bar under Donna Chang’s. There’s plenty of Japanese-inspired eats to share and stunning cocktails still on offer.", reviews: [["A","I like it"], ["B","I do not like it"]])
        ]
        
        // Assign listOfEateries to model
        let model = EateryViewModel(listOfEateries: listOfEateries)
        
        // Return model to eateryViewModel
        return model
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(listOfEateries: eateryViewModel)
        }
    }
    
}
