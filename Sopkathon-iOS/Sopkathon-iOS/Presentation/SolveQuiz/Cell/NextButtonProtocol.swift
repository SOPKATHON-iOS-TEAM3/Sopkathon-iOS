//
//  NextButtonProtocol.swift
//  Sopkathon-iOS
//
//  Created by 서은수 on 5/19/24.
//

import Foundation

/// cell의 다음 버튼 클릭 시 collectionview를 다음 페이지로 이동시키기 위함
protocol NextButtonProtocol: NSObject {
    func pagingToNextQuestion()
}
