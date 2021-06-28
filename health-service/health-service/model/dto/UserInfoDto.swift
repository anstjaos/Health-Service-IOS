import Foundation

class UserInfoDto {
    private var _userId: String
    private var _pwd: String
    private var _email: String
    
    init(userId: String, pwd: String, email: String) {
        self._userId = userId
        self._pwd = pwd
        self._email = email
    }
    
    public var userId: String {
        get {
            return self._userId
        }
    }
    
    public var pwd: String {
        get {
            return self._pwd
        }
    }
    
    public var email: String {
        get {
            return self._email
        }
    }
}
