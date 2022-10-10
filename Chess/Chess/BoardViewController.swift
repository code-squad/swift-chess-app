//
//  ViewController.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/09/23.
//

import UIKit

class BoardViewController: UIViewController {
    private let currentTeamView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.reuseIdentifier)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let collectionViewLayout: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 9),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0 / 10)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 10)

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }()

    private let board: Board
    private var currentDisplay: String
    private var turn: Team
    private var selectedPosition: Position?
    private var movablePositions: [Position]?

    init(board: Board) {
        self.board = board
        self.currentDisplay = board.display()
        self.turn = .white
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }

    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(currentTeamView)
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = collectionViewLayout
    }

    private func setLayout() {
        NSLayoutConstraint.activate([
            currentTeamView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -40),
            currentTeamView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentTeamView.widthAnchor.constraint(equalToConstant: 200),
            currentTeamView.heightAnchor.constraint(equalToConstant: 40),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func reloadData() {
        currentDisplay = board.display()
        collectionView.reloadData()
    }

    private func changeTurn() {
        turn = turn == .white ? .black : .white
        currentTeamView.backgroundColor = turn == .white ? .white : .black
    }

    private func position(fromIndexPath indexPath: IndexPath) -> Position? {
        guard let file = File(index: indexPath.row - 1),
              let rank = Rank(index: indexPath.section - 1)
        else {
            return nil
        }

        return Position(file: file, rank: rank)
    }
}

extension BoardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.reuseIdentifier, for: indexPath) as? BoardCell
        else {
            return BoardCell()
        }

        let index = currentDisplay.index(
            currentDisplay.startIndex,
            offsetBy: indexPath.section * 10 + indexPath.row
        )
        let char = currentDisplay[index]
        cell.setPiece(String(char))

        if let movablePositions = movablePositions,
           let position = position(fromIndexPath: indexPath),
           movablePositions.contains(position) {
            cell.setMovable(true)
        } else {
            cell.setMovable(false)
        }

        return cell
    }
}

extension BoardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let position = position(fromIndexPath: indexPath) else {
            return
        }

        if let selectedPosition = selectedPosition {
            if selectedPosition == position {
                self.selectedPosition = nil
                self.movablePositions = nil
                reloadData()
                return
            }
            if let movablePositions = movablePositions,
               movablePositions.contains(position) {
                board.move(from: selectedPosition, to: position)
                self.selectedPosition = nil
                self.movablePositions = nil
                changeTurn()
                reloadData()
            }
            return
        }

        let movablePositions = board.select(at: position, for: turn)
        if movablePositions.isEmpty {
            return
        }

        selectedPosition = position
        self.movablePositions = movablePositions
        reloadData()
    }
}
