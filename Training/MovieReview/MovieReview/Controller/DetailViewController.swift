//
//  DetailViewController.swift
//  MovieReview
//
//  Created by 신승재 on 3/4/25.
//

import UIKit

class DetailViewController: UIViewController {
  
  var movie: Movie?
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var miniPosterImageView: UIImageView!
  @IBOutlet weak var boxofficeLabel: UILabel!
  @IBOutlet weak var movieNameLabel: UILabel!
  @IBOutlet weak var releaseLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    setupUI()
    
  }
  
  private func setupUI() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "bubble.and.pencil"),
      style: .plain,
      target: self,
      action: #selector(addReviewButtonTapped)
    )
    
    posterImageView.image = UIImage(named: movie!.imageName) ?? UIImage()
    posterImageView.contentMode = .scaleAspectFill
    
    let overlayView = UIView(frame: posterImageView.bounds)
    overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
    posterImageView.addSubview(overlayView)
    
    miniPosterImageView.image = UIImage(named: movie!.imageName) ?? UIImage()
    miniPosterImageView.contentMode = .scaleAspectFill
    miniPosterImageView.layer.cornerRadius = 5
    miniPosterImageView.clipsToBounds = true
    
    boxofficeLabel.text = "박스오피스 순위: \((movie?.rank)!)위"
    movieNameLabel.text = movie!.title
    releaseLabel.text = movie!.releaseDate + " 개봉"
  }
  
  @objc private func addReviewButtonTapped() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    if let commentVC = storyboard.instantiateViewController(withIdentifier: "CommentVC") as? CommentViewController {
      
      commentVC.modalPresentationStyle = .fullScreen
      commentVC.modalTransitionStyle = .coverVertical
      
      present(commentVC, animated: true, completion: nil)
    }
  }
  
}
