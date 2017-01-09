# Executing Update,Insert,Delete Query

**Step 1:**

[Get a connection to the Database](ConnectingToMySQLDatabase.md)

**Step 2:**

```
function execute_update_insert_delete_statement($query,$values_to_bind=array()) {
    try {
        // Get the Select statement from your connection 
        $stmt = $this->conn->prepare($query);

        // Bind the values from array to your query
        foreach($values_to_bind as $value) {
            // type, value, length, field are mandatory parameters
            // type = int | text | date | float
            // value = value to bind
            // length = in case of string, pass length to trim
            // field = it will bind to field
            if (array_key_exists('type',$value) && array_key_exists('value',$value) && array_key_exists('length',$value) && array_key_exists('field',$value)) {
                if ($value['type']=='int') {
                    $stmt->bindValue(":".$value['field'], (integer)$value['value'], PDO::PARAM_INT);
                } else if ($value['type']=='text') {
                    $stmt->bindValue(":".$value['field'], substr($value['value'],0,(integer)$value['length']), PDO::PARAM_STR);
                } else if ($value['type']=='date') {
                    // here Y-m-d is the format, change as per need
                    $stmt->bindValue(":".$value['field'], date("Y-m-d", strtotime($value['value'])), PDO::PARAM_STR);
                } else if ($value['type']=='float') {
                    $stmt->bindValue(":".$value['field'], (float)$value['value'], PDO::PARAM_STR);
                }
            } 
        }
        // execute the query
        $stmt -> execute();

        // free the statement
        unset($stmt);
    } catch (Exception $e) {
        return json_encode($this->returnFailureResponse("Some exception occured = $e"));
    }
}
```