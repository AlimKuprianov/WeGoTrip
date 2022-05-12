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
    
    func saveFeedBackRequest(idTrip: String,
                             tourRate: String,
                             guideRate: String,
                             informationRate: String,
                             navigationRate: String,
                             firstQuestion: String,
                             secondQuestion: String)
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
    
    func saveFeedBackRequest(idTrip: String,
                             tourRate: String,
                             guideRate: String,
                             informationRate: String,
                             navigationRate: String,
                             firstQuestion: String,
                             secondQuestion: String) {
        
        let urlComponents = URLComponents(string: ApiConstants.requstPath)
        
        let data = ["idTrip": idTrip,
                    "tourRate": tourRate,
                    "guideRate" : guideRate,
                    "informationRate" : informationRate,
                    "navigationRate" : navigationRate,
                    "firstQuestion": "\(firstQuestion)",
                    "secondQuestion": "\(secondQuestion)"] as [String : Any]
        
        guard let finalURL = urlComponents?.url else { return }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("text/html", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            guard let response = response, let data = data else { return }
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options:[])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    
    
    
}
