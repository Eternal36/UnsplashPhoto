//
//  ViewController.swift
//  UnsplashPhoto
//
//  Created by Дмитрий Бельков on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var seachField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchPressed(_ sender: Any) {
        let dest = storyboard?.instantiateViewController(identifier: "PhotoCollectionViewController") as! PhotoCollectionViewController
        guard let seatchText = seachField.text else { return }
        dest.searchText = seatchText
        navigationController?.pushViewController(dest, animated: true)
    }
    
}

