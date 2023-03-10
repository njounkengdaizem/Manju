//
//  ManjuViewModel.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/9/23.
//

import Foundation

final class ManjuViewModel: ObservableObject{
    
    @Published var response = ["Hardcoded test here"]
    
    private let repository: ResponseRepositoryProtocol
    
    init (repository: ResponseRepositoryProtocol = ResponseRepository()){
        self.repository = repository
    }
    
    func fetchResponse(completion: @escaping () -> Void) {
        repository.fetchResponse { result in
            switch result {
            case .success(let manjuResponse):
                self.response = manjuResponse
                print(manjuResponse)
            case .failure(let error):
                print("Error fetching response: \(error.localizedDescription)")
            }
            
            completion()
        }
    }
}
