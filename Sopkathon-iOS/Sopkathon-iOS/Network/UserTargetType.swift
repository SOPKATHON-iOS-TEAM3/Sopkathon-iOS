//
//  UserTargetType.swift
//  Sopkathon-iOS
//
//  Created by 김민서 on 5/19/24.
//


import Foundation
import Moya

enum UserTargetType {
    case signUp(request: SignUpMemberRequestModel)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/api/v1/member"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signUp:
            return ["Content-Type": "application/json"]
        }
    }
}
