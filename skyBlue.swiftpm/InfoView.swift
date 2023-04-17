//
//  InfoView.swift
//  skyBlue
//
//  Created by yun on 2023/04/12.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack{
            
            HStack{
                Image("humidity")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                Image(systemName: "arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .foregroundColor(.blue)
            }
            Spacer()
            
            HStack{
                Image("temperature")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
            }
            Spacer()
            
            HStack{
                Image("dust")
            }
            
        }
        
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
