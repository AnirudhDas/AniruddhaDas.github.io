# Difference between Categories and Extensions

Although both categories and extensions are used to add new methods and properties to an existing class. But, Swift extension and Objective-C category are a little different.

- You can't create an instance of a category in Objective C. But in swift, we can create an instance of an extension.
- In Objective-C, we wrote **only declarations** of methods in ```.h``` file. They were by-default **public**.
- To have more methods into already existing class, we used to write the **definition** (not declaration) of those new methods directly into the ```.m``` file. They were by-default **private**.
- To have declaration of these new methods, we can't add them to ```.h``` or ```.m``` file. We have to create a ```category``` above the ```.m``` file itself, and then add the **declaration** of the new methods in the category.
- The main difference is that with an extension, the compiler will expect you to implement the methods within your `main @implementation`, whereas with a category you have a `separate @implementation` block. So you should pretty much only use an extension at the `top of your main .m` file (the only place you should care about ivars, incidentally) - it's meant to be just that, an extension.


**Note:**

We can't create an instance of a category. But, we can access the category method in subclasses.