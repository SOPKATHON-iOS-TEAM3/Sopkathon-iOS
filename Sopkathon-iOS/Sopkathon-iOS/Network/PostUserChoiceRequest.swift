//
//  PostUserChoiceRequest.swift
//  Sopkathon-iOS
//
//  Created by 서은수 on 5/19/24.
//

import Foundation

struct PostUserChoiceRequest: Codable {
    var memberId: Int
    var questionId: Int
    var answerId: Int
}
