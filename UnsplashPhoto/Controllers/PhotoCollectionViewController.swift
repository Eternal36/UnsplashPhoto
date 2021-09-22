//
//  PhotoCollectionViewController.swift
//  UnsplashPhoto
//
//  Created by Дмитрий Бельков on 21.09.2021.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    var searchText: String? = ""
    let networkService = NetworkService()
    var searchPhotos: Results? = nil
    
    private var photos = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let text = searchText else { return }
        self.networkService.fetchPhotos(query: text)
        self.networkService.onCompletion = { results in
            self.searchPhotos = results
            self.collectionView.reloadData()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchPhotos?.results.count ?? 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.backgroundColor = .red
        let urlImage = searchPhotos?.results[indexPath.row].urls.regular
        if urlImage != nil {
            cell.photoView.downloadImage(from: URL(string: urlImage!)!)
        }
        return cell
    }

}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
