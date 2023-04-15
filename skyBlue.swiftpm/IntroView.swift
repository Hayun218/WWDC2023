//
//  IntroView.swift
//  skyBlue
//
//  Created by yun on 2023/04/12.
//

import SwiftUI

struct IntroView: View {
    @State private var cloud = false
    @State private var buttonAble = false
    
    var body: some View {
        NavigationView {
            

            VStack{
                if cloud == false{
                    Image("question")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.cloud = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                self.buttonAble = true
                            }
                        }
                } else{
                    Image("questionCloud")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                }
                
                Text("Have you ever wondered why sky seems being changed?\n")
                    .font(.custom(.Gaegu, size: 40))
                Text("Have you ever wondered why sky seems being changed?\n")
                    .font(.custom(.Gaegu, size: 40))
                
                if buttonAble{
                    NavigationLink(destination: ContentView()){
                        HStack{
                            Image(systemName: "cloud")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 30)
                            
                            Text("Let's look at the Sky")
                                .font(.custom(.Gaegu_bold, size: 50))
                        }
                    }
                }
                
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
