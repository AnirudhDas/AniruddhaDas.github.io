# Difference between Categories and Extensions

Although both categories and extensions are used to add new methods and properties to an existing class. But, Swift extension and Objective-C category are a little different.

- You can't create an instance of a category in Objective C. But in swift, we can create an instance of an extension.
- In Objective-C, we wrote **only declarations** of methods in ```.h``` file. They were by-default **public**.
- To have more methods into already existing class, we used to write the **definition** (not declaration) of those new methods directly into the ```.m``` file. They were by-default **private**.
- To have declaration of these new methods, we can't add them to ```.h``` or ```.m``` file. We have to create a ```category``` above the ```.m``` file itself, and then add the **declaration** of the new methods in the category.
- The main difference is that with an extension, the compiler will expect you to implement the methods within your `main @implementation`, whereas with a category you have a `separate @implementation` block. So you should pretty much only use an extension at the `top of your main .m` file (the only place you should care about ivars, incidentally) - it's meant to be just that, an extension.

----

**Class Category VS Class Extension**

`Class Category of Obj C` is same as `Extension of Swift` - We define additional methods in a file, and can use it anywhere in the project.

But `Class Extension of Obj C` means the file where I am declaring the extension, it remains private to that file. We can only use the additional methods in that file, and no where else on the project.

----

1. **Class Category:** 
	- In objective c, when you want to add some more functionality to a class without inheritance, you simply use category for it.
	- It come with its own .h and .m file
	- Category is used to add new methods not properties.

2. **Class Extension**
	- In objective c, when you want to make behavior of some property private, you use class extension.
	- It comes with .m file only.
	- It is used mainly for properties.

----

**Note:**

Ques: Can we create an instance of category?
Ans: No. We can't create an instance of a category.

Ques: Can we access the category method in subclasses?
Ans: Yes. We can access the category method in subclasses.

Ques: Can Extensions in Swift be used to add stored properties?
Ans: No. We can only add methods to an extension, not stored properties.