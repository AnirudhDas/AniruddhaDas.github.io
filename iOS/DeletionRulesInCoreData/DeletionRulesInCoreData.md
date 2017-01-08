### Deletion Rules in Core Data

Let's consider two tables in the database:

- **Notebook(notedbookId, Name)**

- **Note(noteId, Text, notebookId)**

Here, `notebookId` is a `foreign key` in `Note` table.

Now, **what happens to all the notes if a notebook is deleted?**

Similarly, **what happens to a notebook if a note inside it is deleted?**

These questions can be resolved using `deletion rules`.

----

There are 4 deletion rules in Core Data:

- **Cascade:** Deleted both objects (If you delete B object with reference of A, so A and B will both deleted) 

- **Nullfy:** set Null values on both side (Related columns)

- **No Action:** No action for delete 

- **Deny:** Denied for delete