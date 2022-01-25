//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Peter Mihók on 25/01/2022.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            // Business name
            Text(business.name!)
                .font(.title2)
                .bold()
            
            // Loop through display address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id:\.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
        
        
    }
}

