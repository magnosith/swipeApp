//
//  HomeView.swift
//  SwipeApp
//
//  Created by magnodev 
//

import SwiftUI




struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    @State private var textTitle: String = "Meditar."
    
    let haptitcFeedback = UINotificationFeedbackGenerator()

    //BODY
    var body: some View {
        
        VStack(spacing: 20){
                //MARK: - HEADER
            NavigationBarDetail()
                .padding(.horizontal)
    
            VStack {
                Text(textTitle)
                    .font(.system(size: 45))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("ColorBlue"))
                    .transition(.opacity)
                .id(textTitle)
            
            }
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -40)
            .animation(.easeOut(duration: 1), value: isAnimating)
            
            Spacer()
            ZStack {
        
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeIn(duration: 4)
                        .repeatForever(), value: isAnimating
                    )
            }
            
            //MARK: - CENTER
            
            Text("Importância de meditar, pensar sobre si, autoconhecimento faz você sentir-se mais leve e com um humor lá em cima")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //MARK: FOOTER
            Spacer()
            
            
            Button(action: {
                //Some Action
                withAnimation{
                    haptitcFeedback.notificationOccurred(.success)
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }){
                
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Reiniciar")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
                
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : 40)
            .animation(.easeOut(duration: 0.2), value: isAnimating)
            
        }//: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
