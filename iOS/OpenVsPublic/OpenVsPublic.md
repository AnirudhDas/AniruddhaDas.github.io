# 'Open' VS 'Public'


### 'Open' Keyword

* An ```open``` class is ```accessible``` and ```subclassable``` outside of the defining module. An open class member is accessible and overridable outside of the defining module.

	Example:
	
	```
	public class Demo
	{
		var a = 5
		func display()
		{
			print(a)
		}
	}
	```

### 'Public' Keyword

* A ```public``` class is ```accessible``` but ```not subclassable``` outside of the defining module. A public class member is accessible but not overridable outside of the defining module.

	Example:
	
	```
	open class Demo
	{
		var a = 5
		func display()
		{
			print(a)
		}
	}
	```