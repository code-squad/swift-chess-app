//
//  CommandReader.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

enum CommandReaderError: Error {
    case inputNotExists
}

enum CommandReader {

    static func read() throws -> String {
        guard let command = readLine() else {
            throw CommandReaderError.inputNotExists
        }
        return command
    }
}
