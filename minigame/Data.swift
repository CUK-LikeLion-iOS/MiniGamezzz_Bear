
import Foundation

struct GameFramework {
    let name : String
    let imageName : String
    let description : String
}

extension GameFramework {
    static let list = [
        
        GameFramework(name: "탭탭", imageName: "hand.tap", description: "누가 손이 가장 빠를까 ?? "),
        GameFramework(name: "쉐킷쉐킷", imageName: "waveform", description: "shakeit !  "),
        GameFramework(name: "부비부비", imageName: "slider.horizontal.below.rectangle", description: "액티브 게임")
    ]
}
