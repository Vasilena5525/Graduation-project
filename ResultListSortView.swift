//
//  ResultListSortView.swift
//  scanface
//
//  Created by vasilena stamova on 18/05/2022.
//

import SwiftUI


class SortOptions {

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


struct SortRow: View {
    
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

struct ResultListSortView: View {
    
    @Binding var showFilterPopover:Bool;
    @Binding var parentSortOptions: [FilterOptions];
    
    let threecolumns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
    ];
    
//    @State var optionArray = [
//        FilterOptions(id: 1, name: "A-Z", selected: false),
//        FilterOptions(id: 2, name: "Z-A", selected: false),
//        FilterOptions(id: 3, name: "Caption length: short first", selected: false),
//        FilterOptions(id: 4, name: "Caption length: long first", selected: false)
//    ];
    
    
    
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
                    Image("sortby-icon").resizable().frame(width: 26, height: 46, alignment: .leading)
                    Text("Sort by")
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
                
                Spacer();
                
                ScrollView {
                    LazyVGrid(columns: onecolumns) {
                        ForEach(0..<(parentSortOptions.count), id: \.self) { index in
                            
                            SortRow(note: parentSortOptions[index])
                            
                        }
                    }
                }
                
                HStack{
                    Spacer()
                    
                    Button {
                        // action on button
                        // dismiss page
                        
                        print(self.parentSortOptions[0].selected);
//                        parentSortOptions = self.optionArray;
                        
                        if(self.parentSortOptions[0].selected == true){
                            self.parentSortOptions[1].selected = false
                        }
                        
                        if(self.parentSortOptions[2].selected == true){
                            self.parentSortOptions[3].selected = false
                        }
                        
                        
                        
                        
                        
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
                        ).background(Color(hex: "CE99A1"))
                        .cornerRadius(25)
                        .opacity(0.7)
                    

                    Spacer()
                    
                    
                }
                    
                
            }
            .padding()
            .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.6, alignment: .leading)
            .background(
                LinearGradient(gradient:
                                Gradient(stops: [SwiftUI.Gradient.Stop.init(color: Color(hex: "EE8D56"), location: 0), SwiftUI.Gradient.Stop.init(color: Color(hex: "EE5172"), location: 0.9) ]), startPoint: .top, endPoint: .bottom)
                    
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
