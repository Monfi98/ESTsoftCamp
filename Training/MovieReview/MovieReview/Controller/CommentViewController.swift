//
//  CommentViewController.swift
//  MovieReview
//
//  Created by 신승재 on 3/4/25.
//

import UIKit

class CommentViewController: UIViewController {
  
  @IBOutlet weak var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.textView.becomeFirstResponder()
  }
  
  @IBAction func cancelButtonTapped(_ sender: Any) {
    self.presentingViewController?.dismiss(animated: true)
  }
  
  @IBAction func confirmButtonTapped(_ sender: Any) {
    self.presentingViewController?.dismiss(animated: true)
  }
  
}

extension CommentViewController: UITextViewDelegate {
  
}
