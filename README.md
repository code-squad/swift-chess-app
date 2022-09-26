# swift-chess-app
스위프트 체스게임 앱

## 1. 체스보드와 Pawn

### 타입 설명

#### ChessBoard

- 지정한 보드 크기에 맞게 타입 생성
- Position 타입으로 해당 위치가 접근 가능한지, ChessPiece가 있는지 확인
- 기물(ChessPiece)을 이동시키고 이동되었는지 여부를 확인
- `standardChessBoard()` 함수를 통해 표준 체스 보드를 반환

#### ChessPiece

- 팀 색상 정보(TeamColor)와 기물 타입(PieceType) 프로퍼티 제공
-  해당 Position에서 이동가능한 모든 Position 반환
  - 다른 기물이 있는지 확인하지 않고 이동 가능한 위치만 반환

#### ChessGame

- 매 움직임마다 플레이어 턴을 토글하며 한 플레이어가 두 번 이동하지 못하도록 막음

### 테스트 케이스

- `standardChessBoard()`가 적절한 위치에 폰을 생성했는지?
- `standardChessBoard()`가 폰을 각각 8개씩 생성했는지?
- 매 턴 제대로 된 입력을 넣었을 시 제대로 이동이 가능한지?
- 한 플레이어가 연속 두 번 이동을 시도하거나 아무 기물이 없는 위치에 내린 명령을 차단하는지?
- 폰이 역으로 이동하거나 같은 색 말로 이동할 경우 이동을 차단하는지?
