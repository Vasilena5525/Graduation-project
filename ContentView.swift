//
//  ContentView.swift
//  Shared
//
//  Created by vasilena stamova on 15/05/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network

    init(){

        for family in UIFont.familyNames {
             print(family)

             for names in UIFont.fontNames(forFamilyName: family){
             print("== \(names)")
             }
        }

    }
    
    @State private var willMoveToHomeScreen = false;
    
    var body: some View {
        
//        NavigationView {
        
            ZStack{
                Color(hex: "#3A3A3A").ignoresSafeArea()
                SplashPageCardView().onTapGesture {
                    willMoveToHomeScreen = true;
                };
            }
            .navigate(to: HomeTabView(), when: $willMoveToHomeScreen)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarTitle("")
//                    .navigationBarHidden(true)
//
            
        }
//        .navigationBarBackButtonHidden(false)
//            .navigationBarTitle("Captions")
//                    .navigationBarHidden(false)
//    }
}
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
       
    }
}
