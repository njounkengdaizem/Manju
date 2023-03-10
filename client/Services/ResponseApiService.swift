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
//
//    func fetchResponse(completion: (Response) -> Void) {
//        completion(.init(response: [ "Test data here"]))
//    }
}


class Api{

    func getPosts(completion: @escaping ([String])-> ()) {
           guard let url = URL(string: "http://localhost:5500/getRequest") else {
               return
           }
           URLSession.shared.dataTask(with: url) {(data, _, _) in
               guard let data = data else {
                   print("Error: Data is nil")
                   return
               }
               let decoder = JSONDecoder()
               decoder.keyDecodingStrategy = .convertFromSnakeCase
               do {
                   let response = try decoder.decode(Response.self, from: data)
                   let answer = response.response
                   print(answer)
                   DispatchQueue.main.async {
                       completion(answer)
                   }
               } catch {
                   print("Error decoding JSON: \(error.localizedDescription)")
               }
           }
           .resume()
    }

//    func postAudio(audioPath: String) {
//        guard let audioData = try? Data(contentsOf: URL(fileURLWithPath: audioPath)) else {
//            print("Error reading audio file")
//            return
//        }
//        let parameter = ["path": audioPath]
//        guard let url = URL(string: "http://localhost:5500/postRequest") else{
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        let body = ["audio_data": audioData.base64EncodedString()]
//        request.httpBody = try! JSONSerialization.data(withJSONObject: body, options: [])
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error uploading audio file: \(error.localizedDescription)")
//                return
//            }
//            if let data = data, let response = response as? HTTPURLResponse {
//                if response.statusCode == 200 {
//                    print("Audio file uploaded successfully!")
//                } else {
//                    print("Error uploading audio file: HTTP \(response.statusCode)")
//                }
//            }
//        }.resume()
//    }
}
