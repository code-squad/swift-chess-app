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
enum CommandReader {

    /// 사용자가 콘솔에 입력한 명령을 읽어 반환한다.
    static func read() throws -> String {
        guard let command = readLine() else {
            throw CommandReaderError.inputNotExists
        }
        return command
    }
}
