//
//  MainTargetType.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/19/24.
//

import Foundation
import Moya

enum MainTargetType {
    case fetchMainData(memberId: Int)
}

extension MainTargetType: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Config.baseURL) else {
            preconditionFailure("유효하지 않는 base URL: \(Config.baseURL)")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchMainData:
            return "/api/v1/main"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchMainData:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchMainData(let memberId):
            let parameters: [String: Any] = [
                "memberId": memberId
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}


