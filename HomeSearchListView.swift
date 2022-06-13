//
//  HomeSearchListView.swift
//  scanface
//
//  Created by vasilena stamova on 18/05/2022.
//

import SwiftUI

struct HomeSearchListView: View {
    
    
    @EnvironmentObject var network: Network

    @State var results = [Caption]()
    
    let notes = [
        Note(name: "Joe's Original"),
        Note(name: "The Real Joe's Original"),
        Note(name: "Original Joe's")
    ]
    
    let columns = [
        GridItem(.flexible()),
    ];
    
    @State private var showFilterPopover = false;
    @State private var showSortPopover = false;
    
    @State var parentSortOptions:[FilterOptions] = [
        FilterOptions(id: 1, name: "A-Z", selected: false),
        FilterOptions(id: 2, name: "Z-A", selected: false),
        FilterOptions(id: 3, name: "Caption length: short first", selected: false),
        FilterOptions(id: 4, name: "Caption length: long first", selected: false)
    ];
    
    @State var parentFilterOptions:[FilterOptions] = [
        FilterOptions(id: 1, name: "Funny", selected: false),
        FilterOptions(id: 2, name: "Simple", selected: false),
        FilterOptions(id: 3, name: "Cachy", selected: true),
        
        FilterOptions(id: 5, name: "Sassy", selected: false),
        FilterOptions(id: 6, name: "Art", selected: false),
        FilterOptions(id: 7, name: "Lyrics", selected: false),
        FilterOptions(id: 8, name: "Quote", selected: false),
        
        FilterOptions(id: 10, name: "Clever", selected: false),
        FilterOptions(id: 11, name: "Motivational", selected: false),
        FilterOptions(id: 12, name: "Marketing", selected: false),
        FilterOptions(id: 13, name: "Descrptive", selected: false)
    ]
    
    func calcFilters() -> String{
        var filter = "filters=";
        var sort = "sort=";
        
        var f = parentFilterOptions.map { item -> String in
            if(item.selected == true){
                return item.name;
            }
            return ""
        }
        
        print("f", f);
        
        
        return ""
        
        
        
    }
   
    
    var body: some View {
        
        
        ZStack(alignment: .leading, content: {
            //
            Spacer()
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(network.captions) { item in
//                        Color.gray.frame(width: 100, height: 100)
                        Spacer()
                        NoteRow(note: item)
//                        Button(action: {
//                                print("sign up bin tapped")
//                            }) {
//                                Text("Recent")
                                
//                            }
                            
                        Spacer()
                    }
                }
                
                .cornerRadius(10)
                .padding()
            }.onAppear {
                network.getCaptions(params: calcFilters());
            }
            Spacer();
            
            VStack {
                Spacer();
                HStack(alignment: VerticalAlignment.bottom, spacing: 10) {
                    //
                    Spacer()
                    Button(action: {
                            print("sign up bin tapped")
                        self.showFilterPopover = true;
                    }){
                        
                            HStack(alignment: VerticalAlignment.center, spacing: 5) {
                                Image("filter-icon").resizable().frame(width: 20, height: 20, alignment: Alignment.leading)
                                Text("Filter")
                            }
                            
                                .frame(minWidth: 0, maxWidth: 100)
                                .font(.system(size: 16))
                                .padding()
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 0)
                            )
                        }
                        .background(
                            LinearGradient(gradient:
                                            Gradient(stops: [SwiftUI.Gradient.Stop.init(color: Color(hex: "37B55E"), location: 0), SwiftUI.Gradient.Stop.init(color: Color(hex: "88904F"), location: 0.9) ]), startPoint: .top, endPoint: .bottom)
                                
                        )
                        .cornerRadius(10)
                        .fullScreenCover(isPresented: self.$showFilterPopover, onDismiss: {
                            // dismiss callback here
                        }, content: {
                            ResultListFilterView(showFilterPopover: $showFilterPopover, parentFilterOptions: $parentFilterOptions)
                        })
                                
                                    
                    
                    Button(action: {
                            print("sign up bin tapped")
                        self.showSortPopover = true;
                        }) {
                            HStack(alignment: VerticalAlignment.center, spacing: 5) {
                                Image("sortby-icon").resizable().frame(width: 20, height: 20, alignment: Alignment.leading)
                                Text("Sort by")
                            }
                            
                                .frame(minWidth: 0, maxWidth: 100)
                                .font(.system(size: 16))
                                .padding()
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 0)
                            )
                        }
                        .background(
                            LinearGradient(gradient:
                                            Gradient(stops: [SwiftUI.Gradient.Stop.init(color: Color(hex: "EE4578"), location: 0), SwiftUI.Gradient.Stop.init(color: Color(hex: "F8875C"), location: 0.9) ]), startPoint: .top, endPoint: .bottom)
                                
                        )
                        .cornerRadius(10)
                        .fullScreenCover(isPresented: self.$showSortPopover, onDismiss: {
                            // dismiss callback here
                        }, content: {
                            ResultListSortView(showFilterPopover: $showSortPopover,
                                               parentSortOptions: self.$parentSortOptions)
                        })
                    Spacer()
                }.padding(30)
            }
            
        })
    }
}
//
//struct HomeSearchListView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeSearchListView()
//    }
//}
