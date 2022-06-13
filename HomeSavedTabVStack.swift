//
//  HomeSavedTabVStack.swift
//  scanface
//
//  Created by vasilena stamova on 15/05/2022.
//

import SwiftUI

struct HomeSavedTabVStack: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    @State private var image = UIImage();
    @State private var willMoveToCameraScreen = false;
    @State private var moveToSearchView = false;
    @State private var feelingString = "";
    @State private var facialExpression = "";
    @State private var selection = 2;
    
    var predictionManager = PredictionManager()
    
//    @State private var willMoveToCameraScreen = false;
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0, content: {
            //
            HStack(alignment: VerticalAlignment.center, spacing: 10) {
                
                Button {
                    print("Help tapped!")
                } label: {
                    Image("cog-wheel")
                    .resizable()
                        .frame(width: 32.0, height: 32.0)
                }
                Spacer();
                ZStack{
                    HStack{
                        Text("Photos")
                    }
                }
                
            }.padding(20)
            HStack(alignment: VerticalAlignment.center, spacing: 10) {
                //
                Spacer()
                Button(action: {
                        print("sign up bin tapped")
                    }) {
                        Text("Recent")
                            .frame(minWidth: 0, maxWidth: 50)
                            .font(.system(size: 11))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 0)
                        )
                    }
                    .background(Color(hex: "#3A3A3A")) // If you have this
                    .cornerRadius(25)
                
                Button(action: {
                        print("sign up bin tapped")
                    }) {
                        Text("Favorites")
                            .frame(minWidth: 0, maxWidth: 50)
                            .font(.system(size: 11))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 0)
                        )
                    }
                    .background(Color(hex: "#3A3A3A")) // If you have this
                    .cornerRadius(25)
                
                Button(action: {
                        print("sign up bin tapped")
                    }) {
                        Text("Selfies")
                            .frame(minWidth: 0, maxWidth: 50)
                            .font(.system(size: 11))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 0)
                        )
                    }
                    .background(Color(hex: "#3A3A3A")) // If you have this
                    .cornerRadius(25)
                Spacer()
                
            }
            Spacer()
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0...100, id: \.self) { _ in
                        var image_name = ["fear", "angry", "happy", "sad", "neutral", "surprise", "horrified" ]
                        
                        var randName = image_name.randomElement()!
                        Button {
                            //
                            // find image name
                            // move to next screen
                            if let uimage = UIImage(named: randName){
                                self.image = uimage;
                                
//                                self.willMoveToCameraScreen = true;
                                
                                // find the image feeling
                                let monoImage = uimage.mono
                                
                                predictionManager.classification(for: monoImage){(result) in
                                    DispatchQueue.main.async {
                                        facialExpression = result == "Angry" ? "Anger" : result == "Surprise" ? "Surprised" : result ;
                                        print(facialExpression);
                                        self.moveToSearchView = true;
                                    }
                                }
                            }
                            
                        } label: {
                            Image(randName).resizable().aspectRatio(contentMode: .fill).frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenWidth / 4, alignment: .center)
                        }
                        
//                        Image(frame(width: 100.0, height: 100.0, alignment: Alignment))
                        // Color.gray.frame(width: 100, height: 100)
                    }
                }
            }
            HStack(alignment: VerticalAlignment.center, spacing: 10) {
                //
                Spacer()
                Button(action: {
                    print("sign up bin tapped");
                    self.isShowCamera = true
                    }) {
                    
                        HStack(alignment: VerticalAlignment.center, spacing: 5) {
                            Image("camera-white").resizable().frame(width: 20, height: 20, alignment: Alignment.leading)
                            Text("Camera")
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
                                        Gradient(stops: [SwiftUI.Gradient.Stop.init(color: Color(hex: "EE4549"), location: 0), SwiftUI.Gradient.Stop.init(color: Color(hex: "FABC2C"), location: 0.9) ]), startPoint: .top, endPoint: .bottom)
                            
                    )
                    .cornerRadius(10)
                
                Button(action: {
                    print("sign up bin tapped");
                    self.isShowPhotoLibrary = true
                    }) {
                        HStack(alignment: VerticalAlignment.center, spacing: 5) {
                            Image("gallery-white").resizable().frame(width: 20, height: 20, alignment: Alignment.leading)
                            Text("Gallery")
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
                                        Gradient(stops: [SwiftUI.Gradient.Stop.init(color: Color(hex: "3995DB"), location: 0), SwiftUI.Gradient.Stop.init(color: Color(hex: "88BC86"), location: 0.9) ]), startPoint: .top, endPoint: .bottom)
                            
                    )
                    .cornerRadius(10)
                Spacer()
            }.padding(30)
                .sheet(isPresented: $isShowPhotoLibrary, onDismiss: {
                    //
                    print("dismiss here", self.image);                    
                    self.willMoveToCameraScreen = true;
                    
                }, content: {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                })
                .sheet(isPresented: $isShowCamera, onDismiss: {
                    //
                    print("dismiss here", self.image);
                    self.willMoveToCameraScreen = true;
                    
                }, content: {
                    ImagePicker(sourceType: .camera, selectedImage: self.$image)
                })
            
        })
        .fullScreenCover(isPresented: self.$willMoveToCameraScreen, onDismiss: {
                // dismiss callback here
                    
            
            }, content: {
                CameraMainView(image: $image,  feelingString: $feelingString);
//                            ResultListSortView(showFilterPopover: $showSortPopover, parentSortOptions: self.$parentSortOptions)
            })
        .fullScreenCover(isPresented: self.$moveToSearchView, onDismiss: {
                // dismiss callback here
                    
            
            }, content: {
                ResultToggleSearchView(facialExpression: $facialExpression, selection: $selection)
//                            ResultListSortView(showFilterPopover: $showSortPopover, parentSortOptions: self.$parentSortOptions)
            })
//        .navigate(to: CameraMainView(image: $image), when: $willMoveToCameraScreen)
//        .navigate(to: ResultToggleSearchView(selection: $selection), when: $moveToSearchView)
    }
}
//
//struct HomeSavedTabVStack_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeSavedTabVStack()
//    }
//}



