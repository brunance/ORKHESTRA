//
//  InstrumentsView.swift
//  orkhestraWatch Watch App
//
//  Created by Bruno França do Prado on 16/11/22.
//
import SwiftUI

struct InstrumentsView: View {

    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared

    @StateObject var counter = Counter()
    
    var body: some View {
        let instruments = historyList[hvm.historyId].lisfOfInstruments
        NavigationView {
            VStack {
                List {
                    ForEach(instruments, id: \.self) { instrument in
                        VStack(alignment: .center, spacing: 5) {
                            Text("Escolha!")
//                                .padding(.top, 5)
//                                .multilineTextAlignment(.center)
//                                .lineLimit(nil)
                                .font(.system(size: 12))
//                                .frame(maxWidth: .infinity, maxHeight: 90, alignment: .center)
                            
                            Image(instrument.image)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.top, 5)

                            Button(action: {
                                hvm.instrumentId = instrument.id
                                
                                counter.increment()
                                print(counter.count)
                                counter.increment()
                                print(counter.count)
                            }, label: {})

                            NavigationLink(destination: ChallengeWatchView()) {
                                Text(instrument.name)
                                    .font(.system(size: 14))
                                    .bold()
                            }
                            .foregroundColor(Color("Destaque1"))
//                            .padding(.bottom, 5)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 85, alignment: .center)
                        .padding()
                    }
                }
                .listStyle(CarouselListStyle())
                .padding()
            }
        }
        .navigationBarTitle(historyList[hvm.historyId].navTitle)
    }
}
