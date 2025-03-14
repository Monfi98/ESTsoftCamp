//
//  CollectionViewCell.swift
//  MemoApp
//
//  Created by 신승재 on 3/9/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
  static let identifier = "ImageCell"
  
  // MARK: - UI Component
  lazy var image = UIImageView().then {
    $0.image = UIImage(systemName: "photo.artframe")
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
  }
  
  // MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setLayouts()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - setup
  private func setLayouts() {
    contentView.addSubview(image)
    
    image.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
