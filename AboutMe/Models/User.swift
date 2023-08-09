//
//  User.swift
//  AboutMe
//
//  Created by Екатерина Теляубердина on 09.08.2023.
//

struct User {
    let userName: String
    let passsword: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "user",
            passsword: "1111",
            person: Person(
                name: "Катя",
                surname: "Теляубердина",
                birthDate: "18.01.1994",
                city: "Златоуст",
                job: "3д визуализатор",
                bio: "Живу в маленьком городе Челябинской области - Златоусте, вместе со своим мужем и кошкой Василисой. Работаю в небольшом офисе который делает проекты зданий, а я для них делаю визуализации. В свободное время люблю фотографировать, смотреть сериалы и заниматься хайкингом. Мечтаю путешествовать и освоить новую профессию ☺️"
                )
            )
    }
}

struct Person {
    let name: String
    let surname: String
    let birthDate: String
    let city: String
    let job: String
    let bio: String
}
