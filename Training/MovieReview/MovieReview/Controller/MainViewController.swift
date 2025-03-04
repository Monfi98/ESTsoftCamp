//
//  MainViewController.swift
//  MovieReview
//
//  Created by 신승재 on 3/1/25.
//

import UIKit

class MainViewController: UIViewController {
  
  private var movies: [Movie] = []
  
  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    self.movies = DataManager.shared.loadMovies()
    
  }
  
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let width = (collectionView.frame.width - 30) / 3
    return CGSize(width: width, height: width * 1.5)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath)
    
    cell.contentView.subviews.forEach { $0.removeFromSuperview() }
    
    let imageView = UIImageView()
    let width = (collectionView.frame.width - 30) / 3
    imageView.image = UIImage(named: movies[indexPath.row].imageName) ?? UIImage()
    imageView.frame.size = CGSize(width: width, height: width * 1.5)
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 5
    imageView.clipsToBounds = true
    
    cell.contentView.addSubview(imageView)
    
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
      detailVC.movie = movies[indexPath.row]
      navigationController?.pushViewController(detailVC, animated: true)
    }
      
  }
}
