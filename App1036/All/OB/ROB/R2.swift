//
//  R2.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Plan meals for everyone for the week")
                    .foregroundColor(Color("green"))
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R3()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("green")))
                })
                .padding()
            }
            .background(LinearGradient(colors: [Color.black.opacity(0), Color.black.opacity(0),
                                                Color.black.opacity(0),Color.black.opacity(0.9)], startPoint: .top, endPoint: .bottom).ignoresSafeArea())
        }
    }
}

#Preview {
    R2()
}
