import SwiftUI


struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    // for another view
    @State private var showInfo = true
    
    // for Slider var
    @State private var tempSlider : CGFloat = 0
    @State private var hueSlider : CGFloat = 0
    @State private var dustSlider : CGFloat = 0
    
    // for proportion
    @State private var temperature = 0.0
    @State private var hue = 0.0
    @State private var dust = 0.0
    
    // for moving or opacity of img
    @State private var movingH = 0.0
    @State private var skyH = -100.0
    @State private var sunW = 0.0
    @State private var opa = 0.8
    @State private var allOpa = 0.3
    @State private var sunOpa = 1.0
    
    
    // Dust Img
    @State private var lowDust = false
    @State private var middleDust = false
    @State private var highDust = false
    
    // Rain Img
    @State private var isRainy = false
    
    var body: some View {
        
        GeometryReader{ geometry in
            
            let heightView = geometry.size.height
            
            ZStack {
                VStack {
                    ZStack{
                        HStack{
                            Image("sun")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/3)
                                .offset(x: sunW, y: -200)
                                .opacity(opa)
                                .animation(.easeInOut(duration: 1), value: opa)
                            
                            Spacer()
                        }
                        .frame(width: geometry.size.width, height: heightView - 300)
                        
//                        if temperature > 30{
//                            Image("sun1")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: geometry.size.width-300)
//                                .offset(x: 0, y: -200)
//                                .animation(.easeInOut(duration: 1), value: temperature)
//                        }
//                        if temperature > 60{
//                            Image("sun2")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: geometry.size.width-300)
//                                .offset(x: 0, y: 100)
//                                .animation(.easeInOut(duration: 1), value: temperature)
//                        }
                        
                        
                        
                        Image("blueCloud")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width - 100)
                            .offset(y: skyH)
                            .animation(.easeInOut(duration: 1), value: skyH)
                            .opacity(opa)
                            .animation(.easeInOut(duration: 1), value: opa)
                        
                        Image("graySky")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width - 100)
                            .offset(y: skyH)
                            .animation(.easeInOut(duration: 1), value: skyH)
                            .opacity(1-opa)
                            .animation(.easeInOut(duration: 1), value: 1-opa)
                        
                        
                        if isRainy == true{
                            // 비오는 소리 + 화면
                        }
                        
                        
                        if lowDust == true{
                            Image("dust1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width)
                                .animation(.easeInOut(duration: 1), value: lowDust)
                        }
                        if middleDust == true{
                            Image("dust2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: heightView)
                                .scaleEffect(1.4)
                                .animation(.easeInOut(duration: 1), value: lowDust)
                        }
                        if highDust == true{
                            Image("dust3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: heightView)
                                .scaleEffect(1.4)
                                .animation(.easeInOut, value: highDust)
                        }
                        
                        
                        
                    }
                    .frame(width: geometry.size.width, height: heightView - 350)
                    
                    
                    // humidity Slider
                    HStack{
                        Label("Humidity: ", systemImage: "drop")
                            .font(.custom(.Gaegu, size: 30))
                            .frame(width: 250)
                            .padding()
                        Spacer()
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                            
                            Capsule()
                                .fill(Color.blue.opacity(0.25))
                                .frame(height: 30)
                                .padding(.trailing)
                            
                            
                            
                            Capsule()
                                .fill(Color.blue.opacity(0.25))
                                .frame(width: hueSlider+20, height: 30)
                                .padding(.trailing)
                            
                            
                            HStack(spacing: (UIScreen.main.bounds.width - 300) / 14){
                                ForEach(0..<12, id: \.self){index in
                                    
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                                }
                            }
                            Circle()
                                .fill(.blue)
                                .frame(width: 35, height: 35)
                                .background(Circle().stroke(Color.white,lineWidth: 5))
                                .offset(x: hueSlider)
                                .gesture(DragGesture().onChanged({ (value) in
                                    if value.location.x >= 50 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                        hueSlider = value.location.x - 50
                                    }
                                    if hueSlider >= 240{
                                        isRainy = true
                                    } else if hueSlider < 240{
                                        isRainy = false
                                    }
                                    
                                    hue = (hueSlider/480) * 100
                                    defineOpa()
                                }))
                        }
                    }
                    
                    // temperature Slider
                    HStack{
                        Label("Temperature: ", systemImage: "sun.max")
                            .font(.custom(.Gaegu, size: 30))
                            .frame(width: 250)
                            .padding()
                        Spacer()
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                            
                            Capsule()
                                .fill(Color.orange.opacity(0.25))
                                .frame(height: 30)
                                .padding(.trailing)
                            
                            
                            
                            Capsule()
                                .fill(Color.orange.opacity(0.25))
                                .frame(width: tempSlider+20, height: 30)
                                .padding(.trailing)
                            
                            
                            HStack(spacing: (UIScreen.main.bounds.width - 300) / 14){
                                ForEach(0..<12, id: \.self){index in
                                    
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                                }
                            }
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 35, height: 35)
                                .background(Circle().stroke(Color.white,lineWidth: 5))
                                .offset(x: tempSlider)
                                .gesture(DragGesture().onChanged({ (value) in
                                    if value.location.x >= 50 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                        tempSlider = value.location.x - 50
                                    }
                                    
                                    temperature = (tempSlider/480) * 100
                                    defineOpa()
                                }))
                        }
                    }
                    
                    HStack{
                        Label("Dust: ", systemImage: "sun.dust")
                            .font(.custom(.Gaegu, size: 30))
                            .frame(width: 250)
                            .padding()
                        Spacer()
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                            
                            Capsule()
                                .fill(Color.gray.opacity(0.25))
                                .frame(height: 30)
                                .padding(.trailing)
                            
                            
                            
                            Capsule()
                                .fill(Color.black.opacity(0.25))
                                .frame(width: dustSlider+20, height: 30)
                                .padding(.trailing)
                            
                            
                            HStack(spacing: (UIScreen.main.bounds.width - 300) / 14){
                                ForEach(0..<12, id: \.self){index in
                                    
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                                }
                            }
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 35, height: 35)
                                .background(Circle().stroke(Color.white,lineWidth: 5))
                                .offset(x: dustSlider)
                                .gesture(DragGesture().onChanged({ (value) in
                                    if value.location.x >= 50 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                        dustSlider = value.location.x - 50
                                    }
                                    
                                    dust = (dustSlider/480) * 100
                                    
                                    switch dust {
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
                                    
                                }))
                        }
                    }
                    
                    Spacer()
                    NavigationLink(destination: QuizView()){
                        Text("Take a Quiz")
                            .font(.custom(.Gaegu_bold, size: 40))
                            
                    }
                    Spacer()
        

                }
                
            }
            .background(allOpa == 1 ? .clear : .black)
            .opacity(allOpa)
            
            VStack{
                
                if showInfo {
                    
                    InfoView()
                }
                
            }
            
        }
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
                        Text("Intro")
                            .font(.custom(.Gaegu, size: 30))
                    }
                    
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if showInfo == true{
                        showInfo = false
                        allOpa = 1.0
                    } else{
                        showInfo = true
                        allOpa = 0.3
                    }
                    
                } label: {
                    HStack{
                        Image(systemName: "cloud")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                        Text(showInfo ? "Look at the Sky!" : "Tip")
                            .font(.custom(.Gaegu_bold, size: 40))
                    }
                    .background(showInfo ? Color.white.opacity(0.8) : .clear)
                    .cornerRadius(10)
                    
                }
            }
        }
        
    }
    
    
    
    func defineOpa (){
        let result = (100-temperature)*0.3 + hue*0.3 + dust * 0.4
        
        switch result {
        case 0..<20:
            opa = 1.0
            skyH = -200
        case 20..<40:
            opa = 0.8
            skyH = -100
        case 40..<60:
            opa = 0.5
            skyH = -0
        case 60..<80:
            opa = 0.3
            skyH = 100
        case 80..<101:
            opa = 0.1
            skyH = 200
        default:
            opa = 0.8
            skyH = -100
        }
    }
}


struct Content_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
