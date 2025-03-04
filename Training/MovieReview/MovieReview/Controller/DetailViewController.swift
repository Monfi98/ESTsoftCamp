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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    posterImageView.image = UIImage(named: movie!.imageName) ?? UIImage()
    posterImageView.contentMode = .scaleAspectFill
  }
  
}
