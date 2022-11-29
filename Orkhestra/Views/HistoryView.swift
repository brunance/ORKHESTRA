//
//  ContentView.swift
//  Challenge05
//
//  Created by Bruno França do Prado on 07/11/22.
//
import Foundation
import SwiftUI

struct HistoryView: View {
    @State private var showingSheet = false
    @State private var showingCountDown = false
    @State var isGameView = true
    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared
    @StateObject var counter = Counter()
    
//    @StateObject var counter = Counter()

    let columns = [
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color("Primaria1").ignoresSafeArea()

                VStack {
                    TabView {
                        ForEach(historyList, id: \.self) { item in
                            ZStack {
                                Color("Primaria1")
                                Image("\(item.name)Padrao")
                                    .resizable()
                                Image("\(item.name)Card")
                                    .resizable()
                                    .padding(.init(top: 115, leading: 3, bottom: 369.6, trailing: 2.5))
                                Image("\(item.name)Moldura")
                                    .resizable()
                                    .padding(.init(top: -7, leading: 0, bottom: 0, trailing: 0))
                                ZStack {
                                    Button(action: {
                                        
                                        showingSheet.toggle()
                                        print(historyList[0].lisfOfInstruments[0].unlock)
                                        updateCount(historyId: counter.count[0], instrumentsId: counter.count[1])
                                            
                                        
                                        
                                      print(counter.count)
                                        
                                    }, label: {

                                        ZStack {
                                            Image(systemName: "questionmark.circle.fill")
                                                .font(.system(size: 43))
                                                .foregroundColor(Color("BackQuestion"))

                                            Image(systemName: "questionmark.circle")
                                                .font(.system(size: 43))
                                                .foregroundStyle(Color("LightQuestion"))
                                        }
                                    })
                                    .sheet(isPresented: $showingSheet) {
                                        SheetView()
                                    }
                                }
                                .padding(.init(top: 77, leading: 331, bottom: 724, trailing: 16))

                                VStack {
                                    ForEach(0...item.titleList.count - 1, id: \.self) { num in
                                        Text(item.titleList[num])
                                            // swiftlint:disable:next line_length
                                            .font(.custom("RubikBubbles-Regular", size: CGFloat(item.sizeTitleList[num])))
                                            .foregroundColor(Color("TitleHistory"))
                                    }
                                }
                                .padding(.init(top: 440, leading: 30, bottom: 200, trailing: 30))
                                VStack {
                                    Text("30s | Música, Instrumental")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("TitleHistory"))
//                                    Text("Instrumentos: \(counter.count)")
//                                        .font(.system(size: 12))
//                                        .foregroundColor(Color("TitleHistory"))
                                }
                                .padding(.init(top: 640, leading: 121, bottom: 240, trailing: 119))
                                VStack {
                                    Button(action: {
                                        hvm.historyId = item.id
                                        showingCountDown.toggle()
                                       
                                    }, label: {
                                        HStack {
                                            Image(systemName: "play.fill")
                                                .padding(.init(top: 8, leading: 85.5, bottom: 8, trailing: 0))
                                            Text("**COMBINAR**")
                                                .padding(.init(top: 8, leading: 0, bottom: 8, trailing: 85.5))
                                                .font(.system(size: 16))
                                        }
                                        .foregroundColor(Color("CombinarText"))
                                    })
                                    .frame(width: 296, height: 40)
                                    .background(Color("TitleHistory"))
                                    .cornerRadius(8)
                                    .ignoresSafeArea()
                                }
                                .padding(.init(top: 673, leading: 47, bottom: 131, trailing: 47))
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .ignoresSafeArea()

                    // swiftlint:disable:next line_length
                    NavigationLink(destination: CountDownView(isGameView: $isGameView).navigationBarBackButtonHidden(true), isActive: $showingCountDown) {}
                }
            }
        }
    }
}



struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
