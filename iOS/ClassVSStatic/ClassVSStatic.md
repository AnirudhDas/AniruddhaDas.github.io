# 'Class' VS 'Static'


### 'Class' Keyword

* ```class``` keyword if used against a method, it can be overrriden.

	Example:
	
	```
	public class Demo
	{
		var a = 5
		class func display()
		{
			print(a)
		}
	}
	```

### 'Static' Keyword

* ```static``` keyword if used against a method, it can't be overrriden.

	Example:
	
	```
	public class Demo
	{
		var a = 5
		static func display()
		{
			print(a)
		}
	}
	```