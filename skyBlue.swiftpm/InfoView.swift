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
            }
            
            HStack{
                Image("temperature")
            }
            
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
