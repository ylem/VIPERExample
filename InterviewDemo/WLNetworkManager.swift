//
//  WLNetworkManager.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

class WLNetworkManager {

    static let shared                         = WLNetworkManager()

    typealias NetworkCompletionBlock          = (_ succeed: Bool, _ responseObject: Data?) -> Void

    let kRequestTimeOut:TimeInterval          = 120
    private var session: URLSession           = URLSession(configuration: URLSessionConfiguration.default)
    private var currentReqeustNames: [String] = []
    private var tasks: [URLSessionTask]       = []

    /**
     * Generate a URLRequest struct
     *
     * @param url           NSURL object
     * @param method        GET, POST, PUT or DELETE
     * @return URLRequest   object, can be modify (add more values) later.
     */
    private func request(url: URL, method: String) -> URLRequest {
        var request: URLRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: kRequestTimeOut)
        request.httpMethod      = method
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        return request
    }

    private func isSucceed(response: URLResponse?, error: Error?) -> Bool {
        if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
            return error == nil
        }

        debugPrint("\((response as! HTTPURLResponse).statusCode) - \((response?.url?.absoluteString)!)")
        return false
    }

    private func convertToData(parameters: Any) -> Data? {
        if let params = parameters as? Dictionary<String, String> {

            let result = params.flatMap { (keyValue) -> String? in
                let key   = keyValue.key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                let value = keyValue.value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

                if let key = key, let value = value {
                    return "\(key)=\(value)"
                } else {
                    return nil
                }
            }.joined(separator: "&")

            return result.data(using: .utf8)
        }

        return nil
    }

    /**
     * Cancel Request by URL if it is running.
     *
     * @param urlString canceling url.
     */
    func cancelRequest(urlString: String) {
        let task = tasks.first { (task) -> Bool in
            return task.originalRequest?.url?.absoluteString == urlString
        }

        guard let foundTask = task else {
            return
        }

        if foundTask.state == .running {
            foundTask.cancel()
        }
    }

    /**
     * GET request
     *
     * @param urlString     canceling url.
     * @param completion    callback function with succeed status and resoponse data.
     */
    func GET(urlString: String, completion: NetworkCompletionBlock?) {
        guard let url = URL(string: urlString) else {
            assert(false, "GET - url format wrong!!!")
            return
        }

        let request = self.request(url: url, method: "GET")
        let task    = session.dataTask(with: request) { (data, response, error) in
            let succeed = self.isSucceed(response: response, error: error)
            if let completion = completion {
                DispatchQueue.main.async {
                    completion(succeed, data)
                }
            }
        }

        task.resume()
        tasks.append(task)
    }

    func POST(urlString: String, parameters: JSON?, completion: NetworkCompletionBlock?) {
        self.Upload(urlString: urlString, parameters: parameters, method: "POST", completion: completion)
    }

    func PUT(urlString: String, parameters: JSON?, completion: NetworkCompletionBlock?) {
        self.Upload(urlString: urlString, parameters: parameters, method: "PUT", completion: completion)
    }

    /**
     * POST or PUT request
     *
     * @param urlString     canceling url.
     * @param parameters    JSON format parameters only
     * @param method        POST or PUT
     * @param completion    callback function with succeed status and resoponse data.
     */
    private func Upload(urlString: String, parameters: JSON?, method:String, completion: NetworkCompletionBlock?) {
        guard let url = URL(string: urlString) else {
            assert(false, "POST - url format wrong!!!")
            return
        }

        // generate parameters' data - e.g. key=value&key2=value2
        let request = self.request(url: url, method: method)
        var taskData: Data?
        if let params = parameters {
            guard let data = convertToData(parameters: params) else {
                assert(false, "Upload - convert parameters error")
                return
            }

            taskData = data
        }

        // request task
        let task = session.uploadTask(with: request, from: taskData) { (data, response, error) in
            let succeed = self.isSucceed(response: response, error: error)

            if let completion = completion {
                DispatchQueue.main.async {
                    completion(succeed, data)
                }
            }
        }

        task.resume()
        tasks.append(task)
    }

}
