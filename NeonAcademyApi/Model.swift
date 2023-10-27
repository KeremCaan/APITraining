//
//  Model.swift
//  NeonAcademyApi
//
//  Created by Kerem Caan on 17.08.2023.
//

import UIKit

struct GitHubUser: Hashable, Codable {
    let login: String
    let id: Int
    let url: String
    let bio: String
    let name: String
    let public_repos: Int
    let public_gists: Int
    let followers: Int
    let following: Int
    let type: String
    let repos_url: String
    let followers_url: String
}
