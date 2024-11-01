//
//  AddPlan.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct AddPlan: View {
    
    @StateObject var viewModel: PlanningViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Meal planning")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.plNameDish = ""
                            viewModel.plTech = ""
                            viewModel.plTime = ""
                            viewModel.plIng = ""
                            viewModel.currentDay = ""
                            viewModel.currentType = ""
                            viewModel.currentPhoto = ""
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.person += 1
                            
                            viewModel.plDay = viewModel.currentDay
                            viewModel.plPhoto = viewModel.currentPhoto
                            viewModel.plType = viewModel.currentType
                            
                            viewModel.addPlan()
                            
                            viewModel.plNameDish = ""
                            viewModel.plTech = ""
                            viewModel.plTime = ""
                            viewModel.plIng = ""
                            viewModel.currentDay = ""
                            viewModel.currentType = ""
                            viewModel.currentPhoto = ""
                            
                            viewModel.fetchPlans()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        .opacity(viewModel.plNameDish.isEmpty || viewModel.plTech.isEmpty || viewModel.plPort.isEmpty || viewModel.currentDay.isEmpty || viewModel.currentType.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.plNameDish.isEmpty || viewModel.plTech.isEmpty || viewModel.plPort.isEmpty || viewModel.currentDay.isEmpty || viewModel.currentType.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.black)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 160)
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .medium))
                                        .padding(3)
                                        .background(Circle().fill(.white))
                                }
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 160)
                            }
                        })
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentType = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                        .padding(5)
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentType == index ? Color("red") : .gray.opacity(0.4)))
                                })
                            }
                        }
                        
                        Text("Name of the dish")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.black.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plNameDish.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plNameDish)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                        
                        Text("Technique")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Technique")
                                .foregroundColor(.black.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plTech.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plTech)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                        
                        Text("Portions")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("0")
                                .foregroundColor(.black.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plPort.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plPort)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                        
                        Text("Time")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("0")
                                .foregroundColor(.black.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plTime)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                        
                        HStack {
                            
                            ForEach(viewModel.days, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentDay = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 9, weight: .medium))
                                        .padding()
                                        .background(Circle().fill(viewModel.currentDay == index ? Color("red") : .gray.opacity(0.4)))
                                })
                            }
                        }
                        
                        Text("Ingredients")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Ingredients")
                                .foregroundColor(.black.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plIng.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plIng)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddPlan(viewModel: PlanningViewModel())
}
