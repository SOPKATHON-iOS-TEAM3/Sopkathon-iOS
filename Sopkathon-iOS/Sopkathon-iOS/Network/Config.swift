//
//  Config.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/18/24.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("⭐️⭐️ plist 찾을수 없다 !!! ⭐️⭐️")
        }
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("⭐️⭐️ baseURL 이슈 ⭐️⭐️")
        }
        
        return key
    }()
}

