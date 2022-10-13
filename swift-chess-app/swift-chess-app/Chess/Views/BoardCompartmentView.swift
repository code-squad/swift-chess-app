//
//  BoardCompartmentView.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/13.
//

import UIKit

class BoardCompartmentView: UIButton {
    let pieceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        
        addSubview(pieceLabel)
        pieceLabel.translatesAutoresizingMaskIntoConstraints = false
        let pieceLabelConstraints = [pieceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     pieceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     pieceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     pieceLabel.topAnchor.constraint(equalTo: self.topAnchor)]
        NSLayoutConstraint.activate(pieceLabelConstraints)
    }
    
    func update(description: String) {
        self.layer.borderColor = UIColor.clear.cgColor
        self.pieceLabel.text = description
    }
    
    func update(color: UIColor) {
        self.layer.borderColor = color.cgColor
    }
}
