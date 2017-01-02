# What is Test-driven development (TDD)?

Test-driven development (TDD) is a development technique where you must first write a test case that fails before you write new functional code for business logic.

TDD is being quickly adopted by agile software developers for development of application source code and is even being adopted by Agile DBAs for database development.

Xcode supports three main types of testing.

- **Functional tests** focus on code functionality.

- **Performance tests** focus on measuring execution time.

- **User Interface tests** focus on flows through the user interface.

Functional and performances tests are functions that you write. Each function sets up an environment for the test, executes the targeted parts of the app, and tears down the test environment. User interface tests are recordings you make as you use your app.

The most common type of functional testing is unit testing. A unit of code is the smallest testable component of your project. For example, a method in a class or a set of methods that accomplish an essential purpose. Unit tests are often used to detect regressions introduced by code changes to a project. Some developers write unit tests first and then implement methods that pass the tests.

Performance tests measure the time it takes your app to complete a task on different types of devices. Xcode tracks times for different configurations and you choose baselines from measured values.

A test case exercises a unit of code in a specific way or measures a specific part of your app’s performance; if the result of the test is different from the expected result, the test case fails. A test suite is made up of a set of test cases.