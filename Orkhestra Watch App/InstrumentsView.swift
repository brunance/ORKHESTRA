//
//  InstrumentsView.swift
//  orkhestraWatch Watch App
//
//  Created by Bruno França do Prado on 16/11/22.
//
import SwiftUI

struct InstrumentsView: View {
    @StateObject var counter = Counter()
    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(instrumentsList, id: \.self) { instrument in
                        VStack(alignment: .center, spacing: 5) {
                            Image(instrument.image)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.top, 5)
                            Text(instrument.name)
                                .bold()
                                .padding(.top, 5)
                                .font(.system(size: 12))
                            Button(action: {
                                hvm.instrumentId = instrument.id
                                counter.increment()
                                print(counter.count)
                            }, label: {})
                            NavigationLink(destination: ChallengeWatchView()) {
                                Text("**ESCOLHER**")
                                    .font(.system(size: 14))

                            }
                            .foregroundColor(.red).padding(.bottom, 5)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
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
