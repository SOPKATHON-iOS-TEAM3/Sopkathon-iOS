//
//  SolveQuizTargetType.swift
//  Sopkathon-iOS
//
//  Created by 서은수 on 5/19/24.
//

import Foundation

import Moya

enum SolveQuizTargetType {
    case getQuizList(inviteCode: String)
    case postUserChoice(req: PostUserChoiceRequest)
}

extension SolveQuizTargetType: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Config.baseURL) else {
            preconditionFailure("유효하지 않는 base URL: \(Config.baseURL)")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .postUserChoice:
            return "/api/v1/user-choice"
        case .getQuizList:
            return "/api/v1/quiz"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postUserChoice:
            return .post
        case .getQuizList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postUserChoice(let req):
            return .requestJSONEncodable(req)
        case .getQuizList(inviteCode: let inviteCode):
            let parameters: [String: Any] = [
                "inviteCode": inviteCode
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}


