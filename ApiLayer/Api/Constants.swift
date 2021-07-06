struct Constants {
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    
    struct Parameters {
        static let userId = "userId"
    }
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}
