//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Arda Sentürk on 06.09.21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    @State var selectedIndex = 0
    @State var showModal = false
    
    let tabBarImages = ["house", "tray", "plus.app.fill", "bookmark", "person"]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $showModal, content: {
                        Button(action: {showModal.toggle()}, label: {
                            Text("Fullscreen cover")
                        })
                    })
                
                switch selectedIndex {
                    case 0:
                        NavigationView {
                            List {
                                ForEach(0..<100) { num in
                                    Text("\(num). Row | First Tab")
                                }
                            }.navigationTitle("First Tab")
                        }
                    case 1:
                        NavigationView {
                            List {
                                ForEach(0..<100) { num in
                                    Text("\(num). Row | Second Tab")
                                }
                            }.navigationTitle("Second Tab")
                        }
                    case 2:
                        NavigationView {
                            List {
                                ForEach(0..<100) { num in
                                    Text("\(num). Row | Third Tab")
                                }
                            }.navigationTitle("Third Tab")
                        }
                    case 3:
                        NavigationView {
                            List {
                                ForEach(0..<100) { num in
                                    Text("\(num). Row | Fourth Tab")
                                }
                            }.navigationTitle("Fourth Tab")
                        }
                    case 4:
                        NavigationView {
                            List {
                                ForEach(0..<100) { num in
                                    Text("\(num). Row | Fifth Tab")
                                }
                            }.navigationTitle("Fifth Tab")
                        }
                    default:
                        NavigationView {
                            Text("Remaining tabs")
                        }
                }
            }
            
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        if num == 2 {
                            showModal.toggle()
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        if num == 2 {
                            Image(systemName: tabBarImages[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: tabBarImages[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        Spacer()
                    })
                    
                }
            }
        }
    }
}

//TabView {
//    Text("First")
//        .tabItem {
//            Image(systemName: "person")
//            Text("First")
//        }
//    Text("Second")
//        .tabItem {
//            Image(systemName: "gear")
//            Text("Second")
//        }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
