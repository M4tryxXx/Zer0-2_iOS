//
//  MainView.swift
//  Zer0-2
//
//  Created by Eugen Ionita on 11/09/2024.
//

import SwiftUI



struct MainView: View {
   
    @State private var rotationAngle: Double = 0
    @State private var ButtonState = "Pull A Note"
    @State private var notesInTheJar = 198
    @State private var isAnimating = false
    @State private var notePulled = false
    @State private var note = ""
    
    @State private var instructions = [
    Text("Little Jar full of Pozitive Messages just for You!")
        .font(.system(size: 18, weight: .bold, design: .default))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding(20)
    ,
    Text("Directions for use: \n Pull one note daily or when needed.")
        .font(.system(size: 14, weight: .bold, design: .default))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding(.bottom, 10)
    ,
    Text("Ingredients: \n Blessings, Friendship, Karma & Success!")
        .font(.system(size: 14, weight: .bold, design: .default))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)]
    
    var body: some View {
    
        ZStack {
            LinearGradient(colors: [.black, Color.backgroundBottom], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image("LuckyJarLogo")
                        .resizable()
                        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0), anchor: .center)
                        .rotation3DEffect(.degrees(isAnimating ? 360 : 0), axis: (x: isAnimating ? 360 : 0, y: isAnimating ? 120 : -90, z: 0))
                                    .animation(Animation.linear(duration: 18)
                                        .repeatForever(autoreverses: false), value: rotationAngle)
                                    .onAppear {
                                        self.isAnimating = true
                                        self.rotationAngle = 360
                                    }
                        .aspectRatio(contentMode: .fit)
                        .frame( width: UIScreen.main.bounds.width / 100 * 16, height: UIScreen.main.bounds.width / 100 * 16)
                        .cornerRadius(10)
                        .padding(.leading, UIScreen.main.bounds.width / 100 * 4)
                        .padding(.trailing, UIScreen.main.bounds.width / 100 * 7)
                        
                        
//                    Spacer()
                    Text("Lucky Jar")
                        .font(.system(size: 30, weight: .semibold, design:.default ))
                        .foregroundColor(Color("TextColor"))
                        .padding(.trailing, UIScreen.main.bounds.width / 100 * 20)
                   
                }
                VStack{
                    Rectangle()
                        .fill(Color("Transparent"))
                        .frame(width: UIScreen.main.bounds.width / 100 * 90, height: 10.0)
                        
                        .cornerRadius(10)
                        .border(ImagePaint(image: Image("heart"), scale: 0.5), width: 7)
                        .cornerRadius(10)
                    
                    Text("Notes in the jar: \n \(notesInTheJar)")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        
                        
                    VStack{
                        
                        Text(notePulled ? "\(note)" : "Little Jar full of Pozitive Messages just for You!")
                            .font(.system(size: notePulled ? 28 : 18, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(20)

                        Text(notePulled ? "" : "Directions for use: \n Pull one note daily or when needed.")
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                        Text( notePulled ? "" : "Ingredients: \n Blessings, Friendship, Karma & Success!")
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width / 100 * 89, height: 400, alignment: .center)
                    .border(ImagePaint(image: Image("heart"),sourceRect: CGRect(x: 0.03, y: 0, width: 1, height: 1.1) , scale: 0.5 ), width: 10)
                    .cornerRadius(10)
                        
                    
                }
                Spacer()
                Button {
                    notePulled = true
                    switch note {
                    case "":
                        note = jarNotes.randomElement() ?? "No element in the jar!"
                        ButtonState = "Pull Another Note"
                        notesInTheJar -= 1
                    case "\(note)" :
                        note = jarNotes.randomElement() ?? "No element in the jar!"
                        notesInTheJar -= 1
                    default :
                        note = ""
                        notePulled = false
                        ButtonState = "Pull A Note"
                        notesInTheJar += 2
                    }
                    
                }
                       label: {
                    Text("\(ButtonState)")
                }
                       .buttonStyle(.bordered)
                       .tint(.green)
                       .font(.title)
                       .bold()
                       .padding(.bottom, 5)
                Button {
                        notePulled = true
                        note = ""
                        notePulled = false
                        ButtonState = "Pull A Note"
                }
                       label: {
                    Text("Done")
                }
                       .buttonStyle(.bordered)
                       .tint(.green)
                       .font(.title2)
                       .padding(.bottom, 10)
                Spacer()
                
                Rectangle()
                    .fill(Color("Transparent"))
                    .frame(width: UIScreen.main.bounds.width / 100 * 90, height: 10.0)
                    
                    .cornerRadius(10)
                    .border(ImagePaint(image: Image("heart"), scale: 0.5), width: 7)
                    .cornerRadius(10)
                
                
                Text("Project By M4tryxXx \n  Sept - 2024 ")
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
            }
            
        }
    }
}



#Preview {
    MainView()
}
