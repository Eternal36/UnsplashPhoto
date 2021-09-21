//
//  NetworkService.swift
//  UnsplashPhoto
//
//  Created by Дмитрий Бельков on 21.09.2021.
//

import Foundation

class NetworkService {
    
    let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=office&client_id=5ErtZEx8r2_ib0rTo09PdgahhtSpSvT50m36bXb-_Rw"
    var onCompletion: ((Result) -> Void)?
    
    func fetchPhotos() {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    print("Some error")
                    return
                }
                guard let data = data else {
                    print("No data")
                    return
                }
                guard let results = self.parseJSON(withData: data) else {
                    print("adasdada")
                    return
                    
                }
                self.onCompletion?(results)
                return
            }
        }
        task.resume()
    }
            
            
            
    
    
    
    func parseJSON(withData data: Data) -> Result? {
        let decoder = JSONDecoder()
        do {
            let results = try decoder.decode(Result.self, from: data)
            return results
        } catch let error as NSError {
            print("Failed to decode JSON", error.localizedDescription)
        }
        return nil
    }
    
    
}
