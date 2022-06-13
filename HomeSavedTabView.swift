//
//  HomeSavedTabView.swift
//  scanface
//
//  Created by vasilena stamova on 15/05/2022.
//

import SwiftUI

struct HomeSavedTabView: View {
    
    
    @State public var willMoveToCameraMainScreen = false;
//    @State public var willMoveToCameraScreen = false;
    @State private var willMoveToCameraScreen = false;
//    @State public var image = UIImage();
    @State private var image = UIImage();
//    @State private var image = UIImage();
//    $willMoveToCameraScreen
    var body: some View {
//        NavigationView {
        VStack{
            HomeSavedTabVStack()
            Spacer();
        }
            
//            .navigationTitle("Photo")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        print("Help tapped!")
//                    } label: {
//                        Image("cog-wheel")
//                        .resizable()
//                            .frame(width: 32.0, height: 32.0)
//                    }
//                }
//            }
//
//        }
//        .navigate(to: CameraMainView(image: $image), when: $willMoveToCameraScreen)
        
        
    }
}
//
//struct HomeSavedTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeSavedTabView()
//    }
//}
