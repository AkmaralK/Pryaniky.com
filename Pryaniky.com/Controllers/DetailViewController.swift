//
//  DetailViewController.swift
//  Pryaniky.com
//
//  Created by Akmaral on 3/10/21.
//
import Kingfisher
import UIKit

final class DetailViewController: UIViewController {
 
 
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var idLabel: UILabel!
    @IBOutlet private var variantLabel: UILabel!
    var sampleModelDetail: DataResult?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sampleModelDetail = sampleModelDetail {
            if sampleModelDetail.name == "selector" {
            textLabel.text = "\(sampleModelDetail.data.selectedId ?? 0)"
            } else {
                textLabel.text = sampleModelDetail.data.text
            }
                let url = URL(string: sampleModelDetail.data.url ?? "")
        imageView.kf.setImage(with: url)
            
                sampleModelDetail.data.variants?.forEach({ (item) in
                variantLabel.text! += item.variantText
                variantLabel.text! += "\n"
                })
                sampleModelDetail.data.variants?.forEach({ (item) in
                idLabel.text! += "\(item.id)"
                idLabel.text! += "\n"
                })
            
        }
    }
   
}
