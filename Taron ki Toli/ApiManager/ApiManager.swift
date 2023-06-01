//
//  ApiManager.swift
//  Taron ki Toli
//
//  Created by Saifur Rahman on 14/06/22.
//



import Foundation
import UIKit
import Alamofire
let bASEURL = "https://todo.studylms.in/tkt/api/"

let LOGINURL = "login"

let SIGN_UP_URL = "studentRegisterAPI"

 let OTP_SEND = "registerSentOtp"

let OTP_MATCH = "forgotPassword_OTP_Match"

let GET_AVATARS = "getavtars"

let SET_AVATAR = "avtar_user"

let WEEKLY_TARGET = "weeklyTarget"

let FORGOT_PASSWORD = "forgotPassword"

let RESET_PASSWORD = "resetPassword"

let RESET_USERNAME = "resetUsername"

let ADD_TOTAL_STARS = "addtotalStars"

let GET_USER = "get_user"

let AVATAR_BY_USER = "getAvtarByUser"

let KARO_FETCH = "karoFetchAllActivity"


class ApiManager  {
     static let shared = ApiManager()
     private init()  {
       }

    typealias JSONTaskCompletionHandler = (Any)
    typealias isSuccess = (Bool)
    typealias data = (Data)

    //MARK: POST Method
    func postRequestForParameters<T>( url:String, params:Dictionary<String,Any>,header : [String:String]? = nil, model : T.Type , completion: @escaping(JSONTaskCompletionHandler,data?,isSuccess)-> () )where T: Decodable{
        if !Reachability.isConnectedToNetwork(){
            let dat : Dictionary<String,Any> = ["success": 0,"error":"Please connect to a proper internet connection"]
            completion(dat,nil ,false)
            return
        }
        var header1 : HTTPHeaders! = nil
        if let _ = header{
            header1 = HTTPHeaders(header!)
        }else{
            header1 = nil
        }

        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header1).responseJSON { [weak self]
               response in

              switch response.result {
              case .success (let JSON):
                print(response.result)

                 let data = JSON as? Dictionary<String,Any>
                if data == nil{
                    completion(data ?? "",nil,false)
                }else{
                    if let _ = response.data{
                        let jsonDecoder = JSONDecoder()
                        if let empData = try? jsonDecoder.decode(model.self, from: response.data!){
                            completion(empData,response.data,true)
                        }else{
                            completion(data ?? "",nil,false)
                        }
                    }
                }

                break
              case .failure(let error):
                completion(error,nil ,false)
                break
              }
           }
    }

    func putRequestForParameters( url:String, params:Dictionary<String,Any>,header : [String:String]? = nil, completion: @escaping(JSONTaskCompletionHandler,data?,isSuccess)-> () ){
        if !Reachability.isConnectedToNetwork(){
            let dat : Dictionary<String,Any> = ["success": 0,"error":"Please connect to a proper internet connection"]
            completion(dat,nil ,false)
            return
        }
        var header1 : HTTPHeaders! = nil
        if let _ = header{
            header1 = HTTPHeaders(header!)
        }else{
            header1 = nil
        }

        AF.request(url, method: .put, parameters: params, encoding: JSONEncoding.default, headers: header1).responseJSON { [weak self]
               response in

              switch response.result {
              case .success (let JSON):
                print(response.result)

                 let data = JSON as? Dictionary<String,Any>
                if data == nil{
                    completion(data ?? "",nil,false)
                }else{
                    completion(data ?? "",response.data,true)
                }

                break
              case .failure(let error):
                completion(error,nil ,false)
                break
              }
           }
    }


    func delRequestForParameters( url:String, params:Dictionary<String,Any>,header : [String:String]? = nil, completion: @escaping(JSONTaskCompletionHandler,data?,isSuccess)-> () ){
        if !Reachability.isConnectedToNetwork(){
            let dat : Dictionary<String,Any> = ["success": 0,"error":"Please connect to a proper internet connection"]
            completion(dat,nil ,false)
            return
        }
        var header1 : HTTPHeaders! = nil
        if let _ = header{
            header1 = HTTPHeaders(header!)
        }else{
            header1 = nil
        }

        AF.request(url, method: .delete, parameters: params, encoding: JSONEncoding.default, headers: header1).responseJSON { [weak self]
               response in

              switch response.result {
              case .success (let JSON):
                print(response.result)

                 let data = JSON as? Dictionary<String,Any>
                if data == nil{
                    completion(data ?? "",nil,false)
                }else{
                    completion(data ?? "",response.data,true)
                }

                break
              case .failure(let error):
                completion(error,nil ,false)
                break
              }
           }
    }
    //MARK: POST Method
//    func getRequestForParameters(url:String , completion: @escaping(JSONTaskCompletionHandler,data?,isSuccess)-> () ){
//        let req = AF.request(url)
//        let img = UIImage()
//        print(req.data)
//
//        req.responseJSON { (response) in
//
//               switch response.result {
//               case .success (let JSON):
//                 print(response.result)
//
//                  let data = JSON as? Dictionary<String,Any>
//                if data == nil{
//                    completion(data ?? "",nil,false)
//                }else{
//                                               completion(data,response.data,true)
//
//                    }
//                }
//
//                 break
//               case .failure(let error):
//                 completion(error, false)
//                 break
//               }
//        }

//        AF.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { [weak self]
//               response in
//
//              switch response.result {
//              case .success (let JSON):
//                print(response.result)
//
//                 let data = JSON as? Dictionary<String,Any>
//                if data == nil{
//                    completion(data ?? "",false)
//                }else{
//                    completion(data ?? "",true)
//                }
//
//                break
//              case .failure(let error):
//                completion(error, false)
//                break
//              }
//           }
  //  }

    func postRequestWithHeader<T>(url:String,header : [String:String]? = nil, model : T.Type  , completion: @escaping(JSONTaskCompletionHandler,data?,isSuccess)-> () )where T: Decodable {
        var header1 : HTTPHeaders? = nil
        if let _ = header{
            header1 = HTTPHeaders(header!)
        }else{
            header1 = nil
        }

        AF.request(url, method: .post ,   encoding: JSONEncoding.default, headers: header1).responseJSON { [weak self]
               response in


              switch response.result {
              case .success (let JSON):
                print(response.result)

                 let data = JSON as? Dictionary<String,Any>
                if data == nil{
                    completion(data ?? "",nil,false)
                }else{
                    if let _ = response.data{
                        let jsonDecoder = JSONDecoder()
                        if let empData = try? jsonDecoder.decode(model.self, from: response.data!){
                            completion(empData,response.data,true)
                        }else{
                            completion(data ?? "",nil,false)
                        }
                    }
                }

                break
              case .failure(let error):
                completion(error,nil ,false)
                break
              }
           }
    }
    func getRequestWithHeader<T>(url:String,model : T.Type ,header : [String:String]? = nil, completion: @escaping(JSONTaskCompletionHandler,data?,isSuccess)-> () )where T: Decodable {
        var header1 : HTTPHeaders? = nil
        if let _ = header{
            header1 = HTTPHeaders(header!)
        }else{
            header1 = nil
        }

        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header1).responseJSON { [weak self]
               response in

              switch response.result {
              case .success (let JSON):
                print(response.result)

                 let data = JSON as? Dictionary<String,Any>
                if data == nil{
                    completion(data ?? "",nil,false)
                }else{
                    if let _ = response.data{
                        let jsonDecoder = JSONDecoder()
                        if let empData = try? jsonDecoder.decode(model.self, from: response.data!){
                            completion(empData,response.data,true)
                        }else{
                            completion(data ?? "",nil,false)
                        }
                    }
                }

                break
              case .failure(let error):
                completion(error,nil ,false)
                break
              }
           }
    }
    func upload(image: String, url: String, params: Dictionary<String, Any>,image_string:String,fileName:String, completion: @escaping(JSONTaskCompletionHandler,isSuccess)-> ()) {

        var request = URLRequest(url: URL(string: url)!)
        var headers = HTTPHeaders()
        for (key, value) in params {
            headers[key] = value as? String
        }
        request.httpMethod = "POST"
        AF.upload(multipartFormData: { (multiPart) in
//            for (key, value) in params {
//                if let temp = value as? String {
//                    multiPart.append(temp.data(using: .utf8)!, withName: key)
//                }
//                if let temp = value as? Int {
//                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
//                }
//                if let temp = value as? NSArray {
//                    temp.forEach({ element in
//                        let keyObj = key + "[]"
//                        if let string = element as? String {
//                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
//                        } else
//                            if let num = element as? Int {
//                                let value = "\(num)"
//                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
//                        }
//                    })
//                }
//            }
            multiPart.append(image.data(using: .utf8)!, withName: "img_src")
            multiPart.append(Data(image.utf8), withName: "img_src", fileName: image_string, mimeType: "image/png")
           // multiPart.append(image, withName: "img_src", fileName: "file.png", mimeType: "image/jpeg")
           // multiPart.append(image, withName: "img_src", fileName: "file.png", mimeType: "image/jpeg")
        }, to: url as URLConvertible, method: .put, headers: headers).uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
        })
            .responseString(completionHandler: { data in
                //Do what ever you want to do with response
                switch data.result {
                case .success (let JSON):
                    print(data.result)
                    let data = JSON as? Any
                    completion(data ?? "",true)
                    break
                case .failure(let error):
                    completion(error, false)
                    print(error)
                    break
                }
            })
        //        AF.upload(multipartFormData: { multiPart in
        //            for (key, value) in params {
        //                if let temp = value as? String {
        //                    multiPart.append(temp.data(using: .utf8)!, withName: key)
        //                }
        //                if let temp = value as? Int {
        //                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
        //                }
        //                if let temp = value as? NSArray {
        //                    temp.forEach({ element in
        //                        let keyObj = key + "[]"
        //                        if let string = element as? String {
        //                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
        //                        } else
        //                            if let num = element as? Int {
        //                                let value = "\(num)"
        //                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
        //                        }
        //                    })
        //                }
        //            }
        //
        //
        //            multiPart.append(image, withName: "file", fileName: "file.png", mimeType: "image/png")
        //        }, with: url as URLConvertible)
        //            .uploadProgress(queue: .main, closure: { progress in
        //                //Current upload progress of file
        //                print("Upload Progress: \(progress.fractionCompleted)")
        //            })
        //            .responseJSON(completionHandler: { data in
        //                //Do what ever you want to do with response
        //                switch data.result {
        //                             case .success (let JSON):
        //                               print(data.result)
        //                                let data = JSON as? Dictionary<String,Any>
        //                                   completion(data ?? "",true)
        //                               break
        //                             case .failure(let error):
        //                               completion(error, false)
        //                               break
        //                             }
        //            })
    }

    func uploadMultimediaData(image: Data, url: String, params: Dictionary<String, Any>,image_string:String,fileName:String,completion: @escaping(JSONTaskCompletionHandler,isSuccess)-> ()) {
        let Surl = URL(string: url)
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in params {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            multiPart.append(image, withName: image_string, fileName: fileName, mimeType: "image/png")
        },  to: Surl!,
               method: .post,
               headers: nil)
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
                print("Upload Progress: \(progress.fractionCompleted)")
            })
            .responseJSON(completionHandler: { data in
                switch data.result {
                case .success (let JSON):
                    print(data.result)
                    let data1 = JSON as? Dictionary<String,Any>
                    completion(data1 ?? "",true)
                    break
                case .failure(let error):
                    completion(error, false)
                    break
                }

            })
    }
}

