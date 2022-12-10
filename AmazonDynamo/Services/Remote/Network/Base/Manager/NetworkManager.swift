//
//  NetworkManager.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation
import Moya
import Combine

class NetworkManager<Target: TargetType>: NetworkManagable {
    
    typealias Provider = MoyaProvider<Target>
    
    // MARK: - Properties
    
    private let provider: Provider
    
    // MARK: - Init
    
    init(type: NetworkServiceType = .live) {
        let serviceType = type == .live ? Provider.neverStub : Provider.immediatelyStub
        var plugin: [PluginType] = []
#if DEBUG
        let formatter = NetworkLoggerPlugin.Configuration.Formatter(responseData: { data in
            data.prettyPrintedJSONString ?? "## Cannot map data to String ##"
        })
        let loggerConfig = NetworkLoggerPlugin.Configuration(formatter: formatter, logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        plugin.append(networkLogger)
#endif
        provider = Provider(stubClosure: serviceType, plugins: plugin)
    }
    
    // MARK: - Methods
    
    func request<D: Decodable>(_ target: Target) -> AnyPublisher<D, Error> {
        printForDebug("🤩 Network Call: \(Target.self), \(target.path)")
        return provider.requestPublisher(target)
            .tryMap { response in
                guard 200...299 ~= response.statusCode else {
                    throw NetworkError(code: response.statusCode) ?? .unkown
                }
                return response.data
            }
            .decode(type: D.self, decoder: JSONDecoder())
            .mapError { error in
                printForDebug("🤯 Network Call Failure For \(Target.self) \nError: \(error)")
                return error
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func debug(request: URLRequest, response: Data?) {
        let jsonResponse = response?.prettyPrintedJSONString ?? ""
        printForDebug("""
"================================================================================"
Response \(request)\n\(jsonResponse)
"================================================================================"
""")
    }
}
