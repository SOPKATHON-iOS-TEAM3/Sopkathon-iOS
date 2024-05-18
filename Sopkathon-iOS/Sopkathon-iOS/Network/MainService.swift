//
//  MainService.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/19/24.
//

import Foundation

import Moya

final class MainService {
    static let shared = MainService()
    private var mainProvider = MoyaProvider<MainTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension MainService {
    func fetctMemberData(memberId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        mainProvider.request(.fetchMainData(memberId: memberId), completion: { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, memberDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        })
    }
    
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self) 애서 디코딩 오류가 발생했습니다")
            return .pathErr
        }
        
        return .success(decodedData as Any)
    }
}

