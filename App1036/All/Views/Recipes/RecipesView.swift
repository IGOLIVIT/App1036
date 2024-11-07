//
//  RecipesView.swift
//  App1036
//
//  Created by IGOR on 28/10/2024.
//

import SwiftUI

struct RecipesView: View {
    
    @StateObject var viewModel = RecipesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Recipes")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.bottom, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 9, weight: .medium))
                            .padding(4)
                            .background(Circle().fill(.white))
                            .padding(8)
                            .background(Circle().fill(.black))
                    })
                    
                    Button(action: {
                        
                        viewModel.currentCatForFilter = "All"
                        
                    }, label: {
                        
                        Text("All")
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .medium))
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25).fill(viewModel.currentCatForFilter == "All" ? Color("red") : .gray.opacity(0.4)))
                    })
                    
                    ForEach(viewModel.categories, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentCatForFilter = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 10, weight: .medium))
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 25).fill(viewModel.currentCatForFilter == index ? Color("red") : .gray.opacity(0.4)))
                        })
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCategory = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 9, weight: .medium))
                            .padding(4)
                            .background(Circle().fill(.black))
                        
                    })
                    
                    Spacer()
                }
            }
                .frame(height: 50)
                
                if viewModel.recipes.isEmpty {
                    
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
                            
                            if viewModel.currentCatForFilter == "All" {
                                
                                ForEach(viewModel.recipes, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 9) {
                                        
                                        HStack {
                                            
                                            Image(index.recPhoto ?? "")
                                                .resizable()
                                                .frame(width: 125, height: 125)
                                            
                                            VStack(alignment: .leading, spacing: 9) {
                                                
                                                Text(index.recNameDish ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 17, weight: .medium))
                                                
                                                HStack {
                                                    
                                                    Text("Technique")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.recTech ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Portions")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.recPort ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Time")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.recTime ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Category")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.recCat ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                }
                                                
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedRec = index
                                            
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
                                
                                ForEach(viewModel.recipes.filter{($0.recCat ?? "") == viewModel.currentCatForFilter}, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 9) {
                                        
                                        HStack {
                                            
                                            Image(index.recPhoto ?? "")
                                                .resizable()
                                                .frame(width: 125, height: 125)
                                            
                                            VStack(alignment: .leading, spacing: 9) {
                                                
                                                Text(index.recNameDish ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 17, weight: .medium))
                                                
                                                HStack {
                                                    
                                                    Text("Technique")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.recTech ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Portions")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.recPort ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Time")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.recTime ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                    
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Category")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .frame(width: 70, alignment: .leading)
                                                    
                                                    Text(index.recCat ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 14, weight: .medium))
                                                    
                                                    Spacer()
                                                }
                                                
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedRec = index
                                            
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
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEvent = true
                    }
                    
                }, label: {
                    
                    Text("Culinary event")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .padding(9)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("red")))
                })
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchRecs()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddRec(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RecDetail(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCategory ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCategory = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCategory = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Adding a category")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                        .padding()
                    
                    ZStack(content: {
                        
                        Text("Category")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addingCategory.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addingCategory)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.categories.append(viewModel.addingCategory)
                            
                            viewModel.addingCategory = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCategory = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.addingCategory = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCategory = false
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
                .offset(y: viewModel.isAddCategory ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isEvent ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEvent = false
                        }
                    }
                
                VStack {
                    
                    Image("event")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    
                    VStack {

                        VStack {
                            
                            Button(action: {
                                
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isEventView = true
                                    viewModel.isEvent = false
                                    
                                }
                                
                            }, label: {
                                
                                Text("Move Event")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isEvent = false
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.7)))
                    .padding(.horizontal, 50)
                }
                .padding()
                .offset(y: viewModel.isEvent ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isEventView, content: {
            
            EventView()
        })
    }
}

#Preview {
    RecipesView()
}
