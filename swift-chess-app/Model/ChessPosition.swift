//
//  ChessPosition.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/27.
//

import Foundation

struct ChessPosition: Equatable {
    let rank: Int
    let file: Int
    
    var positionString: String {
        // 유니코드 변환의 경우는 아직 실패할 가능성을 못봤기 때문에, fatalError로 남겨두겠습니다.
        guard let unicode = UnicodeScalar(asciiA + file) else { fatalError("ChessPosition 변환 오류 \(file) \(rank)") }
        return "\(Character(unicode))\(rank + 1)"
    }
    
    public init(rank: Int, file: Int) {
        self.rank = rank
        self.file = file
    }
    
    public init?(_ chessPositionString: String) { // String Command로 인한 생성에 실패할 경우 fatalError가 아닌, nil로 반환. Optional을 활용.
        let arr = Array(chessPositionString.uppercased())
        guard let rank = arr[1].wholeNumberValue,
              let fileAscii = arr[0].asciiValue
        else { return nil }
        
        self.rank = rank - 1
        self.file = Int(fileAscii) - asciiA
    }
    
    // TODO: ChessPosition을 비교하는 함수들 수정 필요.
    // 현재는 입력이 String Command 형식이라 이렇게 구현을 했는데..
    // 추후에 핵심 로직을 넘어 App을 개발하게 되면 어떤식으로 입력을 할것인가에 대한 정의와 정리가 필요함.
    // 그때 반드시..!
    public static func ==(lhs: ChessPosition, rhs: ChessPosition) -> Bool {
        lhs.rank == rhs.rank && lhs.file == rhs.file
    }
    
    public static func ==(lhs: ChessPosition, rhs: String) -> Bool {
        guard let chessPosition = ChessPosition(rhs) else { return false }
        
        return lhs.rank == chessPosition.rank && lhs.file == chessPosition.file
    }
    
    public static func ==(lhs: String, rhs: ChessPosition) -> Bool {
        guard let chessPosition = ChessPosition(lhs) else { return false }
        
        return chessPosition.rank == rhs.rank && chessPosition.file == rhs.file
    }
}
