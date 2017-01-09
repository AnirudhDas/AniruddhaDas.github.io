#Other PHP Utilities

### How to Encode/Decode JSON in php?

```
// Decode JSON
$mydecodeddata = json_decode($my_json_string, true)

// Encode JSON
$my_json_string = json_encode($my_data, true)
```

### Check if an array is having value for specific key or not

```
if ( array_key_exists($key,$my_array) == false ) {
    echo "key doesn't exists";
} else {
    echo "key exists";
}
```

### foreach loop in php

```
foreach($array_to_check as $value) {
    echo "$value";
}
```

### Get request body

```
$rqstBody = @file_get_contents('php://input');
```

### Get server protocol type - http or https

```
function get_protocol() {
    if (isset($_SERVER['HTTPS']) &&
        ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == 1) ||
        isset($_SERVER['HTTP_X_FORWARDED_PROTO']) &&
        $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
        return 'https://';
    } else {
          return'http://';
    }
}
```

### Get all headers

```
$headers = getallheaders();
```

### Get current file path / URL

```
$path = $_SERVER['SERVER_NAME'] . dirname($_SERVER['PHP_SELF']);
echo $path;
```

### Delete file at specified location

```
$file_path_location = "https://myserver.com/myfolder/myfile.png" 
unlink($file_path_location);
```

### Find a string & replace it within a string.

```
$phrase = "This is my string. and text_to_replace is this.";
$find = "text_to_replace";
$replace = array('What the Hell');
$newphrase = str_replace($find, $replace, $phrase);
// output string would be "This is my string. and What the Hell is this." 
```

### Include another file or include once

```
// to include file another
include 'my_another_file.php';

// to include one time only. This will help to avoid errors
include_once 'my_another_file.php';
```

### Get the request type

```
$method = $_SERVER['REQUEST_METHOD'];
```

### Set the response format JSON

```
header('Content-Type: application/json');
```