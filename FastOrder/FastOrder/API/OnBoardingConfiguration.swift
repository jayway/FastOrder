//
//  OnBoardingConfiguration.swift
//  FastOrder
//
//  Created by Claus Simonsen on 26/11/2020.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topLevel = try TopLevel(json)

import Foundation

// MARK: - TopLevel
struct TopLevel {
    var products, filterGroups, variants, ingredients: [Any?]
    var config: Config
    var publicData: PublicData
    var company: Company
    var updated: String
}

// MARK: - Company
struct Company {
    var slug, businessName, businessCountry, displayCurrency: String
    var companyID: String
    var created: Created
    var businessAddress, managerName, languageID, license: String
    var businessCity, email, businessPostalCode: String
    var active: Bool
    var currency: String
}

// MARK: - Created
struct Created {
    var seconds, nanoseconds: Int
}

// MARK: - Config
struct Config {
    var receiveSMSOnNewOrder: Bool
    var minMaxOpeningHours: MinMaxOpeningHours
    var weekOpeningPlan: [WeekOpeningPlan]
    var sendQueueSMS, companySMSphone: Bool
    var menuLayout: String
    var venueCapacity: Int
    var logo: String
    var companySMScountryCode, sendTakeAwayReadySMS: Bool
    var extraLanguageIDS: [Any?]
    var sendTakeAwayPreparingSMS: Bool
    var companySMSReceiver: CompanySMSReceiver
    var handleVenueCapacity: Bool
}

// MARK: - CompanySMSReceiver
struct CompanySMSReceiver {
    var phone: NSNull
    var countryCode: String
}

// MARK: - MinMaxOpeningHours
struct MinMaxOpeningHours {
    var min, max: Int
}

// MARK: - WeekOpeningPlan
struct WeekOpeningPlan {
    var closed: Bool
    var openingHours: [Int]
    var day: String
}

// MARK: - PublicData
struct PublicData {
    var website: String
    var phoneInfo: CompanySMSReceiver
    var googleMaps: String
    var instagram, facebookID, email: NSNull
    var slogan: String
    var phone: NSNull
    var countryCode: String
}



/*

 The following is an example URL for calling the onboarding configuration for 'Jayway' as well as the resulting
 JSON content
 
 Above this comment section is the related Swift file generated using https://app.quicktype.io
 
 https://firebasestorage.googleapis.com/v0/b/fastorder-testing.appspot.com/o/jayway%2Fdata.json?alt=media

 
 {
     "products":[],
     "filterGroups":[],
     "variants":[],
     "ingredients":[],
     "config": {
         "receiveSMSOnNewOrder":false,
         "minMaxOpeningHours": {
             "min":8,
             "max":22
         },
         "weekOpeningPlan": [
             {
                 "closed":false,
                 "openingHours":[8,9,10,11,12,13,14,15,16,17],
                 "day":"Monday"
             },
             {
                 "openingHours":[8,9,10,11,12,13,14,15,16,17],
                 "day":"Tuesday",
                 "closed":false
             },
             {
                 "closed":false,
                 "day":"Wednesday",
                 "openingHours":[8,9,10,11,12,13,14,15,16,17]
             },
             {
                 "openingHours":[8,9,10,11,12,13,14,15,16,17],
                 "day":"Thursday",
                 "closed":false
             },
             {
                 "openingHours":[8,9,10,11,12,13,14,15,16,17],
                 "day":"Friday",
                 "closed":false
             },
             {
                 "day":"Saturday",
                 "openingHours":[8,9,10,11,12,13,14,15,16,17,18,19,20,21,22],
                 "closed":true
             },
             {
                 "day":"Sunday",
                 "openingHours":[8,9,10,11,12,13,14,15,16,17,18,19,20,21,22],
                 "closed":true
             }
         ],
         "sendQueueSMS":true,
         "companySMSphone":false,
         "menuLayout":"SMALL",
         "venueCapacity":50,
         "logo":"https://firebasestorage.googleapis.com/v0/b/fastorder-testing.appspot.com/o/jayway%2Flogo%2F7a54535d-5d8d-4a29-8e3a-e8b4014e77d6.png?alt=media",
         "companySMScountryCode":false,
         "sendTakeAwayReadySMS":false,
         "extraLanguageIds":[],
         "sendTakeAwayPreparingSMS":false,
         "companySMSReceiver": {
             "phone":null,
             "countryCode":"+45"
         },
         "handleVenueCapacity":false
     },
     "publicData": {
         "website":"https://www.jayway.com/",
         "phoneInfo": {
             "phone":null,
             "countryCode":"+45"
         },
         "googleMaps":"https://www.google.com/maps?sll=55.682655,12.57915&q=2+Sj%C3%A6leboderne+K%C3%B8benhavn,+1122,+Denmark&z=13",
         "instagram":null,
         "facebookId":null,
         "email":null,
         "slogan":"we design & develop digital solutions",
         "phone":null,
         "countryCode":"+45"
     },
     "company": {
         "slug":"jayway",
         "businessName":"Jayway",
         "businessCountry":"DK",
         "displayCurrency":"KR",
         "companyID":"e0c2b5ca-0ad9-495d-876e-12538c573c4c",
         "created": {
             "_seconds":1605526552,
             "_nanoseconds":148000000
         },
         "businessAddress":"Sjæleboderne 2,",
         "managerName":"Jayway manager",
         "languageId":"en",
         "license":"QUEUE",
         "businessCity":"Copenhagen",
         "email":"fo-dk-jayway@fastorder.menu",
         "businessPostalCode":"122",
         "active":true,
         "currency":"DKK"
     },
     "updated":"Tue Nov 17 2020 11:43:00 GMT+0000 (Coordinated Universal Time)"
 }
 
 */
