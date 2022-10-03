//
//  CommandReader.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

enum CommandReaderError: Error {
    case inputNotExists
}

/// 사용자 입력을 받는 타입.
struct CommandReader {

    /// 사용자가 콘솔에 입력한 명령을 읽어 반환한다.
    var read: () throws -> String
}

extension CommandReader {

    static let live = Self(
        read: {
            guard let command = readLine() else {
                throw CommandReaderError.inputNotExists
            }
            return command
        }
    )
}
