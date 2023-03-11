//
//  ResponseRepository.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/9/23.
//

import Foundation

protocol ResponseRepositoryProtocol {
    func fetchResponse(completion: @escaping (Result<[String], Error>) -> Void)
    func postCommand(command: [String], completion: @escaping (Result<[String], Error>) -> Void)
}

final class ResponseRepository: ResponseRepositoryProtocol {
    private let apiService: ResponseApiServiceProtocol

    init(apiService: ResponseApiServiceProtocol = ResponseApiService()){
        self.apiService = apiService
    }

    func fetchResponse(completion: @escaping (Result<[String], Error>) -> Void){
        apiService.fetchResponse(completion: completion)
    }
    
    func postCommand(command: [String], completion: @escaping (Result<[String], Error>) -> Void) {
        apiService.postCommand(command: command, completion: completion)
    }
}


