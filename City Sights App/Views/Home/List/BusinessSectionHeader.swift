//
//  BusinessSectionHeader.swift
//  City Sights App
//
//  Created by Peter Mihók on 14/12/2021.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .frame(height:45)
            
            Text(title)
                .font(.headline)
            
        }
        
    }
}
