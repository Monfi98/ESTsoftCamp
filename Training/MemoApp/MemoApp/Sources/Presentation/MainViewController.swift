//
//  ViewController.swift
//  MemoApp
//
//  Created by 신승재 on 3/8/25.
//

import UIKit
import Combine

import SnapKit
import Then

final class MainViewController: UIViewController {
  
  // MARK: - Properties
  
  // MARK: - UI Component
  private lazy var segmentedControl = UISegmentedControl(
    items: ["리스트", "앨범"]
  ).then {
    $0.selectedSegmentIndex = 0
  }
  
  private lazy var tableView = UITableView().then {
    $0.register(
      TableViewCell.self,
      forCellReuseIdentifier: TableViewCell.identifier
    )
    $0.rowHeight = 106
  }

  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground
    setup()
    setLayouts()
  }
  
  // MARK: - setup
  private func setup() {
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  private func setLayouts() {
    view.addSubview(segmentedControl)
    view.addSubview(tableView)
    
    segmentedControl.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
      $0.trailing.equalToSuperview().offset(-24)
    }
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(24)
      $0.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Binding


}

extension MainViewController {
  // MARK: - Private Methods
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
    let cell = tableView.dequeueReusableCell(
      withIdentifier: TableViewCell.identifier,
      for: indexPath
    ) as! TableViewCell
      return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("select \(indexPath.row)")
  }
}
