//
//  TableViewCell.swift
//  MemoApp
//
//  Created by 신승재 on 3/8/25.
//

import UIKit

import SnapKit
import Then

class TableViewCell: UITableViewCell {
  
  static let identifier = "MemoCell"
  
  // MARK: - UI Component
  lazy var image = UIImageView().then {
    $0.image = UIImage(systemName: "photo.artframe")
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
  }
  
  lazy var dateLabel = UILabel().then {
    $0.text = "날짜가 들어갈 자리입니다."
  }
  
  lazy var previewLabel = UILabel().then {
    $0.text = "프리뷰가 들어갈 자리입니다."
  }
  
  lazy private var stackView = UIStackView(
    arrangedSubviews: [dateLabel, previewLabel]
  ).then {
    $0.axis = .vertical
    $0.distribution = .equalSpacing
  }
  
  // MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setLayouts()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - setup
  private func setLayouts() {
    contentView.addSubview(image)
    contentView.addSubview(stackView)
    
    image.snp.makeConstraints {
      $0.width.height.equalTo(86)
      $0.leading.equalToSuperview().offset(10)
      $0.verticalEdges.equalToSuperview().inset(10)
    }
    
    stackView.snp.makeConstraints {
      $0.leading.equalTo(image.snp.trailing).offset(20)
      $0.trailing.equalToSuperview().offset(10)
      $0.verticalEdges.equalToSuperview().inset(30)
    }
    
  }
}
