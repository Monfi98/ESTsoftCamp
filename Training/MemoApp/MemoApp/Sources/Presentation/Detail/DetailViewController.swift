//
//  DetailViewController.swift
//  MemoApp
//
//  Created by 신승재 on 3/9/25.
//

import UIKit

enum DetailViewType {
  case edit
  case add
}

class DetailViewController: UIViewController {
  // MARK: - Properties
  var viewType: DetailViewType = .add
  var id: UUID?
  var image: UIImage?
  
  // MARK: - UI Component
  private lazy var confirmButton = UIBarButtonItem().then {
    $0.image = UIImage(systemName: "checkmark")
    $0.target = self
    $0.action = #selector(confirmButtonTapped)
  }
  
  var dateLabel = UILabel().then {
    $0.text = Date().formattedDate
  }
  
  var img = UIImageView().then {
    $0.image = UIImage(systemName: "plus")
  }
  
  private lazy var imageContainer = UIView().then {
    let tapGesture = UITapGestureRecognizer(
      target: self,
      action: #selector(imageTapped)
    )
    $0.addGestureRecognizer(tapGesture)
  }
  
  var textView = UITextView().then {
    $0.font = .systemFont(ofSize: 18)
  }

  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
    setLayouts()
  }
  
  // MARK: - setup
  private func setup() {
    title = viewType == .edit ? "Edit" : "Add"
    view.backgroundColor = .systemBackground
    navigationItem.rightBarButtonItem = confirmButton
    textView.becomeFirstResponder()
  }
  
  private func setLayouts() {
    view.addSubview(dateLabel)
    imageContainer.addSubview(img)
    view.addSubview(imageContainer)
    view.addSubview(textView)
    
    dateLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
    }
    
    imageContainer.snp.makeConstraints {
      $0.top.equalTo(dateLabel.snp.bottom).offset(10)
      $0.horizontalEdges.equalToSuperview().inset(70)
      $0.height.equalTo(imageContainer.snp.width)
    }
    
    img.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    textView.snp.makeConstraints {
      $0.top.equalTo(img.snp.bottom).offset(10)
      $0.horizontalEdges.equalToSuperview().inset(24)
      $0.bottom.equalToSuperview()
    }
  }
}

extension DetailViewController {
  // MARK: - Private Methods
  @objc private func confirmButtonTapped(_ sender: UIBarButtonItem) {
    guard let content = textView.text else { return }
    switch viewType {
    case .add:
      guard let imageData = self.image?.pngData() else { return }
      CoreDataManager.shared.createMemo(content: content, imageData: imageData)
    case .edit:
      guard let id = id else { return }
      guard let imageData = self.image?.pngData() else { return }
      CoreDataManager.shared.updateMemo(
        id: id,
        content: content,
        imageData: imageData
      )
    }
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func imageTapped(_ sender: UITapGestureRecognizer) {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.delegate = self
    present(picker, animated: true)
  }
}

extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let selectedImage = info[.originalImage] as? UIImage {
      self.img.image = selectedImage
      self.image = selectedImage
    }
    picker.dismiss(animated: true)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
  }
}
