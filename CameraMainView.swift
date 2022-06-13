//
//  CameraMainView.swift
//  scanface
//
//  Created by vasilena stamova on 16/05/2022.
//

import SwiftUI

struct CameraMainView: View {
    
    @Binding var image:UIImage;
    @Binding var feelingString: String;
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    var body: some View {
        
        VStack{
            HStack(alignment: VerticalAlignment.center, spacing: 10) {
                
                Button {
                    print("Help tapped!");
                    presentationMode.wrappedValue.dismiss();
                } label: {
                    Image("back-arrow")
                    .resizable()
                        .frame(width: 12.0, height: 16.0)
                }
                Spacer();
                ZStack{
                    HStack{
                        Text("Photo")
                    }
                }
                
            }.padding(20)
            CameraMainChildView(image: $image, feelingString: $feelingString )
//                .hiddenNavigationBarStyle()
            Spacer()
        }
//        NavigationView {
        
//            .navigationTitle("Scanning in progress")
//            .navigationBarTitleDisplayMode(.inline)
//            
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        print("Help tapped!")
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Image("back-arrow")
//                        .resizable()
//                            .frame(width: 12.0, height: 16.0)
//                    }
//                }
//            }
//        }
    }
}
//
//struct CameraMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraMainView()
//    }
//}
