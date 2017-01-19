# Explain the process for tracing and fixing a memory leak

Xcode provides a tool called ```instruments``` where we can record the activity of an application. And we can capture the memory leaks.

### Step 1

- Choose any simulator.
- Run the App.
- Stop running the App.

### Step 2

- Hold and press on the arrow below `Run` option in Xcode. You will then see `Profile` option. Click on it.

![](MemoryLeak1.png)

- Select `Leaks` option.

![](MemoryLeak2.png)

### Step 3

- Click on the red button to start leak tracing.

![](MemoryLeak3.png)

- You can see reports on the window. All green checks means app has no memory issues. If any check is read, it means there is some memory issue with your app.

![](MemoryLeak4.png)

### Step 4

You can now save this report of Profile Test.

![](MemoryLeak5.png)

![](MemoryLeak6.png)