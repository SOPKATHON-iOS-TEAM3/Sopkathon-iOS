import Foundation

struct CreateQuizViewDataModel: Hashable {
    var item: [CreateQuizViewDataItem]
}
struct CreateQuizViewDataItem: Hashable {
    let identifier: UUID = .init()
    var order: Int
    var title: String
    var subTitle: String
    var quizQuestionList: QuizQuestion
    var quizCorrectAnswerList: QuizQuestion
    var quizInCorrectAnswerList: QuizQuestion
    
}

struct QuizQuestion: Hashable {
    let placeHolder: String
    var data: String
}
