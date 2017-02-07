# Debugging in XCode

Ways to debug in XCode:

- Print Debugging
	
	```
	print(expectedBuggyValue)
	```
	
- Inheriting `Printable` and `DebugPrintable` class and overriding `description` and `debugDescription` variables.

- Using `XCGLogger`

- Using `dump`

	```
	dump(expectedBuggyValue)
	```

- Breakpoint Debugging

- Using `LLDB` (Low Level Debugger) commands

- Using Breakpoint Actions

- Using Exception Breakpoints

- Using Symbolic Breakpoints

- Using Debug View Hierarchy

### Refer

[Xcode Debugging](https://www.udacity.com/course/xcode-debugging--ud774)