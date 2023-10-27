//
//  ViewController.swift
//  NeonAcademyApi
//
//  Created by Kerem Caan on 17.08.2023.
//

import UIKit
import SnapKit

let firstLabel: UILabel = UILabel()
let secondLabel: UILabel = UILabel()
let thirdLabel: UILabel = UILabel()
let fourthLabel: UILabel = UILabel()
let fifthLabel: UILabel = UILabel()
let sixthLabel: UILabel = UILabel()
let seventhLabel: UILabel = UILabel()
let eighthLabel: UILabel = UILabel()
let ninethLabel: UILabel = UILabel()
let tenthLabel: UILabel = UILabel()
let eleventhLabel: UILabel = UILabel()
let twelvethLabel: UILabel = UILabel()
var gitUser: [GitHubUser] = []

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI(){
        
        makeGetRequest()
        
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(fourthLabel)
        view.addSubview(fifthLabel)
        view.addSubview(sixthLabel)
        view.addSubview(seventhLabel)
        view.addSubview(eighthLabel)
        view.addSubview(ninethLabel)
        view.addSubview(tenthLabel)
        view.addSubview(eleventhLabel)
        view.addSubview(twelvethLabel)
        
        firstLabel.textAlignment = .center
        firstLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        secondLabel.textAlignment = .center
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        thirdLabel.textAlignment = .center
        thirdLabel.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        fourthLabel.textAlignment = .center
        fourthLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        fifthLabel.textAlignment = .center
        fifthLabel.snp.makeConstraints { make in
            make.top.equalTo(fourthLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        sixthLabel.textAlignment = .center
        sixthLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        seventhLabel.textAlignment = .center
        seventhLabel.snp.makeConstraints { make in
            make.top.equalTo(sixthLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        eighthLabel.textAlignment = .center
        eighthLabel.snp.makeConstraints { make in
            make.top.equalTo(seventhLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        ninethLabel.textAlignment = .center
        ninethLabel.snp.makeConstraints { make in
            make.top.equalTo(eighthLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        tenthLabel.textAlignment = .center
        tenthLabel.snp.makeConstraints { make in
            make.top.equalTo(ninethLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        eleventhLabel.textAlignment = .center
        eleventhLabel.snp.makeConstraints { make in
            make.top.equalTo(tenthLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        twelvethLabel.textAlignment = .center
        twelvethLabel.snp.makeConstraints { make in
            make.top.equalTo(eleventhLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    func makeGetRequest() {
        guard let url = URL(string: "https://api.github.com/users/KeremCaan") else {
            return
        }
        
        

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            let httpResponse = response as! HTTPURLResponse
            
            if httpResponse.statusCode == 200 {
                

                let jsonData = try? JSONDecoder().decode(GitHubUser.self, from: data)
                DispatchQueue.main.async {
                    firstLabel.text = jsonData!.name
                    secondLabel.text = jsonData!.url
                    thirdLabel.text = jsonData!.bio
                    fourthLabel.text = jsonData!.followers_url
                    fifthLabel.text = jsonData!.login
                    sixthLabel.text = jsonData!.repos_url
                    seventhLabel.text = String(jsonData!.public_repos)
                    eighthLabel.text = String(jsonData!.public_gists)
                    ninethLabel.text = jsonData!.type
                    tenthLabel.text = String(jsonData!.followers)
                    eleventhLabel.text = String(jsonData!.following)
                    twelvethLabel.text = String(jsonData!.id)
                }

                

                
            }
            
        }
        task.resume()
        
    }
    
//    func fetchFromAPI() async throws -> [GitHubUser] {
//        let url = URL(string: "https://api.github.com/users/KeremCaan")
//        let (data, response) = try await URLSession.shared.data(from: url!)
//        let decoded = try JSONDecoder().decode(Response.self, from: data)
//        return decoded.results
//    }

}



enum GHError: Error {
    case invalid
    case invalidResponse
    case invalidData
}

