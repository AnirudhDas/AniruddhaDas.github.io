# Access Control in Swift

### What is Acess Control?

`Access control` restricts access to parts of your code from code in other source files and modules. This feature enables you to hide the implementation details of your code, and to specify a preferred interface through which that code can be accessed and used.

### Modules and Source Files

Swift’s access control model is based on the concept of modules and source files.

A `module` is a single unit of code distribution—a framework or application that is built and shipped as a single unit and that can be imported by another module with Swift’s import keyword.

Each build target (such as an app bundle or framework) in Xcode is treated as a separate module in Swift. If you group together aspects of your app’s code as a stand-alone framework—perhaps to encapsulate and reuse that code across multiple applications—then everything you define within that framework will be part of a separate module when it is imported and used within an app, or when it is used within another framework.

A `source file` is a single Swift source code file within a module (in effect, a single file within an app or framework). Although it is common to define individual types in separate source files, a single source file can contain definitions for multiple types, functions, and so on.

### Access Levels

Swift provides five different access levels for entities within your code. These access levels are relative to the source file in which an entity is defined, and also relative to the module that source file belongs to.

- **open**

Open classes and class members can be subclassed and overridden both within and outside the defining module (target).

- **public**

Public classes and class members can only be subclassed and overridden within the defining module (target).

**Example:**

```
// First.framework – A.swift

open class A {}
```

```
// First.framework – B.swift

public class B: A {} // ok
```

```
// Second.framework – C.swift

import First

internal class C: A {} // ok
```

```
// Second.framework – D.swift

import First

internal class D: B {} // error: B cannot be subclassed
```

- **internal**

Enables an entity to be used withing the defining module (target). You typically use internal access when defining an app’s or a framework’s internal structure. **By default, all entities have internal access.**

```
// First.framework – A.swift

internal struct A {}
```

```
// First.framework – B.swift

A() // ok
```

```
// Second.framework – C.swift

import First

A() // error: A is unavailable
```

- **fileprivate**

Restricts the use of an entity to its defining source file. You typically use fileprivate access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.

```
// First.framework – A.swift

internal struct A {

    fileprivate static let x: Int

}

A.x // ok
```

```
// First.framework – B.swift

A.x // error: x is not available
```

- **private**

Restricts the use of an entity to its enclosing declaration. You typically use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration.

```
// First.framework – A.swift

internal struct A {

    private static let x: Int

    internal static func doSomethingWithX() {
        x // ok
    }

}

A.x // error: x is unavailable
```

### Note

Swift doesn't have **`protected`** access level, like Java.