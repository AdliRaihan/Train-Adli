//
//  ProfileModels.swift
//  Training-Adli
//
//  Created by Adli Raihan on 02/10/19.
//  Copyright (c) 2019 Adli Raihan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SwiftyUserDefaults
import ObjectMapper

enum Profile
{
    // completion
    enum completion {
        case success (response : Profile.privateProfile.response)
        case failed (message : String)
    }
    
    // other people profile
    enum publicProfile {
        
        struct viewModel {
            
            struct request {
                var username : String = ""
            }
            
            struct response {
                
            }
            
        }
        
        
        enum completion {
//            case success (response : Profile.publicProfile.response)
            case failed (message : String)
        }
        static func createParams (json : request) -> [String:Any] {
            return json.toJSON()
        }
        
        class request : Mappable {
            
            var username : String = ""
            
            init() {
            }
            required init?(map: Map) {
            }
            
            func mapping(map: Map) {
                username <- map["username"]
            }
            
        }
        
        
        struct response : Mappable {
            var id : String = ""
            var allowMessages : Int = 0
            var badge : String = ""
            var bio : String = ""
            var name : String = ""
            var firstName : String = ""
            var lastName : String = ""
            var followedByUser : Int = 0
            var followersCount : Int = 0
            var followingCount : Int = 0
            
            /// Response Photos
            var photos : [responsePhotos] = []
            
            struct responsePhotos : Mappable {
                var _createdAt : String = ""
                var _id : String = ""
                var _updatedAt : String = ""
                var _urls : urls = urls()
                
                init() {}
                init?(map: Map) {}
                mutating func mapping(map: Map) {
                    _createdAt <- map["created_at"]
                    _id <- map["id"]
                    _updatedAt <- map["updated_at"]
                    _urls <- map["urls"]
                }
                
                struct urls : Mappable {
                    var __full : String = ""
                    var __raw : String = ""
                    var __regular : String = ""
                    var __small : String = ""
                    var __thumb : String = ""
                    
                    init() {}
                    init?(map: Map) {}
                    mutating func mapping(map: Map) {
                        __full <- map["full"]
                        __raw <- map["raw"]
                        __regular <- map["regular"]
                        __thumb <- map["thumb"]
                    }
                }
            }
            
            /// End of Struct Resposne Photos
            var photoProfile : responsePhotoProfile = responsePhotoProfile()
            
            /// Response Photo Profile
            struct responsePhotoProfile : Mappable {
                var _large : String = ""
                var _medium : String = ""
                var _small : String = ""
                
                init(){}
                init?(map: Map) {}
                mutating func mapping(map: Map) {
                    _large <- map["large"]
                    _medium <- map["medium"]
                    _small <- map["small"]
                }
            }
            
            // Init
            init() {}
            init?(map: Map) {}
            mutating func mapping(map: Map) {
                id <- map["id"]
                name <- map ["name"]
                firstName <- map ["first_name"]
                lastName <- map["last_name"]
                followedByUser <- map["followed_by_user"]
                followersCount <- map["followers_count"]
                followingCount <- map["following_count"]
                photos <- map["photos"]
                photoProfile <- map["profile_image"]
            }
            
        }
        
    }
    
    
    // MARK: Use cases
    enum privateProfile {
        struct request {
            var accessToken : String = ConstantVariables.accessToken
            var clientId : String = ConstantVariables.clientId
            var secretKey : String = ConstantVariables.secretKey
        }
        struct response : Mappable {
            
            var id : String?
            var updatedAt : String?
            var firstName : String?
            var lastName : String?
            var twitterUsername : String?
            var portofolio : String?
            var bio : String?
            var location : String?
            var totalLikes : Int?
            var totalPhotos : Int?
            var totalCollections : Int?
            var followedByUser : Bool?
            var downloads : Int?
            var uploadRemaining : Int?
            var instagramUser : String?
            var locations : String?
            var email : String?
            var links : responseLinks?
            var username : String?
            var followers : Int?
            var imageURL : responseImage?
            
            init() {}
            init?(map: Map) {}
            mutating func mapping(map: Map) {
                id <- map["id"]
                updatedAt <- map["updated_at"]
                firstName <- map["first_name"]
                lastName <- map["last_name"]
                twitterUsername <- map["twitter_username"]
                portofolio <- map["portofolio"]
                bio <- map["bio"]
                location <- map["location"]
                totalLikes <- map["total_likes"]
                totalPhotos <- map["total_photos"]
                totalCollections <- map["total_collections"]
                followedByUser <- map["followed_by_user"]
                username <- map["username"]
                followers <- map["followers_count"]
                imageURL <- map["profile_image"]
            }
            
            struct  responseLinks {
                var _self : String?
                var _html : String?
                var _photos : String?
                var _portofolio : String?
            }
            
            struct responseImage : Mappable {
                var  _large : String?
                var  _medium : String?
                var  _small : String?
                init () {}
                init?(map: Map) {}
                mutating func mapping(map: Map) {
                    _large <- map["large"]
                    _medium <- map["medium"]
                    _small <- map["small"]
                }
                
            }
        }
        
        struct viewModel {
            var firstName : String?
            var collection : Int?
            var followers : Int?
            var username : String?
            var email : String?
            var imageURL : String?
            
            init() {} 
        }
    }
}

