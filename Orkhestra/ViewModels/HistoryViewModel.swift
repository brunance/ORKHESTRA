//
//  HistoryViewModel.swift
//  Challenge05
//
//  Created by Ruan Eleutério  on 08/11/22.
//

import Foundation
import SwiftUI

class HistoryViewModel: ObservableObject {
    public static var shared: HistoryViewModel = HistoryViewModel()

    @Published var historyId: Int = 0
}
