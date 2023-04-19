//
//  QuizView.swift
//  skyBlue
//
//  Created by yun on 2023/04/19.
//

import SwiftUI

struct QuizView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var secondQ: CGFloat = 0
    @State private var thirdQ: CGFloat = 0
    @State private var thirdSQ: CGFloat = 0
    @State private var completed: CGFloat = 0
    @State private var showModal: Bool = false
    
    
    
    
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Text("Click an option in the gray box.")
                .font(.custom(.Gaegu_bold, size: 45))
                .frame(height: 130)
            
            
            HStack{
                Text("Q1. When humidity")
                    .font(.custom(.Gaegu, size: 40))
                Image("humidity")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                Text("decreases")
                    .font(.custom(.Gaegu, size: 40))
                Image(systemName: "arrow.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    //.foregroundColor(.blue)
                Text(", ")
                    .font(.custom(.Gaegu, size: 40))
            }
            HStack{
                Text("the scattering of light ")
                    .font(.custom(.Gaegu, size: 40))
                
                HStack{
                    
                    Button(action: {
                        secondQ = 0
                    }) {
                        Image(systemName: "arrow.up")
                            .foregroundColor(.white)
                            .font(.custom(.Gaegu, size: 50))
                    }
                    Text("OR")
                        .font(.custom(.Gaegu, size: 40))
                        .foregroundColor(.white)
                    
                    Button(action: {
                        secondQ = 1
                    }) {
                        Image(systemName: "arrow.down")
                            .foregroundColor(.white)
                        
                            .font(.custom(.Gaegu, size: 50))
                    }
                }.background(.gray)
                    .cornerRadius(10)
                
            }
            
            Text("\nGreat Job!")
                .font(.custom(.Gaegu_bold, size: 40))
                .foregroundColor(.blue)
                .opacity(secondQ)
                .animation(.easeInOut(duration: 1), value: secondQ)
            
            HStack{
                Text("Q2. When scatter of light rises")
                    .font(.custom(.Gaegu, size: 40))
                Image(systemName: "arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                 //   .foregroundColor(.red)
                Text(", ")
                    .font(.custom(.Gaegu, size: 40))
            }
            .opacity(secondQ)
            .animation(.easeInOut(duration: 1), value: secondQ)
            
            HStack{
                Text("the sky seems more like ")
                    .font(.custom(.Gaegu, size: 40))
                
                HStack{
                    
                    Button(action: {
                        thirdQ = 1
                    }) {
                        Text("Blue")
                            .foregroundColor(.white)
                            .font(.custom(.Gaegu, size: 50))
                    }
                    Text(" OR ")
                        .font(.custom(.Gaegu, size: 40))
                        .foregroundColor(.white)
                    
                    Button(action: {
                        thirdQ = 0
                    }) {
                        Text("Gray")
                            .foregroundColor(.white)
                        
                            .font(.custom(.Gaegu, size: 50))
                    }
                }
                .background(.gray)
                .cornerRadius(10)
                
            }
            .opacity(secondQ)
            .animation(.easeInOut(duration: 1), value: secondQ)
            
            Text("\nGreat Job!")
                .font(.custom(.Gaegu_bold, size: 40))
                .foregroundColor(.blue)
                .opacity(thirdQ)
                .animation(.easeInOut(duration: 1), value: thirdQ)
            
            
            Group{
                HStack{
                    Text("Q3. When temperature")
                        .font(.custom(.Gaegu, size: 40))
                    Image("temperature")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                    Text("increases")
                        .font(.custom(.Gaegu, size: 40))
                    Image(systemName: "arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                       // .foregroundColor(.orange)
                    Text(", ")
                        .font(.custom(.Gaegu, size: 40))
                }
                .opacity(thirdQ)
                .animation(.easeInOut(duration: 1), value: thirdQ)
                
                HStack{
                    Text("the scattering of light ")
                        .font(.custom(.Gaegu, size: 40))
                    
                    HStack{
                        
                        Button(action: {
                            thirdSQ = 0
                            completed = 0
                        }) {
                            Image(systemName: "arrow.up")
                                .foregroundColor(.white)
                                .font(.custom(.Gaegu, size: 50))
                        }
                        Text("OR")
                            .font(.custom(.Gaegu, size: 40))
                            .foregroundColor(.white)
                        
                        Button(action: {
                            thirdSQ = 1
                        }) {
                            Image(systemName: "arrow.down")
                                .foregroundColor(.white)
                            
                                .font(.custom(.Gaegu, size: 50))
                        }
                    }.background(.gray)
                        .cornerRadius(10)
                    
                    Text("Great!!")
                        .font(.custom(.Gaegu_bold, size: 40))
                        .foregroundColor(.blue)
                        .opacity(thirdSQ)
                        .animation(.easeInOut, value: thirdSQ)
                        .frame(height: 20)
                    
                }.opacity(thirdQ)
                    .animation(.easeInOut(duration: 1), value: thirdQ)
                
                
                
                HStack{
                    Text("the sky seems to be ")
                        .font(.custom(.Gaegu, size: 40))
                    
                    HStack{
                        
                        Button(action: {
                            completed = 1
                            showModal = true
                        }) {
                            Text("Blue")
                                .foregroundColor(.white)
                                .font(.custom(.Gaegu, size: 50))
                        }
                        Text(" OR ")
                            .font(.custom(.Gaegu, size: 40))
                            .foregroundColor(.white)
                        
                        Button(action: {
                            completed = 0
                        }) {
                            Text("Gray")
                                .foregroundColor(.white)
                            
                                .font(.custom(.Gaegu, size: 50))
                        }
                    }
                    .background(.gray)
                    .cornerRadius(10)
                    
                }
                .opacity(thirdSQ)
                .animation(.easeInOut(duration: 1), value: thirdSQ)
                
                Text("\nGreat Job!")
                    .font(.custom(.Gaegu_bold, size: 40))
                    .foregroundColor(.blue)
                    .opacity(completed)
                    .animation(.easeInOut(duration: 1), value: completed)
            }
            
        }
        .overlay(
            Group {
                if showModal {
                    Color.black.opacity(0.4)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+10)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showModal.toggle()
                        }
                    
                    VStack () {
                        
                        Text("Congratulation!!!")
                            .font(.custom(.Gaegu, size: 50))
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        
                        Text("You've completed the quiz.\nNow I suggest you look at the sky and apply your findings.")
                            .font(.custom(.Gaegu, size: 40))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button {
                            showModal.toggle()
                        }label:{
                            Text("Close")
                                .font(.custom(.Gaegu, size: 40))
                        }
                        .padding()
                        
                        
                    }
                    .frame(width: 600, height: 600, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
            }
        )
        
        
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label:{
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .frame(height: 30)
                        Text("Back")
                            .font(.custom(.Gaegu, size: 30))
                    }
                    
                }
            }
        }
        
        
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
