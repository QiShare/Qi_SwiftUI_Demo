//
//  ListDetail.swift
//  Qi_SwiftUI_Demo
//
//  Created by liusiqi on 2019/11/5.
//  Copyright © 2019 QiShare. All rights reserved.
//

import SwiftUI

struct ListDetail: View {
    
    var symbol: String
    
    var body: some View {
        VStack {
            
            Text("Image:").font(.headline)
            
            Spacer()
            
            Image(systemName: symbol)
                .foregroundColor(Colors.randomElement())
                .imageScale(.large)
                .scaleEffect(3)
                .padding(.bottom, 100)
            
            Divider()
            
            Text("Image Name:").font(.headline)
            Spacer()
            Text(symbol)
                .font(.largeTitle)
            Spacer()
        }
        .navigationBarTitle(symbol)
    }
}

struct ListDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListDetail(symbol: "chevron.up")
    }
}
