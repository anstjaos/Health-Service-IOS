import UIKit

struct ResponseHeader: Codable {
    let success: Bool
    let result: String
    let message: String
}

func requestGet(url: String, completionHandler: @escaping (Bool, Any) -> Void) {
    
}

func requestPost(url: String, method: String, param: [String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
    
}

func request(_ url: String, _ method: String, _ param: [String: Any]? = nil, completionHandler: @escaping (Bool, Any) -> Void) {
    if method == "GET" {
        requestGet(url: url) { (success, data) in
            completionHandler(success, data)
        }
    } else {
        requestPost(url: url, method: method, param: param!) { (success, data) in
            completionHandler(success, data)
        }
    }
}
