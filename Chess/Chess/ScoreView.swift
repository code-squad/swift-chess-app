//
//  ScoreView.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/11.
//

import UIKit

class ScoreView: UIView {
    private let whiteTeamScore: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let blackTeamScore: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        addSubview(stackView)
        stackView.addArrangedSubview(whiteTeamScore)
        stackView.addArrangedSubview(blackTeamScore)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setScore(white: Score?, black: Score?) {
        whiteTeamScore.text = "White: \(white?.point ?? 0)"
        blackTeamScore.text = "Black: \(black?.point ?? 0)"
    }
}
