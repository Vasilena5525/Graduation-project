//
//  CameraMainChildView.swift
//  scanface
//
//  Created by vasilena stamova on 16/05/2022.
//

import SwiftUI

struct CameraMainChildView: View {
    
    @State private var willMoveToResultScreen = false;
    @State private var selection = 2;
    @Binding var image:UIImage;
    @Binding var feelingString: String;
    
    
    var body: some View {
        
        ZStack{
//            Button {
//                //
////                willMoveToResultScreen = true;
//            } label: {
                //
                Image(uiImage: image).resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.6, alignment: .center)
//            }

//            NavigationLink(destination: ResultToggleSearchView(selection: $selection)){
//
//            }
        }
//        .onAppear(perform: {
//            withAnimation(Animation.spring().delay(5000)) {
//                self.willMoveToResultScreen = true;
//            }
//        .navigate(to: ResultToggleSearchView(selection: $selection), when: $willMoveToResultScreen )
    }
}
//
//struct CameraMainChildView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraMainChildView()
//    }
//}
