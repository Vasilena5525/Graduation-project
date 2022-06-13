//
//  HomeSearchTabView.swift
//  scanface
//
//  Created by vasilena stamova on 15/05/2022.
//

import SwiftUI



fileprivate struct ListResult: Identifiable {
    let id = UUID()
    let label: String
    let liked: Bool = false
    let copied: Bool = false
}

struct HomeSearchTabView: View {
    
    fileprivate let listData = [
        ListResult(label: "Smile its free therapy"),
        ListResult(label: "Livestreaming, Literally"),
        ListResult(label: "To walk into nature is to witness a thousand miracles -Mary Davis"),
        ListResult(label: "Sorry, TLC, I chased the waterfall"),
    ];
    
    let columns = [
        GridItem(.flexible()),
    ];
    
    @State private var showFilterPopover = false;
    @State private var showSortPopover = false;
    @State private var searchText = "";
    
    var body: some View {
        
//        NavigationView {
            HomeSearchListView()
            .navigationTitle("Search by keywords")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
                            .navigationTitle("Searchable Example")
//        }
        
//        NavigationView {
//            Text("Searching for \(searchText)")
//                .searchable(text: $searchText)
//                .navigationTitle("Searchable Example")
//        }
        
        
    }
}
//
//struct HomeSearchTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeSearchTabView()
//    }
//}
