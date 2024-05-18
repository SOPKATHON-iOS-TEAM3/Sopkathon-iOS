// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CreateAnswoerModel: Codable {
    let questionID: Int
    let answers: [Answer]

    enum CodingKeys: String, CodingKey {
        case questionID = "questionId"
        case answers
    }
}

// MARK: - Answer
struct Answer: Codable {
    let answerText: String
    let isCorrect: Bool
}
