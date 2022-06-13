//
//  ResultListFilterView.swift
//  scanface
//
//  Created by vasilena stamova on 18/05/2022.
//

import SwiftUI



class FilterOptions {
    
    var id: Int
    var name: String
    var selected: Bool = false

    init(id: Int, name: String, selected: Bool) {
        self.id = id
        self.name = name
        self.selected = selected
    }
    
    public func toggle(){
        self.selected = !self.selected;
    }
}

struct FilterRow: View {
    
    @State var note: FilterOptions
    
    @State var selected = false;
    
    var body: some View {
        
        HStack{
            
            (self.selected == true || self.note.selected == true ? Image("fill-box") :   Image("empty-box")).resizable().frame(width: 25, height: 25, alignment: .leading)
            Text( note.name )
                .font(.custom("RedHatDisplay-Bold", size: 24))
            Spacer()
        }.onTapGesture {
            print("tap tapping?", note.selected )
            note.selected.toggle();
            selected = note.selected;
            
        }
        
    }
}

struct ResultListFilterView: View {
    
    @Binding var showFilterPopover:Bool;
    @Binding var parentFilterOptions: [FilterOptions];
    
    let threecolumns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
    ];
    
    
    
    
    let twocolumns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    let onecolumns = [
            GridItem(.flexible()),
        ]
    
    
    var body: some View {
        VStack(alignment: .leading, content: {
            VStack{
                
                HStack{
                    Image("filter-icon").resizable().frame(width: 26, height: 26, alignment: .leading)
                    Text("Filter")
                        .font(.custom("RedHatDisplay-Bold", size: 36))
//                                        .fontWeight(Font.Weight?)
                        .multilineTextAlignment(TextAlignment.leading)
//                        .padding()
                    Spacer()
                    Button {
                        showFilterPopover.toggle();
                    } label: {
                        Image("close-icon").resizable().frame(width: 45, height: 35, alignment: .leading)
                    }

                    
                }
                HStack{
                    Text("Categories")
                        .font(.custom("RedHatDisplay-Regular", size: 24))
                        .multilineTextAlignment(TextAlignment.leading)
//                        .padding()
                    Spacer()
                }
                
                Spacer();
                
                ScrollView {
                    LazyVGrid(columns: twocolumns) {
                        ForEach(0..<(parentFilterOptions.count - 3), id: \.self) { index in
                            FilterRow(note: parentFilterOptions[index]);
                        }
                    }
                    LazyVGrid(columns: onecolumns) {
                        ForEach(10..<parentFilterOptions.count, id: \.self) { index in
                            FilterRow(note: parentFilterOptions[index]);
                        }
                    }
                }
                
                HStack{
                    Spacer()
                    
                    Button {
                        // action on button
                        // dismiss page
                        showFilterPopover.toggle();
                        
                        
                    } label: {
                        Text("Done")
                    }.frame(width: 90, height: 32, alignment: .center)
                        .font(.custom("RedHatDisplay-Medium", size: 24))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 0)
                        ).background(Color(hex: "A0B999"))
                        .cornerRadius(25)
                        .opacity(0.7)
                    

                    Spacer()
                    
                    
                }
                    
                
            }
            .padding()
            .frame(width: UIScreen.screenWidth - UIScreen.screenWidth * 0.10, height: UIScreen.screenHeight * 0.7, alignment: .leading)
            .background(
                LinearGradient(gradient:
                                Gradient(stops: [SwiftUI.Gradient.Stop.init(color: Color(hex: "D8CD6E"), location: 0), SwiftUI.Gradient.Stop.init(color: Color(hex: "56A754"), location: 0.9) ]), startPoint: .top, endPoint: .bottom)
                    
            )
            .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.purple, lineWidth: 0)
                    )
            .cornerRadius(25.0)
            
            
                
//            Spacer()
        }).background(BackgroundBlurView())
//            .cornerRadius(20.0)
            
            
    }
}
//
//struct ResultListFilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultListFilterView()
//    }
//}
