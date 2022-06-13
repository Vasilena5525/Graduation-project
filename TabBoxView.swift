//
//  TabBoxView.swift
//  scanface
//
//  Created by vasilena stamova on 01/06/2022.
//

import SwiftUI

struct TabBoxView: View {
    
    @Binding var selection:Int;
    @Binding var moveToSearchView: Bool;
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 30, content: {
            //
            Spacer()
            
            Button {
                self.selection = 1;
                self.moveToSearchView = true;
            } label: {
                VStack{
                    Image(self.selection == 1 ? "heart-icon-purple" : "heart-icon");
                    Text("Saved").foregroundColor(Color(hex: self.selection == 1 ? "8B32D0" :  "767575"))
                }
            }.padding(EdgeInsets(top: 15,leading: 0,bottom: 0,trailing: 0))
                .foregroundColor(.white)
            Spacer()
            
            Button {
                self.selection = 2;
                self.moveToSearchView = true;
            } label: {
                VStack{
                    Image(self.selection == 2 ? "search-icon-purple" : "search-icon");
                    Text("Search").foregroundColor(Color(hex: self.selection == 2 ? "8B32D0" :  "767575"))
                }
            }.padding(EdgeInsets(top: 15,leading: 0,bottom: 0,trailing: 0))
                .foregroundColor(.white)
            Spacer()
            
        })
    }
}
//
//struct TabBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBoxView()
//    }
//}
