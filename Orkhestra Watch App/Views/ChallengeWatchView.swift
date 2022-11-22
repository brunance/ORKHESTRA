//
//  ChallengeWatchView.swift
//  orkhestraWatch Watch App
//
//  Created by Bruno França do Prado on 18/11/22.
//

import SwiftUI
import CoreMotion

struct ChallengeWatchView: View {
    @State var progress: Double = 0
    @State var victory = false
    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared
    @State var estado = false
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    @State var control = true
    @State private var pitch = Double.zero
    @State private var yaw = Double.zero
    @State private var roll = Double.zero
    @EnvironmentObject var audioManager: AudioManagerWatch

    var body: some View {
//        let currentInstrument = historyList[hvm.historyId]
//                                    .lisfOfInstruments
//                                    .first(where: {
//                                        $0.id == hvm.instrumentId
//                                    })
        let currentInstrument = historyList[hvm.historyId]
            .lisfOfInstruments[hvm.instrumentId]

        NavigationView {
            VStack {
                Spacer()

                ZStack {
                    NavigationLink(destination: PlayOrkhestraView(), isActive: $victory) {}

                    CircularProgressView(progress: progress, strokeLine: 7)

                    Image(currentInstrument.image)
                        .resizable()
                        .frame(width: 55, height: 55)
                }
                .frame(width: 100, height: 100)

                Spacer()

                Text(currentInstrument.challenge)
                    .font(.system(size: 20))

              
            }
            .onAppear {
                self.motionManager.startDeviceMotionUpdates(to: self.queue) { (data: CMDeviceMotion?, error: Error?) in
                    guard let data = data else {
                        print("Error: \(error!)")
                        return
                    }
                    let attitude: CMAttitude = data.attitude

                    if attitude.pitch >= 0 && attitude.pitch <= 0.2 {
                        estado = true
                    }

                    if attitude.pitch <= -1 && estado == true && control == true {
                        estado = false
                        audioManager.playSound(sound: currentInstrument.name)
                        progress += 1/10

                    }
                    
                    if(progress >= 0.9){
                        victory = true
                        control = false
                    }
                    
                    print("pitch: \(attitude.pitch)")
                    print("yaw: \(attitude.yaw)")
                    print("roll: \(attitude.roll)")

                    if !estado {
                        DispatchQueue.main.async {
                            self.pitch = attitude.pitch
                            self.yaw = attitude.yaw
                            self.roll = attitude.roll
                        }
                    }
                }
            }
            .onDisappear {
                control = false
            }
        }
        .navigationBarTitle(currentInstrument.name)
    }
    
    

    func resetProgress() {
        progress = 0
    }

    struct OrchestraWatchView_Previews: PreviewProvider {
        static var previews: some View {
            ChallengeWatchView()
        }
    }
}
