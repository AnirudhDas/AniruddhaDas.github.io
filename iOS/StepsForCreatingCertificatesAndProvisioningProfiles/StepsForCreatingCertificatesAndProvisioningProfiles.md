### Steps for creating certificates and provisioning profiles

1. Get a **developers account**.

2. Create an **AppId** to register your app.

3. Create a **.CSR (Certificate Signing Request)** file from your KeyChain. The moment we create a CSR, the KeyChain creates a pair of keys; **one public key which is present in the .CSR file** and **one private key, which is stored inside the KeyChain itself**.

4. Now we need to provide this .CSR file having the public key to Apple, and then Apple generates **two SSL Certificates (Development and Distribution)**. You can revoke and recreate these SSL certificates any number of times.

5. Download this certificates and install into your KeyChain. So, now the KeyChain has **a certificate and a private key**, which together is called an **identity**. This identity is required to compile the code. Without this identity, we can't compile any code.

6. If we export a zip of this identity containing a certificate and a private key, it is called a **.p12 file**. This we need to provide to our server, to configure it for push notifications.

7. Next, we need to create **two provisioning profiles (Development and Distribution)** for the app. **It contains the list of devices the app can be tested and also the AppId**. Distribution Provisioning Profile is again of two types - Ad-Hoc and AppStore. Ad-Hoc is for internal release/alpha testing. AppStore is to release on the Apple AppStore. If there is no provisioning profile, we can't test it on a physical device.

	If we try to test on a random device, which is not registered, it won't let us install the app, as it can't find the UUID of the random device within the provisioning profile set in the app.

8. These provisioning profile must be imported/installed into the KeyChain, and must be set in `Code Signing Identity` section, `Development Team` section and `Provisioning Profile` section in Xcode. It then automatically maps the corresponding identity to the imported provisioning profile, from the KeyChain.
