//
//  BusinessList.swift
//  City Sights App
//
//  Created by Peter Mihók on 14/12/2021.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(title: "Restaurants", business: model.restaurants)
                
                BusinessSection(title: "Sights", business: model.sights)
                
            }
        }
        
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
