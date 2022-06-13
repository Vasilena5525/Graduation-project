//
//  HomeTabView.swift
//  scanface
//
//  Created by vasilena stamova on 15/05/2022.
//

import SwiftUI

struct HomeTabView: View {
    
    @State var selection = -1;
    @State var moveToSavedView = false;
    @State var moveToSearchView = false;
    @State var facialExpression = "";

//
    
//    init() {
//        UITabBar.appearance().backgroundColor = Color(hex: "#3a3a3a").uiColor()
//    }
    
    var body: some View {
        
        VStack{
            
//            if ( self.selection == 1 || self.selection == 2 ) {
//                ResultToggleSearchView(selection: $selection);
////                Spacer();
//            } else {
                HomeSavedTabView();
//                Spacer();
//            }
            
//            Spacer();
            TabBoxView(selection: $selection, moveToSearchView: $moveToSearchView).background(Color(hex: "#3A3A3A"))
            
        }
        .navigate(to: ResultToggleSearchView(facialExpression: $facialExpression, selection: $selection), when: $moveToSearchView)
        

//        TabView(selection: $selection) {
//
//            HomeSavedTabView()
//            .tabItem {
//                if selection == 0 {
//                    Image("heart-icon-purple")
//                    Text("Saved")
//                } else {
//                    Image("heart-icon")
//                    Text("Saved")
//                }
//
//            }.tag(0)
//
//            HomeSearchTabView()
//            .tabItem {
//                if selection == 1 {
//                    Image("search-icon-purple")
//                    Text("Search")
//                } else {
//                    Image("search-icon")
//                    Text("Search")
//                }
//                Text("Search")
//            }.tag(1)
//        }
//        .accentColor(.purple)
        
    }
    
}
//
//struct HomeTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeTabView()
//    }
//}
