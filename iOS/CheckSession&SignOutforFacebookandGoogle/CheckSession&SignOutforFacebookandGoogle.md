#  Check session & sign-out for Facebook SignIn and Google SignIn using Firebase

**Make sure you `import` appropriate libraries.**

```
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit
```

### Facebook

- **Check session**

```
if FBSDKAccessToken.current() != nil {
    // already logged in with facebook sign-in
}
```

- **Sign out**

```
FBSDKAccessToken.setCurrent(nil)
```

### Google

- **Check session**

```
if GIDSignIn.sharedInstance().currentUser != nil {
    // already logged in with google sign-in
}
```

- **Signing out**

```
GIDSignIn.sharedInstance().signOut()
try! FIRAuth.auth()!.signOut()
```
