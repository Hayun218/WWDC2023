import SwiftUI


struct ContentView: View {
    @State private var backgroundSnapshot: UIImage?
    @State private var temperature = 0.0
    @State private var hue = 0.0
    @State private var dust = 0.0
    @State private var movingH = 0.0
    @State private var lowDust = false
    @State private var middleDust = false
    @State private var highDust = false
    @State private var isRainy = false
    @State private var opa = 0.6
    @State private var allOpa = 0.3
    @State private var showInfo = true
    @State private var showDes = true
    var minV = 0.0
    var maxV = 100.0
    
    
    var body: some View {
        
        
        GeometryReader{ geometry in
            
            let barWidth = geometry.size.width - 250
            let heightView = geometry.size.height
            // let imageOffset = CGSize.zero
            
            
            ZStack {
                VStack {
                    ZStack{
                        
                        HStack{
                            Image("sun")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/3)
                            //.padding(.leading)
                                .position(x: 100, y:200)
                            Spacer()
                        }
                        
                        
                        
                        Image("blueCloud")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width - 100)
                            .offset(y:-200)
                            .opacity(opa)
                        
                        
                        if isRainy == true{
                            // 비오는 소리 + 화면
                        }
                        
                        
                        if lowDust == true{
                            Image("dust1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: geometry.size.height+100)
                                .offset(y: 0)
                                .animation(.default, value: lowDust)
                        }
                        if middleDust == true{
                            Image("dust2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: geometry.size.height)
                                .offset(y : 0)
                        }
                        if highDust == true{
                            Image("dust3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: geometry.size.height)
                                .offset(y : 0)
                        }
                        
                        
                    }
                    .frame(width: geometry.size.width, height: heightView - 300)
                    
                    
                    
                    HStack{
                        Label("Temp: ", systemImage: "sun.max")
                            .font(.custom(.Gaegu, size: 30))
                            .padding()
                        Spacer()
                        
                        
                        Slider(value: $temperature, in: minV...maxV, step: 10)
                            .padding()
                            .accentColor(.orange)
                            .frame(width: barWidth, height: 20)
                        
                    }.padding(.horizontal)
                        .onChange(of: temperature) { newValue in
                            defineOpa()
                        }
                    
                    
                    HStack{
                        Label("Humidity: ", systemImage: "drop")
                            .font(.custom(.Gaegu, size: 30))
                            .padding()
                        Spacer()
                        Slider(value: $hue, in: minV...maxV, step: 10)
                            .padding()
                            .accentColor(.blue)
                            .frame(width: barWidth, height: 20)
                    }.padding(.horizontal)
                        .onChange(of: hue) { newValue in
                            if hue > 50{
                                isRainy = true
                            } else{
                                isRainy = false
                            }
                            defineOpa()
                        }
                    
                    HStack{
                        Label("Dust: ", systemImage: "sun.dust")
                            .font(.custom(.Gaegu, size: 30))
                            .padding()
                        Spacer()
                        Slider(value: $dust, in: minV...maxV, step: 10)
                            .padding()
                            .accentColor(.gray)
                            .frame(width: barWidth, height: 20)
                            .onChange(of: dust) { newValue in
                                switch newValue {
                                case 0..<25:
                                    lowDust = false
                                    middleDust = false
                                    highDust = false
                                case 25..<50:
                                    lowDust = true
                                    middleDust = false
                                    highDust = false
                                case 50..<75:
                                    lowDust = true
                                    middleDust = true
                                    highDust = false
                                case 75..<101:
                                    lowDust = true
                                    middleDust = true
                                    highDust = true
                                default:
                                    lowDust = false
                                    middleDust = false
                                    highDust = false
                                }
                                defineOpa()
                                
                            }
                        
                    }.padding(.horizontal)
                    
                    Spacer()
                }
                
            }
            .background(allOpa == 1 ? .clear : .gray)
            .opacity(allOpa)
            
            VStack{
                
                Button {
                    if showInfo == true{
                        showInfo = false
                        allOpa = 1.0
                    } else{
                        showInfo = true
                        allOpa = 0.3
                    }
                    
                } label: {
                    Label(showInfo ? "Look at the Sky" : "Tip!!", systemImage: "cloud")
                        .font(.custom(.Gaegu, size: 40))
                }.padding()
                
                if showInfo {
                    InfoView()
                } 
                
            }
            
        } .navigationBarTitle("")
            .navigationBarHidden(true)
    }
    
    
    
    
    func defineOpa (){
        let result = (100-temperature)*0.3 + hue*0.3 + dust * 0.4
        
        switch result {
        case 0..<20:
            opa = 1.0
        case 20..<40:
            opa = 0.8
        case 40..<60:
            opa = 0.6
        case 60..<80:
            opa = 0.4
        case 80..<101:
            opa = 0.2
        default:
            opa = 0.6
        }
    }
}


struct Content_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
