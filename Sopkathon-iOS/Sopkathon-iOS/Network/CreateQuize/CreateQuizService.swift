//
//  MainService.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/19/24.
//

import Foundation

import Moya

final class CreateQuizService {
    static let shared = CreateQuizService()
    private var createQuizProvider = MoyaProvider<CreateQuizTypeTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension CreateQuizService {
    func posetCreateFirstQuiz(body: CreateQuizReqeustBody, completion: @escaping (NetworkResult<Any>) -> Void) {
        createQuizProvider.request(.postQuiz(request: body), completion: { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, CreateQuizResponseDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        })
    }
    
    func postCreateQuiz(body: CreateQuizModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        createQuizProvider.request(.postQuestionId(requestBody: body), completion: { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, CreateQuizResponseDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        })
    }
    
    func postCreateAnswer(body: CreateAnswoerModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        createQuizProvider.request(.createAnswer(requestBody: body), completion: { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, CreateQuizResponseDTO.self)
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

