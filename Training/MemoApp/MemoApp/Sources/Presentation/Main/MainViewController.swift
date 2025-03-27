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
  private let mainVM = MainViewModel()
  private let input: PassthroughSubject<MainViewModel.Input, Never> = .init()
  private var memos: [Memo] = []
  
  // MARK: - UI Component
  private lazy var addButton = UIBarButtonItem().then {
    $0.image = UIImage(systemName: "plus")
    $0.target = self
    $0.action = #selector(addButtonTapped)
  }
  
  private lazy var segmentedControl = UISegmentedControl(
    items: ["Table View", "Collection View"]
  ).then {
    $0.selectedSegmentIndex = 0
    $0.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
  }
  
  private lazy var tableView = UITableView().then {
    $0.register(
      TableViewCell.self,
      forCellReuseIdentifier: TableViewCell.identifier
    )
    $0.rowHeight = 106
  }
  
  private lazy var collectionView = UICollectionView(
    frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
  ).then {
    let layout = UICollectionViewFlowLayout().then {
      $0.minimumLineSpacing = 10
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
    
    memos = CoreDataManager.shared.fetchMemos()
    
    setup()
    bind()
    setLayouts()
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    
    input.send(.onAppear)
    
    memos = CoreDataManager.shared.fetchMemos()
    
    tableView.reloadData()
    collectionView.reloadData()
  }
  
  // MARK: - setup
  private func setup() {
    title = "Memo"
    view.backgroundColor = .systemBackground
    navigationItem.rightBarButtonItem = addButton
    
    tableView.dataSource = self
    tableView.delegate = self
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  private func bind() {
    let output = mainVM.transform(input: input.eraseToAnyPublisher())
    output.receive(on: DispatchQueue.main)
      .sink { event in
        switch event {
        case .loadMemoDatas()
        case .pushToDetailView
        }
      }
  }
  
  private func setLayouts() {
    
    view.addSubview(segmentedControl)
    view.addSubview(tableView)
    view.addSubview(collectionView)
    
    segmentedControl.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
      $0.centerX.equalToSuperview()
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
  
  @objc private func addButtonTapped(_ sender: UIBarButtonItem) {
    let nextVC = DetailViewController()
    navigationController?.pushViewController(nextVC, animated: true)
  }
}

// MARK: - TableViewDelegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return memos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: TableViewCell.identifier,
      for: indexPath
    ) as! TableViewCell
    cell.previewLabel.text = memos[indexPath.row].content
    cell.dateLabel.text = memos[indexPath.row].createAt?.formattedDate
    cell.image.image = UIImage(data: memos[indexPath.row].image!)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let nextVC = DetailViewController()
    nextVC.viewType = .edit
    nextVC.id = memos[indexPath.row].id
    nextVC.image = UIImage(data: memos[indexPath.row].image!)
    nextVC.img.image = UIImage(data: memos[indexPath.row].image!)
    nextVC.dateLabel.text = memos[indexPath.row].createAt?.formattedDate
    nextVC.textView.text = memos[indexPath.row].content
    navigationController?.pushViewController(nextVC, animated: true)
  }
}

// MARK: - CollectionViewDelegate
extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return memos.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.image.image = UIImage(data: memos[indexPath.row].image!)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSpacing : CGFloat = 10
    let myWidth : CGFloat = (collectionView.bounds.width - itemSpacing * 2) / 3
    
    return CGSize(width: myWidth, height: myWidth)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let nextVC = DetailViewController()
    nextVC.id = memos[indexPath.row].id
    nextVC.image = UIImage(data: memos[indexPath.row].image!)
    nextVC.img.image = UIImage(data: memos[indexPath.row].image!)
    nextVC.dateLabel.text = memos[indexPath.row].createAt?.formattedDate
    nextVC.textView.text = memos[indexPath.row].content
    navigationController?.pushViewController(nextVC, animated: true)
  }
}
