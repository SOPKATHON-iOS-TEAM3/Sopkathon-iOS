//
//  GetQuizListResponse.swift
//  Sopkathon-iOS
//
//  Created by 서은수 on 5/19/24.
//

import Foundation

struct GetQuizListResponse: Codable {
    let questions: [Question]
    let answers: [Answer]
}

struct Question: Codable {
    var questionId: Int
    var questionText: String
}

struct Answer: Codable {
    var answerId: Int
    var questionId: Int
    var answerText: String
}
