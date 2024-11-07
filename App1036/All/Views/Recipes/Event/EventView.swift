//
//  EventView.swift
//  App1036
//
//  Created by IGOR on 07/11/2024.
//

import SwiftUI

struct EventView: View {
    
    @StateObject var viewModel = RecipesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Culinary event")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.bottom, 25)
                
                if viewModel.cooked >= viewModel.dishes {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("You finished the culinary event")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 16, weight: .medium))
                        
                        HStack {
                            
                            Text("Cooked")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(viewModel.cooked)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 4)
                            
                            Text("\(viewModel.dishes)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("red")))
                    
                } else {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("You needed to cook \(viewModel.dishes) dishes to participate in the culinary event")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 16, weight: .medium))
                        
                        HStack {
                            
                            Text("Cooked")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(viewModel.cooked)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 4)
                            
                            Text("\(viewModel.dishes)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("red")))
                }
                
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
                                                
                                                viewModel.isTimer = true
                                            }
                                            
                                        }, label: {
                                                                                        
                                            Text("Prepare")
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
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEvent = true
                    }
                    
                }, label: {
                    
                    Text("Kulinar event")
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
                
                Color.black.opacity(viewModel.isTimer ? 0.8 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTimer = false
                        }
                    }
                
                VStack {
                    
                    VStack(spacing: 20) {
                        
                        Text(viewModel.selectedRec?.recNameDish ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.center)
                        
                        Text("\(formattedTime)")
                            .foregroundColor(Color("green"))
                            .font(.system(size: 32, weight: .bold))
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.8)))
                    
                        VStack {
                            
                            if !viewModel.isRunning || viewModel.remainingTime == 0 {
                                
                                Button(action: {
                                    
                                    viewModel.start()
                                    
                                }, label: {
                                    
                                    Text("Start")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("green")))
                                })
                                
                            } else {
                                
                                Button(action: {
                                    
                                    viewModel.finish()
                                    
                                    viewModel.cooked += 1
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isTimer = false
                                    }
                                    
                                }, label: {
                                    
                                    Text("Finish")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("green")))
                                })
                                .disabled(viewModel.remainingTime == 0)

                            }
                            
                            Button(action: {
                                
                                viewModel.stop()
                                
                            }, label: {
                                
                                Text("Stop")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("red")))
                            })
                            .disabled(!viewModel.isRunning)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTimer = false
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.7)))

                            })
                        }

                }
                .padding()
                .offset(y: viewModel.isTimer ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
    
    private var formattedTime: String {
        let minutes = viewModel.remainingTime / 60
        let seconds = viewModel.remainingTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    EventView()
}
