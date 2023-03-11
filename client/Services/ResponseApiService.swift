//
//  Data.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/5/23.
//
import Foundation
import UIKit


protocol ResponseApiServiceProtocol {
    func fetchResponse(completion: @escaping (Result<[String], Error>) -> Void)
    func postCommand(command: String, completion: @escaping (Result<String, Error>) -> Void)
}

final class ResponseApiService: ResponseApiServiceProtocol {
    
    func fetchResponse(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: "http://localhost:5500/getRequest") else {
            completion(.failure(NSError(domain: "ResponseApiService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "ResponseApiService", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let response = try decoder.decode(Response.self, from: data)
                completion(.success(response.response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func postCommand(command: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:5500/postRequest") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = command.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data, let string = String(data: data, encoding: .utf8) {
                completion(.success(string))
            } else {
                completion(.failure(NSError(domain: "No data returned from server", code: 0, userInfo: nil)))
            }
        }
        
        task.resume()
    }

    }
    
