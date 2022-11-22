//
//  MenuViewWatchApp.swift
//  OrkhestraWatch Watch App
//
//  Created by Bruno França do Prado on 16/11/22.
//

import SwiftUI

struct MenuViewWatchApp: View {
    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared

    var body: some View {
        NavigationStack {
            VStack {
                Text("Minhas Histórias")
                    .padding(.top, 10)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(historyList, id: \.self) { history in
                    NavigationLink(destination: InstrumentsView()) {
                        ZStack {
                            HStack {
                                Image("\(history.name)WatchOS")
                                    .padding(.trailing, 5)
                                Text(history.title)
                                    .font(.system(size: 13))
                            }
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        hvm.historyId = history.id
                    })
                }
            }
            .padding()
        }
    }
}
