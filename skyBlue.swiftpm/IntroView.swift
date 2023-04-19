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
                    
                    Text("The sky is the region of space visible on the earth. Its color is result of")
                        .font(.custom(.Gaegu, size: 35))
                        .multilineTextAlignment(.center)
                    Text("the scattering of sunlight.\n")
                        .font(.custom(.Gaegu_bold, size: 40))
                        .foregroundColor(.red)
                        
                    
                    Text("As the scattering occurs due to the particles in the atmosphere, the density of air affects the look of the sky. Then, there are three main factors that affect the density of atmosphere,")
                        .font(.custom(.Gaegu, size: 35))
                        .multilineTextAlignment(.center)
                     Text("humidity, ")
                        .font(.custom(.Gaegu_bold, size: 35))
                        .foregroundColor(.blue)
                    + Text("temperature, ")
                        .font(.custom(.Gaegu_bold, size: 35))
                        .foregroundColor(.orange)
                     + Text("and ")
                        .font(.custom(.Gaegu, size: 35))
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
                            
                            
                            if cloud == true{
                                Image(systemName: "cloud")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30)
                                Text("Let's look at the Sky")
                                    .font(.custom(.Gaegu_bold, size: 40))
                            }
                               
                        }
                        .frame(height: 20)
                    }
                        .padding()
                
            }
        }
        .onAppear {
            self.cloud = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.cloud = true
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
