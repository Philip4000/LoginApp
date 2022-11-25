//
//  User.swift
//  LoginApp
//
//  Created by Philip Noskov on 24.11.2022.
//

import Foundation


struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            username: "User",
            password: "1234",
            person: Person(
                name: "Phil",
                surname: "Nolan",
                age: 30,
                email: "philnolan@devjob.com",
                career: "iOS Developer",
                education: "2022. SwiftBook.ru \"iOS developer from scratch\".",
                skills: "HIG, InterfaceBuilder, Foundation,  UIKit, Autolayout,  SwiftUI, lv.1, CocoaPods, GCD lv.1, ARC lv.1, JSON, other frameworks, git, etc..."
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    var fullName: String {
        "\(name) \(surname)"
    }
    
    let age: Int
    let email: String
    
    let career: String
    let education: String
    
    let skills: String
}
