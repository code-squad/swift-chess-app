//
//  BoardView.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/10/11.
//

import SwiftUI

struct BoardView: View {
  @StateObject var board = Board()

  var body: some View {
    VStack {
      // Board
      Grid {
        ForEach(Position.Rank.allCases, id: \.rawValue) { rank in
          GridRow {
            ForEach(Position.File.allCases, id: \.rawValue) { file in
              pieceView(at: .init(file: file, rank: rank))
            }
          }
        }
      }
      .padding()

      // Score
      Grid {
        GridRow {
          Text(Player.black.name)
            .font(.headline)
            .foregroundColor(board.currentPlayer == .black ? .green : Color(UIColor.label))
          Text(Player.white.name)
            .font(.headline)
            .foregroundColor(board.currentPlayer == .white ? .green : Color(UIColor.label))
        }
        GridRow {
          Text("\(board.scores[.black, default: 0])")
          Text("\(board.scores[.white, default: 0])")
        }
      }
    }
  }

  private func pieceView(at position: Position) -> some View {
    Button {
      cellTapped(at: position)
    } label: {
      Text(board.pieces[position: position]?.symbol ?? "")
        .font(.system(size: 32, weight: .regular, design: .monospaced))
        .foregroundColor(Color.black)
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .background(board.selectedPosition == position ? Color.green : Color(UIColor.lightGray))
        .border(board.availableNextPositions.contains(where: { $0 == position }) ? .green : .black, width: 2)
    }
  }

  private func cellTapped(at position: Position) {
    let result = board.selectPiece(at: position)

    if case .failure(let error) = result, error == .notPlayersPiece {
      UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
  }
}

struct BoardView_Previews: PreviewProvider {
  static var previews: some View {
    BoardView()
  }
}
