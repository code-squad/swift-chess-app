//
//  InputError.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/11.
//

import Foundation

enum InputError: Error {
  case empty
  case count
  
  var localizedDescription: String {
    switch self {
    case .empty:
      return "빈 값을 입력했습니다."
    case .count:
      return "두 글자로 입력해주세요."
    }
  }
}
