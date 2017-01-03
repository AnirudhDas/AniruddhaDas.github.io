# Cocoa-Pods Commands

### Commands for installing and using cocoa-pods

- **Installing cocoapods**

```
sudo gem install cocoapods
```

- **Updating cocoapods**

```
sudo gem update cocoapods
```

- **Uninstalling cococapods**

```
sudo gem uninstall cocoapods
```

- **Clean up local cached pods**

```
sudo rm -fr ~/.cocoapods/repos/master
```

- **Setup pod repository**

```
pod setup --verbose
```

- **Installing pods**

```
pod install --verbose
```

- **Updating pods**

```
pod update --verbose
```

### Commands for contributing to cocoa-pods

- **Validate your pod**

For Local lint

```
pod lib lint
```

For Local/Remote lint

```
pod spec lint
```

- **Validate with warnings**

```
pod spec lint --allow-warnings
```

- **Validate with verbose mode**

```
pod spec lint --verbose
```

```
pod spec lint --verbose --allow-warnings
```