# NodeJS

### Advantages:

- It uses asynchronous Javascript. So, it is faster.
- It is one of the important parts of the MEAN Stack.

### Step 1:

Download [NodeJS](https://nodejs.org/en/) and install it.

### Step 2:

Check node version and npm version.

```
node -v
```

```
npm -v
```

`npm` is useful as an external package manager.

### Step 4:

Create a directory `NodeProjects` where you want to store all your node projects in future.

### Step 5:

Inside this folder, we create another folder `FirstNodeProject`.

### Step 6:

Create a file `server.js` inside `FirstNodeProject`. This is the file from where we run our nodeJS server.

### Step 7:

Inside `server.js`, write:

```
var http = require('http');
http.createServer(function (req, res) {
	res.writeHead(200, {'Content-Type': 'text/plain'});
	res.end('Hello World\n');
}).listen(1337, '127.0.0.1');
console.log("Server running at http://127.0.0.1:1337");
```

### Step 8:

Navigate to the project folder through terminal, and use command:

```
node server
```

We will see:

```
Server running at http://127.0.0.1:1337
```

### Step 9:

In your browser, open `http://127.0.0.1:1337` or `http://localhost:1337`.

We can see:

```
Hello World
```

### Step 10:

**Important Note:** If ever you have to terminate the command in the terminal. Use `Cntrl + C` (NOT `Cntrl + Z`)