// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CreateQuizModel: Codable {
    let quizID: Int
    let questionText: String

    enum CodingKeys: String, CodingKey {
        case quizID = "quizId"
        case questionText
    }
}

