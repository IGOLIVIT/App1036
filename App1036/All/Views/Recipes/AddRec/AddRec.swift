//
//  AddRec.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct AddRec: View {

    @StateObject var viewModel: RecipesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Recipes")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.recNameDish = ""
                            viewModel.recTech = ""
                            viewModel.recTime = ""
                            viewModel.recRec = ""
                            viewModel.currentCat = ""
                            viewModel.currentPhoto = ""
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.recPhoto = viewModel.currentPhoto
                            viewModel.recCat = viewModel.currentCat
                            
                            viewModel.addRec()
                            
                            viewModel.recNameDish = ""
                            viewModel.recTech = ""
                            viewModel.recTime = ""
                            viewModel.recRec = ""
                            viewModel.currentCat = ""
                            viewModel.currentPhoto = ""
                            
                            viewModel.fetchRecs()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        .opacity(viewModel.recNameDish.isEmpty || viewModel.recTech.isEmpty || viewModel.recPort.isEmpty || viewModel.recTime.isEmpty || viewModel.recRec.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.recNameDish.isEmpty || viewModel.recTech.isEmpty || viewModel.recPort.isEmpty || viewModel.recTime.isEmpty || viewModel.recRec.isEmpty ? true : false)
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
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCat = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                        .padding(5)
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentCat == index ? Color("red") : .gray.opacity(0.4)))
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
                                .opacity(viewModel.recNameDish.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.recNameDish)
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
                                .opacity(viewModel.recTech.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.recTech)
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
                                .opacity(viewModel.recPort.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.recPort)
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
                                .opacity(viewModel.recTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.recTime)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("green")))
                        
                        Text("Recipe")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Description")
                                .foregroundColor(.black.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.recRec.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.recRec)
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
    AddRec(viewModel: RecipesViewModel())
}
