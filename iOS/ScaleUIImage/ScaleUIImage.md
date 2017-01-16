# Resize/Scale UIImage to a desired resolution

```
public extension UIImage {

	/// # Resizes the image object
	/// - Parameters:
	///   - percentage: Provide `%` to resize the image
	/// - Returns: Returns an instance of resized image
	public func resizeWith(percentage: CGFloat) -> UIImage? {
		let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: size.width * percentage, height: size.height * percentage)))
		imageView.contentMode = .scaleAspectFit
		imageView.image = self
		UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		imageView.layer.render(in: context)
		guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
		UIGraphicsEndImageContext()
		print("hello")
		return result
	}

	/// # Resizes the image object
	/// - Parameters:
	///   - width: Provide width in pixels to resize the image
	/// - Returns: Returns an instance of resized image
	public func resizeWith(width: CGFloat) -> UIImage? {
		let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
		imageView.contentMode = .scaleAspectFit
		imageView.image = self
		UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		imageView.layer.render(in: context)
		guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
		UIGraphicsEndImageContext()
		return result
	}

}
```

### Usage

```
let image = UIImage(named: "UserImage")
image = image.resizeWith(percentage: 20)
```

```
let image = UIImage(named: "UserImage")
image = image.resizeWith(width: 200)
```