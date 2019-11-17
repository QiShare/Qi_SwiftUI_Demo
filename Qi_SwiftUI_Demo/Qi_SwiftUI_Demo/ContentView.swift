//
//  ContentView.swift
//  Qi_SwiftUI_Demo
//
//  Created by liusiqi on 2019/11/5.
//  Copyright © 2019 QiShare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLeftNav = false
    @State var isRightNav = false
    
    init() {
        //修改导航栏文字颜色
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        UINavigationBar.appearance().tintColor = .systemBlue
    }
    
    var body: some View {
        TabView {
            
            // Tab1:
            NavigationView {
                List(Symbols, id:\.self) {
                    ListRow(symbol: $0)
                }
                .navigationBarTitle(Text("SF Symbols"))
                .navigationBarItems(leading: leftNavButton, trailing: rightNavButton)
            }.tabItem {
                Image.init(systemName: "star.fill")
                Text("Tab1").font(.subheadline)
            }
            
            // Tab2:
            NavigationView {
                Text("This is the second tab.")
            }.tabItem {
                Image.init(systemName: "star.fill")
                Text("Tab2").font(.subheadline)
            }
        }
    }
    
    var leftNavButton: some View {
        Button(action: { self.isLeftNav.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("Left"))
                .padding()
        }
        .sheet(isPresented: $isLeftNav) {
            VStack {
                Text("Hello, we are QiShare!").foregroundColor(.blue).font(.system(size: 32.0))

                HStack {
                    Spacer()
                    Spacer()
                    Text("an iOS Team. ").fontWeight(.black).foregroundColor(.purple)
                    Spacer()
                    Text("We are learning SwiftUI.").foregroundColor(.blue)
                    Spacer()
                }
            }
        }
    }
    
    var rightNavButton: some View {
        Button(action: { self.isRightNav.toggle() }) {
            Image(systemName: "paperplane.fill")
                .imageScale(.large)
                .accessibility(label: Text("Right"))
                .padding()
        }
        .sheet(isPresented: $isRightNav, onDismiss: {
            print("dissmiss RrightNav")
        }) {
            ZStack {
                Text("This is the Right Navi Button.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
