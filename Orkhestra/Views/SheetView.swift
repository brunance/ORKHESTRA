//
//  sheetview.swift
//  Challenge05
//
//  Created by Ruan Eleutério  on 08/11/22.
//

import Foundation
import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared

    let width: Int = 35
    let height: Int = 10

    var body: some View {
        let currentHistory = historyList[hvm.historyId]

        ZStack {
            Color("BackSheet").ignoresSafeArea()
            VStack {
                VStack {
                    Image("\(currentHistory.name)Modal")
                        .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))

                    VStack {
                        ForEach(0...currentHistory.titleList.count - 1, id: \.self) { num in
                            Text(currentHistory.titleList[num])
                                .font(.custom("RubikBubbles-Regular", size: CGFloat(currentHistory.sizeTitleList[num])))
                                .foregroundColor(Color("TitleSheet"))
                                .bold()
                        }
                    }
                    .padding(.init(top: 0, leading: 20, bottom: 4, trailing: 20))

                    Text("30s | Música, Instrumental")
                        .font(.system(size: 12))
                        .foregroundColor(Color("TitleHistory"))
                        .padding(.init(top: 0, leading: 103, bottom: 20, trailing: 101))

                    Text("**\(currentHistory.description)**")
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .font(.system(size: 16))
                        .foregroundColor(Color("TitleSheet"))
                        .lineSpacing(1)

                    Text("INSTRUMENTOS DISPONÍVEIS")
                        .font(.custom("RubikBubbles-Regular", size: 16))
                        .foregroundColor(Color("TitleInstrumentos"))
                        .bold()
                        .padding(.init(top: 20, leading: 16, bottom: 0, trailing: 16))

                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .foregroundColor(Color("TitleHistory"))
                                .frame(width: 350, height: 60)
                                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))

                            HStack(spacing: 12) {
                                VStack {
                                    Image("Pandeiro")
                                        .resizable()
                                        .frame(width: CGFloat(width), height: CGFloat(width))
                                    Text("Pandeiro")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("CombinarText"))
                                        .bold()
                                }
                                VStack {
                                    Image("Chocalho")
                                        .resizable()
                                        .frame(width: CGFloat(width), height: CGFloat(width))
                                    Text("Chocalho")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("CombinarText"))
                                        .bold()
                                }
                                VStack {
                                    Image("Flauta")
                                        .resizable()
                                        .frame(width: CGFloat(width), height: CGFloat(width))
                                    Text("Flauta")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("CombinarText"))
                                        .bold()
                                }
                                VStack {
                                    Image("Saxofone")
                                        .resizable()
                                        .frame(width: CGFloat(width) + 15, height: CGFloat(width))
                                    Text("Saxofone")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("CombinarText"))
                                        .bold()
                                }
                                VStack {
                                    Image("Violao")
                                        .resizable()
                                        .frame(width: CGFloat(width), height: CGFloat(width))
                                    Text("Violão")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("CombinarText"))
                                        .bold()
                                }
                                VStack {
                                    Image("Piano")
                                        .resizable()
                                        .frame(width: CGFloat(width), height: CGFloat(width))
                                    Text("Piano")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("CombinarText"))
                                        .bold()
                                }
                            }
                        }
                    }
                }
                .padding(.init(top: 0, leading: 16, bottom: 70, trailing: 16))
            }
        }
        .ignoresSafeArea()
    }
}
