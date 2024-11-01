//
//  PlanDetail.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct PlanDetail: View {

    @StateObject var viewModel: PlanningViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedPlan?.plNameDish ?? "")
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

                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Image(viewModel.selectedPlan?.plPhoto ?? "")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 170)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Cooking")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                            
                            HStack {
                                
                                Text("Technique")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .frame(width: 70, alignment: .leading)
                                
                                Spacer()
                                
                                Text(viewModel.selectedPlan?.plTech ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                            }
                            
                            HStack {
                                
                                Text("Portions")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .frame(width: 70, alignment: .leading)
                                
                                Spacer()
                                
                                Text(viewModel.selectedPlan?.plPort ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                                                
                            }
                            
                            HStack {
                                
                                Text("Time")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .frame(width: 70, alignment: .leading)
                                
                                Spacer()
                                
                                Text(viewModel.selectedPlan?.plTime ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))

                            }
                            
                            HStack {
                                
                                Text("Category")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .frame(width: 70, alignment: .leading)
                                
                                Spacer()

                                Text(viewModel.selectedPlan?.plType ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Ingredients")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                            
                            HStack {
                                
                                Text(viewModel.selectedPlan?.plIng ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Spacer()
                                
                            }
  
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                    }
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isDelete = true
                    }
                    
                }, label: {
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .padding(9)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("red")))
                })
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
               
                        CoreDataStack.shared.deletePlan(withPlNameDish: viewModel.selectedPlan?.plNameDish ?? "", completion: {
                            
                            viewModel.fetchPlans()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    PlanDetail(viewModel: PlanningViewModel())
}