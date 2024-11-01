//
//  TabBar.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("red") : Color.gray.opacity(0.4))
                            .frame(width: 15, height: 15)

//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
//                            .font(.system(size: 13, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 25)
        .padding(.bottom, 45)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color.white))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Planning = "Planning"
    
    case Recipes = "Recipes"
    
    case Settings = "Settings"
            
}
