class UserCreateRequest {
    let userId: String
    let nickname: String
    let password: String
    let email: String
    
    init(userId: String, nickname: String, password: String, email: String) {
        self.userId = userId
        self.nickname = nickname
        self.password = password
        self.email = email
    }
    
    func convertIntoDict() -> Dictionary<String, String> {
        var dict = Dictionary<String, String>()
        dict["userId"] = self.userId
        dict["nickname"] = self.nickname
        dict["password"] = self.password
        dict["email"] = self.email
        return dict
    }
}
