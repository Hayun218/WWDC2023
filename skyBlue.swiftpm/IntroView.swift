//
//  IntroView.swift
//  skyBlue
//
//  Created by yun on 2023/04/12.
//

import SwiftUI

struct IntroView: View {
    @State private var cloud = false
    
    var body: some View {
        NavigationView {
            

            VStack{
                VStack{
                    if cloud == false{
                        Image("question")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    self.cloud = true
                                }
                            }
                    } else{
                        Image("threeElements")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 700)
                    }
                }.frame(width: 500, height: 400)
                    .padding()
                
                VStack{
                    Text("Have you ever wondered why sky seems being changed?\n")
                        .font(.custom(.Gaegu, size: 35))
                        .multilineTextAlignment(.center)
                    
                    Text("The sky seems being changed because of")
                        .font(.custom(.Gaegu, size: 35))
                    Text("the scattering of lights.\n")
                        .font(.custom(.Gaegu_bold, size: 40))
                        .foregroundColor(.red)
                        
                    
                    Text("As the scattering occurs due to the particles in the atmosphere. There are three main factors that affect the density of atmosphere,")
                        .font(.custom(.Gaegu, size: 35))
                        .multilineTextAlignment(.center)
                     Text("humidity, ")
                        .font(.custom(.Gaegu_bold, size: 35))
                        .foregroundColor(.blue)
                    + Text("temperature, ")
                        .font(.custom(.Gaegu_bold, size: 35))
                        .foregroundColor(.orange)
                     + Text("and ")
                        .font(.custom(.Gaegu_bold, size: 35))
                        .foregroundColor(.black)
                    + Text("dust.")
                       .font(.custom(.Gaegu_bold, size: 35))
                       .foregroundColor(.gray)
                    
                }.frame(height: 500)
                    .padding()
                
                Spacer()
                    .frame(height: 20)
                

                    NavigationLink(destination: ContentView()){
                        HStack{
                            Image(systemName: "cloud")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 30)
                            
                            Text("Let's look at the Sky")
                                .font(.custom(.Gaegu_bold, size: 40))
                               
                        }
                    }
                        .padding()
                
            }
        }.navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
