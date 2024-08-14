import Foundation
import AWSLambdaRuntime
import AWSLambdaEvents

struct RequestBody: Decodable {
    let name: String
}

@main
struct MyLambda: SimpleLambdaHandler {
    func handle(
        _ event: APIGatewayV2Request,
        context: AWSLambdaRuntimeCore.LambdaContext
    ) async throws -> APIGatewayV2Response {
        guard let data = event.body?.data(using: .utf8),
              let body = try? JSONDecoder().decode(RequestBody.self, from: data) else {
            context.logger.error("Could not decode data for: \(event.body)")
            return .init(statusCode: .badRequest)
        }
        
        context.logger.info("Received request for name: \(body.name)")
        return .init(statusCode: .ok, body: "Your name is: \(body.name)")
    }
}
