//
//  ResultToggleSearchBar.swift
//  scanface
//
//  Created by vasilena stamova on 05/06/2022.
//

import SwiftUI

struct ResultToggleSearchBar: View {
    
    @Binding var searchText: String;
    
    var body: some View {
        HStack{
            Spacer(minLength: 10)
            Image("search-icon").resizable().frame(width: 24, height: 24, alignment: .center).padding()
            TextField("Search", text: $searchText).font(.custom("Roboto Condensed", size: 20))
            Image("mic-icon").resizable().frame(width: 16, height: 24, alignment: .center).padding()
            Spacer(minLength: 10)
        }
    }
}
//
//struct ResultToggleSearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultToggleSearchBar()
//    }
//}
