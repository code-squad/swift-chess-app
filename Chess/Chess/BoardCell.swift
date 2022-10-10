//
//  BoardCell.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/10.
//

import UIKit

class BoardCell: UICollectionViewCell {
    static let reuseIdentifier: String = "BoardCell"

    private let pieceLabel: UILabel = {
        let label = UILabel()
        label.text = "."
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        self.layer.borderColor = UIColor.green.cgColor

        addSubview(pieceLabel)

        NSLayoutConstraint.activate([
            pieceLabel.topAnchor.constraint(equalTo: self.topAnchor),
            pieceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pieceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pieceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setMovable(_ movable: Bool) {
        self.layer.borderWidth = movable ? 1 : 0
    }

    func setPiece(_ text: String) {
        self.pieceLabel.text = text
    }
}
