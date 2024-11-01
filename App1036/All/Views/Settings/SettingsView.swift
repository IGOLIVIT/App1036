//
//  SettingsView.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        Text("Rate App")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/3392e9b3-afe9-470a-b9e8-36df3b5025a3") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
