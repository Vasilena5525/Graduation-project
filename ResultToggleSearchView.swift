//
//  ResultToggleSearchView.swift
//  scanface
//
//  Created by vasilena stamova on 03/06/2022.
//

import SwiftUI
//
//struct ResultToggleSearchView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ResultToggleSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultToggleSearchView()
//            .environmentObject(Network())
//
//    }
//}



struct ResultToggleSearchView: View {
    
    @EnvironmentObject var network: Network
    @Binding var facialExpression: String;
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var results = [Caption]();
    
    @Binding var selection: Int;
    
    @State var parentSortOptions:[FilterOptions] = [
        FilterOptions(id: 1, name: "A-Z", selected: false),
        FilterOptions(id: 2, name: "Z-A", selected: false),
        FilterOptions(id: 3, name: "Caption length: short first", selected: false),
        FilterOptions(id: 4, name: "Caption length: long first", selected: false)
    ];
    
    @State var parentFilterOptions:[FilterOptions] = [
        FilterOptions(id: 1, name: "Funny", selected: false),
        FilterOptions(id: 2, name: "Simple", selected: false),
        FilterOptions(id: 3, name: "Cachy", selected: false),
        
        FilterOptions(id: 5, name: "Sassy", selected: false),
        FilterOptions(id: 6, name: "Art", selected: false),
        FilterOptions(id: 7, name: "Lyrics", selected: false),
        FilterOptions(id: 8, name: "Quote", selected: false),
        
        FilterOptions(id: 10, name: "Clever", selected: false),
        FilterOptions(id: 11, name: "Motivational", selected: false),
        FilterOptions(id: 12, name: "Marketing", selected: false),
        FilterOptions(id: 13, name: "Descrptive", selected: false)
    ]
    
    @State var searchText = "";
    
    let notes = [
        Note(name: "Joe's Original"),
        Note(name: "The Real Joe's Original"),
        Note(name: "Original Joe's")
    ]
    
    let columns = [
        GridItem( .flexible() ),
    ];
    
    @State private var showFilterPopover = false;
    @State private var showSortPopover = false;
    
    func calcFilters() -> String{
        let filter = "filters=";
        let sort = "sort=";
        let expression = "facialExpression=";
        
        
        let f = parentFilterOptions.map { item -> String in
            if(item.selected == true){
                return item.name;
            }
            return ""
        }.filter({ $0 != ""}).joined(separator: "|")
        
        let s = parentSortOptions.map { item -> String in
            if(item.selected == true){
                return item.name;
            }
            return ""
        }.filter({ $0 != ""}).joined(separator: "|")
        
        
        let r = filter + f + "&" + sort + s + "&" + expression + facialExpression;
        print("r", r);
        
        
        return r
        
        
        
    }
        
    var body: some View {
        
        ZStack{
            
            VStack{
                HStack(alignment: VerticalAlignment.center, spacing: 10) {
                    
                    Button {
                        print("Help tapped!")
                        self.selection = -1;
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("back-arrow")
                        .resizable()
                            .frame(width: 12.0, height: 16.0)
                    }
                    Spacer();
                    ZStack{
                        HStack{
                            Text("We Found \(network.captions.count) results");
    //                        Text( selection == 1 ? "Saved" : "Search")
                        }
                    }
                    
                }.padding(20)
                
                if(self.selection == 2){
                    HStack(alignment: VerticalAlignment.center, spacing: 30, content: {
                        //
                        ResultToggleSearchBar(searchText: $searchText)
                            
    //                        .margin(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white, lineWidth: 1)
                                )
                            .background(Color(hex: "3a3a3a"))
                            .cornerRadius(30)
                    }).padding()
                }
                
                
//                .background(Color(hex: "3a3a3a"))
            }
            
            
            
        }
        
        
        ZStack(alignment: .leading, content: {
            //
            Spacer()
            
            if((network.captions.count) == 0){
                HStack{
                    Spacer();
                    VStack(alignment: HorizontalAlignment.center, spacing: 20, content: {
                        Image("search-icon").resizable().frame(width: 60.0, height: 60.0, alignment: .center);
                        Text(selection == 2 ? "Search captions by keywords" : "No captions found").font(.custom("Roboto Condensed", size: 36))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "767575"))
                            .multilineTextAlignment(.center);
                    })
                    Spacer();
                    
                }
                
            }
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
                            network.getCaptions(params: calcFilters())
                            
                            
                            
                            
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
                            
//                            print(parentSortOptions[0].selected)
                            network.getCaptions(params: calcFilters())
                            
                            
                            
                            
                        }, content: {
                            ResultListSortView(showFilterPopover: $showSortPopover, parentSortOptions: self.$parentSortOptions)
                        })
                    Spacer()
                }.padding(30)
            }
            
        })
        
        Spacer();
        TabBoxInner(selection: $selection)
            .background(Color(hex: "#3A3A3A"));
            
    }
    
}
//
//struct ResultListMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultListMainView()
//    }
//}
