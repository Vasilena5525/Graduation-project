//
//  SplashPageCardView.swift
//  scanface
//
//  Created by vasilena stamova on 15/05/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashPageCardView: View{
    
    
    init(){
        
    }
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(SwiftUI.Color.gray, lineWidth: 0)
                .frame(width: cardAndImageWidth, height: cardHeight)
            VStack(alignment: .leading, spacing: 2) {
                Image("splash-center-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardAndImageWidth, height: imageHeight)
                LazyVStack(alignment: .center, spacing: 2) {
                    Text("CaptionApp")
                        .font(.custom("Roboto Condensed", size: 32))
                        .fontWeight(.bold)
                }
                .padding(.horizontal,12)
                .padding(.bottom,11)
            }
            .frame(width: cardAndImageWidth, height: cardHeight)
            .cornerRadius(cornerRadius)
        }
    }
    private let cardAndImageWidth: CGFloat = UIScreen.screenWidth - UIScreen.screenWidth * 0.4
    private let cardHeight: CGFloat = UIScreen.screenWidth + 70 - UIScreen.screenWidth * 0.4
    private let imageHeight: CGFloat = UIScreen.screenWidth - UIScreen.screenWidth * 0.4
    private let cornerRadius: CGFloat = 5
}
