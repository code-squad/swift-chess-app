//
//  ViewController.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/26.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
  private var hostingController: UIHostingController<BoardView> = .init(rootView: BoardView())

  override func viewDidLoad() {
    super.viewDidLoad()

    addChild(hostingController)
    view.addSubview(hostingController.view)
    hostingController.didMove(toParent: self)

    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
      hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
}
