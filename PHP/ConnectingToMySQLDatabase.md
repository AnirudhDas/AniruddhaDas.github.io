# Connecting to MySQL database

```
<?php

class db_connection {
    var $servername = "localhost";
    var $username = "user";
    var $pswd = "userpswd";
    var $db_name = "db";
    var $conn;

    function __construct() {
        try {
            $this->conn = new PDO("mysql:host=$this->servername;dbname=$this->db_name", $this->username, $this->pswd);
        } catch (Exception $e) {
            $this->conn = "database connectivity error" + $e;
        }
    }

    function __destruct () {
        unset($this->conn);
        $this->servername = NULL;
        $this->username = NULL;
        $this->pswd = NULL;
        $this->db_name = NULL;
        $this->conn = NULL;
    }    

?>
```