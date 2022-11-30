//
//  InstrumentsView.swift
//  orkhestraWatch Watch App
//
//  Created by Bruno França do Prado on 16/11/22.
//
import SwiftUI

struct InstrumentsView: View {

    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared
    @ObservedObject var hl: HistoryList = HistoryList.shared

//    @StateObject var counter = Counter()
    
    var body: some View {
        let instruments = hl.historyList[hvm.historyId].lisfOfInstruments
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
                                counter.increment(historyId: hvm.historyId,instrumentId: hvm.instrumentId)
                                updateCount(historyId: counter.count[0], instrumentsId: counter.count[1])
                                print(counter.count)
                               
                        
                            }, label: {})

                            NavigationLink(destination: ChallengeWatchView()) {
                                Text(instrument.name)
                                    .foregroundColor(Color("Destaque1"))
                                    .font(.system(size: 14))
                                    .bold()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 85, alignment: .center)
                        .padding()
                    }
                }
                .listStyle(CarouselListStyle())
                .padding()
            }
        }
        .navigationBarTitle(hl.historyList[hvm.historyId].navTitle)
    }
    func updateCount(historyId:Int, instrumentsId: Int){
        
        hl.historyList[historyId].lisfOfInstruments[instrumentsId].unlock = true
      
        
    }
}


