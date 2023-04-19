//
//  InfoView.swift
//  skyBlue
//
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        HStack{
            Spacer()
            
            
            VStack{
                Spacer()
                
                VStack(alignment: .center){
                    Spacer()
                    
                    // Explanation
                    HStack{
                        Text("When humidity")
                            .font(.custom(.Gaegu, size: 40))
                        Image("humidity")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                        Text("increases")
                            .font(.custom(.Gaegu, size: 40))
                        Image(systemName: "arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .foregroundColor(.blue)
                        Text(", ")
                            .font(.custom(.Gaegu, size: 40))
                    }
                    HStack{
                        Text("When temperature")
                            .font(.custom(.Gaegu, size: 40))
                        Image("temperature")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                        Text("decreases")
                            .font(.custom(.Gaegu, size: 40))
                        Image(systemName: "arrow.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .foregroundColor(.orange)
                        Text(", ")
                            .font(.custom(.Gaegu, size: 40))
                    }
                    HStack{
                        Text("When the dust density")
                            .font(.custom(.Gaegu, size: 40))
                        Image("dust")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                        Text("increases")
                            .font(.custom(.Gaegu, size: 40))
                        Image(systemName: "arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .foregroundColor(.gray)
                        Text(", ")
                            .font(.custom(.Gaegu, size: 40))
                    }
                    Spacer()
                        .frame(height: 100)
                    
                    HStack{
                        Text("the air density increases")
                            .font(.custom(.Gaegu, size: 40))
                        Image(systemName: "arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .foregroundColor(.blue)
                    }
                    HStack{
                        Text("the scattering of light rises ")
                            .font(.custom(.Gaegu, size: 40))
                        Image(systemName: "arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .foregroundColor(.blue)
                    }
                    HStack{
                        Text("=>")
                            .font(.custom(.Gaegu_bold, size: 40))
                        Text(" Blue Sky ")
                            .font(.custom(.Gaegu_bold, size: 40))
                            .foregroundColor(.blue)
                        Text("to ")
                            .font(.custom(.Gaegu, size: 40))
                        Text("Gray Sky ")
                            .font(.custom(.Gaegu_bold, size: 40))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                }
                
                .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.height/2)
                .background(.white.opacity(0.8))
                .cornerRadius(20)
                
                
                Spacer()
                
            }
            Spacer()
        }
        
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
