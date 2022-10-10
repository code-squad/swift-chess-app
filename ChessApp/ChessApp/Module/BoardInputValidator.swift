//
//  BoardInputValidator.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/11.
//

import Foundation

final class BoardInputValidator {
  private let inputCount = 2
  
  func checkPosition(_ input: String) -> Result<Void, InputError> {
    let trimmedInput = input.trimmingCharacters(in: [" "])
    
    if trimmedInput.isEmpty {
      return .failure(.empty)
    }
    
    if trimmedInput.count != self.inputCount {
      return .failure(.count)
    }
    
    return .success(Void())
  }
}
