//
//  firstScene.swift
//  HighBlue
//
//

import SwiftUI

struct firstScene: View {
    @State private var start = false
    @State private var info = false
    @State private var cloud = false
    @State private var imgOpa = 1.0
    @State private var offsetY: CGFloat = 0
    
    var body: some View {
        NavigationView {
            VStack{
                
                
                Image("singleCloud")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400)
                    .offset(y: offsetY)
                    .animation(Animation.easeInOut(duration: 1)
                        .repeatForever(), value: offsetY)
                    .onAppear {
                        self.offsetY = -10
                    }
                    .opacity(imgOpa)
                    .transition(.opacity)
                
                NavigationLink(destination: IntroView(), isActive: $start){
                    Text("High Blue!")
                        .font(.custom(.Gaegu, size: 60))
                }
                
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct firstScene_Previews: PreviewProvider {
    static var previews: some View {
        firstScene()
    }
}
