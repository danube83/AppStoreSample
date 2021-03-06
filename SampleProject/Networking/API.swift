//
//  API.swift
//  SampleProject
//
//  Created by danube83 on 2017. 1. 31..
//  Copyright © 2017년 danube83. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

fileprivate struct Host {
    static let baseURL = "https://itunes.apple.com"
    static func apiURL(by path: String) -> String {
        return baseURL + path
    }
}


struct API<Model: Mappable> {
    let path: String
    let query: [String: Any]?
    let arrayParse: ((Any) -> [Model]?)?
    let objectParse: ((Any) -> Model?)?
    var request: DataRequest {
        return Alamofire.request(Host.apiURL(by: path), parameters: query)
    }
    
    init(path: String, query: [String: Any]? = nil, arrayParse: ((Any) -> [Model]?)? = nil, objectParse: ((Any) -> Model?)? = nil) {
        self.path = path
        self.query = query
        self.arrayParse = arrayParse
        self.objectParse = objectParse
    }
}


func send<T: Mappable>(api: API<T>, keyPath: String? = nil, arrayCallback: @escaping ([T]?)->()) {
    api.request.responseArray(keyPath: keyPath) { (response: DataResponse<[T]>) in
        guard let unwrappedResponse = response.result.value else {
            arrayCallback(nil)
            return
        }
        if let parse = api.arrayParse {
            let parsedResponse = parse(unwrappedResponse)
            arrayCallback(parsedResponse)
        }
        
    }
}

func send<T: Mappable>(api: API<T>, keyPath: String? = nil, objectCallback: @escaping (T?)->()) {
    api.request.responseArray(keyPath: keyPath) { (response: DataResponse<[T]>) in
        guard let unwrappedResponse = response.result.value else {
            objectCallback(nil)
            return
        }
        if let parse = api.objectParse {
            let parsedResponse = parse(unwrappedResponse)
            objectCallback(parsedResponse)
        }
        
    }
}


func topFreeApplicationAPI() -> API<TopFreeApplicationModel> {
    let path = String(format: ApiPaths.topFreeApplications, arguments: [/*NSLocale.current.languageCode ??*/ "kr", 6015])
    return API(path: path, arrayParse: {(response) -> [TopFreeApplicationModel]? in
        
        guard let convertedResponse = response as? [TopFreeApplicationModel] else {
            return nil
        }
        
        return convertedResponse
    })
}

func applicationDetailAPI(with identifier: String) -> API<ApplicationDetailModel> {
    return API(path: ApiPaths.applicationDetail, query: ["id": identifier, "country": /*NSLocale.current.languageCode ??*/ "kr"]) { (response) -> ApplicationDetailModel? in
        
        guard let convertedResponse = response as? [ApplicationDetailModel] else {
            return nil;
        }
        
        return convertedResponse.first
    }
}
