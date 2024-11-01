//
//  Notif.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct Notif: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Stay informed at all times")
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 30)
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Enable notifications")
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.white))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    Notif()
}
