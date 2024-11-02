//
//  WeatherData.swift
//  Clima
//
//  Created by Keshav kumar on 03/10/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation


// A type that can decode itself from an external represenatation namely JSON representation is 'Decodable'
struct WeatherData:Decodable
{
    let name : String
    let main : Main
    let weather : [Weather]   // in JSON , it is in the form of an 'array', so []
}
/*
in JSON format we can see that 'name' is singular so we didn't created a struct for this , but 'main' and 'weather' are not
singular they have their own properties , so we created struct and used only those properties which we will be required in
our app.
*/

struct Main:Decodable
{
    let temp : Double
    /*
    we can't just name these properties whatever we want. for example if i call this 'temperature' then decoding process
    not going to work, so i have to make sure that my property names matches the names of the properties that i'm seeing in
    my JSON data precisely.
    */
}


struct Weather:Decodable
{
    let id : Int
}







/*
 The API response may contain more elements than just name, main, and weather. The JSON returned by OpenWeatherMap often includes additional fields such as humidity, wind speed, and more detailed weather information.

 If you want to handle additional fields, you can add more properties to your WeatherData and related structs. You don't need to include every field from the API response, just the ones you're interested in.
*/





/*
 ->'Decodable' is a protocol in Swift that is used to parse and convert JSON data into custom data types.
 example:-
 
 {
     "name": "John Doe",
     "age": 30,
     "city": "New York"
 }
 
 import Foundation
 struct Person: Decodable 
 {
     let name: String
     let age: Int
     let city: String
 }
 
 By conforming to Decodable, your types can easily be created from JSON data with minimal effort!
*/


/*
 ->'Encodable' is a protocol in Swift that allows custom types to be encoded into an external representation, such as JSON.
 ->When a type conforms to Encodable, it gains the ability to encode itself into a format that can be easily serialized and
  transmitted (e.g., sent to a server or saved locally).
 ->The Encodable protocol is often used alongside JSONEncoder to convert Swift types into JSON.
*/


/*
 'Codable' is a typealias in Swift that combines the 'Encodable' and 'Decodable' protocols. This means that any type that
 conforms to Codable can both be encoded into an external representation (like JSON) and decoded from it. Using Codable
 simplifies the process of converting between Swift data types and common external formats such as JSON, Plist, or other
 serializable data.
 
 typealias Codable = Decodable & Encodable
*/

