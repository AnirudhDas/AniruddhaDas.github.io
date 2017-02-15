### Instantiate a View Controller Programmatically

```
let vc: ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
```