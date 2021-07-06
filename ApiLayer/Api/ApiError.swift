enum ApiError: Error {
    case forbidden                  //403
    case notFound                   //404
    case conflict                   //409
    case internalServerError        //500
}
