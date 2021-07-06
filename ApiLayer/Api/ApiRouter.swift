import Foundation
import Alamofire


enum ApiRouter: URLRequestConvertible {
    case getPosts(userId: Int)
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
               
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    private var method: HTTPMethod {
       switch self {
       case .getPosts:
           return .get
       }
    }
    
    private var path: String {
        switch self {
        case .getPosts:
            return "posts"
        }
    }
    
    private var parameters: Parameters? {
       switch self {
       case .getPosts(let userId):
           return [Constants.Parameters.userId : userId]
       }
   }
}

