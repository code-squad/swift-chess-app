//
//  BoardView.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/10.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    func clickedCompartment(_ sender: UIButton?)
}

class BoardView: UIView {
    var compartmentViews: [[BoardCompartmentView]] = []
    weak var delegate: BoardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, row: Int, col: Int) {
        self.init(frame: frame)
        self.setupUI(row: row, col: col)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(row: Int, col: Int) {
        let width = frame.width / CGFloat(row)
        let height = frame.height / CGFloat(col)
        let size = CGSize(width: width, height: height)
        var backgroundColor: UIColor = .gray
        
        (0..<row).forEach { section in
            var compartmentViewsAtSection: [BoardCompartmentView] = []
            (0..<col).forEach { item in
                let compartementView = BoardCompartmentView(frame: CGRect(origin: CGPoint(x: CGFloat(item) * width,
                                                                                          y: CGFloat(section) * height),
                                                                          size: size))
                compartementView.addTarget(self, action: #selector(clickedCompartment), for: .touchUpInside)
                compartementView.backgroundColor = backgroundColor
                addSubview(compartementView)
                
                compartmentViewsAtSection.append(compartementView)
                backgroundColor = backgroundColor == .gray ? .brown : .gray
            }
            compartmentViews.append(compartmentViewsAtSection)
            backgroundColor = backgroundColor == .gray ? .brown : .gray
        }
    }
    
    func clear() {
        compartmentViews.flatMap({ $0 }).forEach({ $0.update(description: "") })
    }
    
    func update(row: Int, col: Int, color: UIColor) {
        compartmentViews[row][col].update(color: color)
    }
    
    func update(row: Int, col: Int, description: String) {
        compartmentViews[row][col].update(description: description)
    }
    
    @objc func clickedCompartment(_ sender: UIButton?) {
        delegate?.clickedCompartment(sender)
    }
    
    func position(_ sender: UIButton?) -> (row: Int, col: Int)? {
        let row = compartmentViews.count
        var result: (row: Int, col: Int)?
        (0..<row).forEach { section in
            let col = compartmentViews[section].count
            (0..<col).forEach { item in
                if compartmentViews[section][item] == sender {
                    result = (section, item)
                }
            }
        }
        
        return result
    }
}
