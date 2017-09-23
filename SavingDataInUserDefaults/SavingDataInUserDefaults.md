# Saving data in UserDefaults

```
let token = "abc"
UserDefaults.standard.setValue(token, forKey: "user_auth_token")
print("\(UserDefaults.standard.value(forKey: "user_auth_token")!)")
```