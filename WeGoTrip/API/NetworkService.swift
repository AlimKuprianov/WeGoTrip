//
//  ApiManager.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 12.05.2022.
//

import UIKit


protocol NetworkServiceProtocol {
    
    func fetchImage(at url: URL,
                    completion: @escaping (UIImage?) -> (Void))
    
    func saveFeedBackRequest(
                             tourRate: Int,
                             guideRate: Int,
                             informationRate: Int,
                             navigationRate: Int,
                             firstQuestion: String,
                             secondQuestion: String,
                             completion: @escaping ((Error?) -> Void))
}

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    init() {}
    
    func fetchImage(at url: URL,
                    completion: @escaping (UIImage?) -> (Void)) {
        
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let image = UIImage(data: data)
                completion(image)
            }
        }
        task.resume()
    }
    
    func saveFeedBackRequest(
                             tourRate: Int,
                             guideRate: Int,
                             informationRate: Int,
                             navigationRate: Int,
                             firstQuestion: String,
                             secondQuestion: String,
                             completion: @escaping ((Error?) -> Void)) {
        
        guard  let url = URL(string: "https://webhook.site/71827f63-784b-48e1-bad3-b1ecb9ed6371") else { return }
        
        let data = [
                    "tourRate": tourRate,
                    "guideRate" : guideRate,
                    "informationRate" : informationRate,
                    "navigationRate" : navigationRate,
                    "firstQuestion": "\(firstQuestion)",
                    "secondQuestion": "\(secondQuestion)"] as [String : Any]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("text/html", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            guard let response = response, let data = data else {return}
            
            completion(error)
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options:[.allowFragments])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}
