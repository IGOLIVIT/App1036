//
//  PlanningView.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct PlanningView: View {
    
    @StateObject var viewModel = PlanningViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Meal planning")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                 
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isShopping = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "list.bullet")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .padding(6)
                                .background(Circle().fill(.black))
                        })
                    }
                    
                }
                    .padding(.bottom, 25)
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.currentTypeForFilter = "All"
                        
                    }, label: {
                        
                        Text("All")
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .medium))
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25).fill(viewModel.currentTypeForFilter == "All" ? Color("red") : .gray.opacity(0.4)))
                    })
                    
                    ForEach(viewModel.types, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentTypeForFilter = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 10, weight: .medium))
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 25).fill(viewModel.currentTypeForFilter == index ? Color("red") : .gray.opacity(0.4)))
                        })
                    }
                }
                
                if viewModel.plans.isEmpty {
                    
                    HStack {
                        
                        Text("No enteries")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 11, weight: .medium))
                            .padding(4)
                            .background(Circle().fill(.black))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.5)))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 12) {
                            
                            if viewModel.currentTypeForFilter == "All" {
                                
                                ForEach(viewModel.plans.filter{($0.plDay ?? "") == viewModel.currentFilterDay}, id: \.self) { index in
                                
                                    VStack(alignment: .leading, spacing: 9) {
                                        
                                        HStack {
                                            
                                            Image(index.plPhoto ?? "")
                                                .resizable()
                                                .frame(width: 125, height: 125)
                                            
                                            VStack(alignment: .leading, spacing: 9) {

                                                Text(index.plNameDish ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 17, weight: .medium))
                                                
                                                HStack {
                                                    
                                                    Text("Technique")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.plTech ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Portions")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.plPort ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Time")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.plTime ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()

                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Category")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)

                                                    Text(index.plType ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                }
                                                
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedPlan = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("Open")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                                .padding(9)
                                                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                                        })
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 220)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                                }
                                
                            } else {
                                
                                ForEach(viewModel.plans.filter{($0.plDay ?? "") == viewModel.currentFilterDay}.filter{($0.plType ?? "") == viewModel.currentTypeForFilter}, id: \.self) { index in
                                
                                    VStack(alignment: .leading, spacing: 9) {
                                        
                                        HStack {
                                            
                                            Image(index.plPhoto ?? "")
                                                .resizable()
                                                .frame(width: 125, height: 125)
                                            
                                            VStack(alignment: .leading, spacing: 9) {

                                                Text(index.plNameDish ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 17, weight: .medium))
                                                
                                                HStack {
                                                    
                                                    Text("Technique")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.plTech ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Portions")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.plPort ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Time")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.plTime ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()

                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Category")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)

                                                    Text(index.plType ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                }
                                                
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedPlan = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("Open")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                                .padding(9)
                                                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                                        })
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 220)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                                }
                            }
                        }
                    }
                }
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                HStack {
                
                    ForEach(viewModel.days, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentFilterDay = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 10, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentFilterDay == index ? Color("green") : .gray.opacity(0.4)))
                        })
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("red"))
                            .font(.system(size: 10, weight: .medium))
                            .padding(2)
                            .background(Circle().fill(.white))
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("red")))
                    })
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            
            viewModel.fetchPlans()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPlan(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PlanDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isShopping, content: {
            
            ShoppingsView(viewModel: viewModel)
        })
    }
}

#Preview {
    PlanningView()
}
