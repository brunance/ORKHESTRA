////
////  Counter.swift
////  Orkhestra
////
////  Created by Ruan Eleutério  on 22/11/22.
////
//
//
//import Foundation
//import Combine
//import WatchConnectivity
//


import Foundation
import Combine
import WatchConnectivity

final class Counter: ObservableObject {
    var session: WCSession
    let delegate: WCSessionDelegate
    let subject = PassthroughSubject<[Int], Never>()
    
    public static let shared = Counter()

    
    @Published private(set) var count: [Int] = [0,0,0]
    
    init(session: WCSession = .default) {
        self.delegate = SessionDelegater(countSubject: subject)
        self.session = session
        self.session.delegate = self.delegate
        self.session.activate()
   
        
        subject
            .receive(on: DispatchQueue.main)
            .assign(to: &$count)
    }
    
    func increment(historyId:Int, instrumentId:Int) {
        
        count[0] = historyId
        count[1] = instrumentId
        count[2] = 1
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    func decrement() {
        
        count[2] = 0
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
}
