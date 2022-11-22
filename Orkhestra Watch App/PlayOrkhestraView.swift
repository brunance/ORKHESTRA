//
//  PlayOrkhestraView.swift
//  orkhestraWatch Watch App
//
//  Created by Bruno França do Prado on 20/11/22.
//

import SwiftUI

struct PlayOrkhestraView: View {
    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared
    

    var body: some View {
        var currentInstrument = instrumentsList[hvm.instrumentId]
        VStack {
            ZStack {
                Circle()
                    .frame(width: 74, height: 74)
                Image(currentInstrument.image)
            }
            Text(historyList[hvm.historyId].title)
                .font(.system(size: 15))
            Text("\(currentInstrument.name) Instrumental")
                .font(.system(size: 10))
            HStack {
          
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color("Destaque1"))
                        Image(systemName: "play.fill")
                            .font(.system(size: 30))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 50)
                .padding()

            }
        }
    }
}

struct PlayOrkhestraView_Previews: PreviewProvider {
    static var previews: some View {
        PlayOrkhestraView()
    }
}
