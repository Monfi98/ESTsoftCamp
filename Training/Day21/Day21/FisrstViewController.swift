//
//  ViewController.swift
//  Day21
//
//  Created by 신승재 on 2/26/25.
//

import UIKit

class FisrstViewController: UIViewController {
  @IBOutlet weak var label1: UILabel!
  @IBOutlet weak var label2: UILabel!
  @IBOutlet weak var label3: UILabel!
  @IBOutlet weak var label4: UILabel!
  @IBOutlet weak var label5: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad - 뷰가 메모리에 로드되었습니다.")
    
    label1.text = "viewDidLoad - 뷰가 메모리에 로드되었습니다."
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear - 뷰가 화면에 나타나기 직전입니다.")
    
    label2.text = "viewWillAppear - 뷰가 화면에 나타나기 직전입니다."
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear - 뷰가 화면에 완전히 나타났습니다.")
    
    label3.text = "viewDidAppear - 뷰가 화면에 완전히 나타났습니다."
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("viewWillDisappear - 뷰가 화면에서 사라지기 직전입니다.")
    
    label4.text = "viewWillDisappear - 뷰가 화면에서 사라지기 직전입니다."
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("viewDidDisappear - 뷰가 화면에서 완전히 사라졌습니다.")
    
    label5.text = "viewDidDisappear - 뷰가 화면에서 완전히 사라졌습니다."
  }
}

