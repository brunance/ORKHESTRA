//
//  GameViewModel.swift
//  Challenge05
//
//  Created by Anna Alicia Milani on 20/11/22.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    public static var shared: GameViewModel = GameViewModel()

    @Published var isClickable: Bool = true
}
