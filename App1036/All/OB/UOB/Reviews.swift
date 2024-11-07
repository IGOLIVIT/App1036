//
//  Reviews.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("U2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 30)
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
                        
                        Notif()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("green")))
                    })
                    
                    Spacer()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 140)
                .background(RoundedRectangle(cornerRadius: 20).fill(.black))
            }
            .ignoresSafeArea()
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
