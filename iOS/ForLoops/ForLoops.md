# `For loops` in Swift: `index` and `element` in arrays

### Example

```
let list = [10, 20, 30, 40, 50]

for (index, element) in list.enumerated() {
    print("Item \(index): \(element)")
}
```

### Output

```
Item 0: 10
Item 1: 20
Item 2: 30
Item 3: 40
Item 4: 50
```