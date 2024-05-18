//
//  MainTargetType.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/19/24.
//

import Foundation
import Moya

enum CreateQuizTypeTargetType {
    case postQuestionId(requestBody: CreateQuizModel)
    case createAnswer(requestBody: CreateAnswoerModel)
}

extension CreateQuizTypeTargetType: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Config.baseURL) else {
            preconditionFailure("유효하지 않는 base URL: \(Config.baseURL)")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .postQuestionId:
            return "/api/v1/question"
        case .createAnswer:
            return "/api/v1/answers"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postQuestionId:
            return .post
        case .createAnswer:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createAnswer(let body):
            return .requestJSONEncodable(body)
        case .postQuestionId(let body):
            return .requestJSONEncodable(body)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}


