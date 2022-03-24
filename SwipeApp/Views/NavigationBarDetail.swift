//
//  NavigationBarDetail.swift
//  SwipeApp
//
//  Created by magnodev 
//

import SwiftUI

struct NavigationBarDetail: View {
    //MARK: PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    //MARK: BODY
    var body: some View {
        HStack{
            Button(action: {
              isOnboardingViewActive = true
            }, label: {
                Image(systemName: "chevron.left")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("ColorBlue"))
            })//::BUTTON
        
                
            Spacer()
         
            
        }//:: HSTACK
    }
}

struct NavigationBarDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetail()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.gray)
    }
}
