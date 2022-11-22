//
//  HistoryViewModel.swift
//  orkhestraWatch Watch App
//
//  Created by Anna Alicia Milani on 18/11/22.
//

import Foundation
import SwiftUI

class HistoryViewModel: ObservableObject {
    public static var shared: HistoryViewModel = HistoryViewModel()

    @Published var historyId: Int = 0
    @Published var instrumentId: Int = 0
}

