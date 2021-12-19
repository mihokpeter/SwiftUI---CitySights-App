//
//  BusinessSection.swift
//  City Sights App
//
//  Created by Peter Mihók on 14/12/2021.
//

import SwiftUI

struct BusinessSection: View {
    
    var title:String
    var business: [Business]
    
    var body: some View {
        Section (header: BusinessSectionHeader(title: title)) {
            ForEach(business) { business in
                
                BusinessRow(business: business)
                
            }
        }
    }
}
