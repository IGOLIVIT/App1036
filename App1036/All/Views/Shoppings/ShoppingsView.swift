//
//  ShoppingsView.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct ShoppingsView: View {

    @StateObject var viewModel: PlanningViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Shopping list")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {

                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        
                        Spacer()
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAddProducts = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .padding(5)
                                .background(Circle().fill(Color("red")))
                            
                        })

                    }
                }
                .padding(.bottom, 25)
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("$ \(viewModel.sum)")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .bold))
                    
                    HStack {
                        
                        Text("Number of products")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        
                        Spacer()
                        
                        Text("\(viewModel.numProd)")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    HStack {
                        
                        Text("Person")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        
                        Spacer()
                        
                        Text("\(viewModel.person)")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 120)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.black))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        HStack {
                            
                            VStack(alignment: .leading) {

                                ForEach(viewModel.products, id: \.self) { index in
                                    
                                    Text(index)
                                        .foregroundColor(Color("green"))
                                        .font(.system(size: 22, weight: .bold))
                                        .frame(height: 50)

                                }
                            }
                                
                                Spacer()
                                
                                VStack {
                                    
                                    ForEach(viewModel.prices, id: \.self) { index in
                                    
                                        Text("\(index)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .bold))
                                            .frame(width: 140, height: 50)
                                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("green")))
                                    }
                                }
                            
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddProducts ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddProducts = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddProducts = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Adding a products")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                        .padding()
                    
                    ZStack(content: {
                        
                        Text("Product")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addProd.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addProd)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    ZStack(content: {
                        
                        Text("2 kg")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addMass.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addMass)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    ZStack(content: {
                        
                        Text("5")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addprice.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addprice)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.numProd += 1
                            
                            viewModel.sum += Int(viewModel.addprice) ?? 0
                            
                            viewModel.products.append(viewModel.addProd)
                            viewModel.prices.append(viewModel.addprice)
                            viewModel.masses.append(viewModel.addMass)

                            viewModel.addprice = ""
                            viewModel.addProd = ""
                            viewModel.addMass = ""

                            withAnimation(.spring()) {
                                
                                viewModel.isAddProducts = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.addprice = ""
                            viewModel.addProd = ""
                            viewModel.addMass = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddProducts = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .padding(.top, 25)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.7)))
                .padding()
                .offset(y: viewModel.isAddProducts ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ShoppingsView(viewModel: PlanningViewModel())
}
