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

enum ViewType: Int {
  case table = 0
  case collection
}

final class MainViewController: UIViewController {
  
  // MARK: - Properties
  
  
  // MARK: - UI Component
  private lazy var segmentedControl = UISegmentedControl(
    items: ["리스트", "앨범"]
  ).then {
    $0.selectedSegmentIndex = 0
    $0.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
  }
  
  private lazy var tableView = UITableView().then {
    $0.register(
      TableViewCell.self,
      forCellReuseIdentifier: TableViewCell.identifier
    )
  }
  
  private lazy var collectionView = UICollectionView(
    frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
  ).then {
    let layout = UICollectionViewFlowLayout().then {
      $0.minimumLineSpacing = 0
      $0.scrollDirection = .vertical
      $0.sectionInset = .zero
    }
    $0.collectionViewLayout = layout
    $0.isHidden = true
    $0.register(
      CollectionViewCell.self,
      forCellWithReuseIdentifier: CollectionViewCell.identifier
    )
  }

  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    setup()
    setLayouts()
  }
  
  // MARK: - setup
  private func setup() {
    tableView.dataSource = self
    tableView.delegate = self
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  private func setLayouts() {
    view.addSubview(segmentedControl)
    view.addSubview(tableView)
    view.addSubview(collectionView)
    
    segmentedControl.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
      $0.trailing.equalToSuperview().offset(-24)
    }
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(24)
      $0.bottom.equalToSuperview()
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(24)
      $0.bottom.equalToSuperview()
    }
  }
}

extension MainViewController {
  // MARK: - Private Methods
  @objc private func segmentChanged(_ sender: UISegmentedControl) {
    guard let selectedViewType = ViewType(rawValue: sender.selectedSegmentIndex) else { return }
    switch selectedViewType {
    case .table:
      tableView.isHidden = false
      collectionView.isHidden = true
    case .collection:
      tableView.isHidden = true
      collectionView.isHidden = false
    }
  }
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

extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
      return UICollectionViewCell()
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSpacing : CGFloat = 10
    
    let myWidth : CGFloat = (collectionView.bounds.width - itemSpacing * 2) / 3
    
    
    return CGSize(width: myWidth, height: myWidth)
  }
}
