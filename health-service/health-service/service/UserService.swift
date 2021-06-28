
class UserService {

    init() {
    }
    
    public func signIn(userInfo: UserInfoDto) -> Bool {
        let userCreateRequest = UserCreateRequest(userId: userInfo.userId, nickname: "", password: userInfo.pwd, email: userInfo.email)
        
        requestPost(url: "http://localhost:17301/users", method: "POST", param: userCreateRequest.convertIntoDict())
        return true;
    }
}
