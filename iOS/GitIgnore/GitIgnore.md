# Git Ignore file for Xcode projects.

### Steps:

Create a git ignore file.

```
$ vi .gitignore
```
	
Copy and paste following contents into your .gitignore file.

```
### OSX ###
.DS_Store
.AppleDouble
.LSOverride

**/.DS_Store
**/.AppleDouble
**/.LSOverride

# Icon must end with two \r
Icon
**/Icon

# Thumbnails
._*
**/._*

# Files that might appear on external disk
.Spotlight-V100
.Trashes

**/.Spotlight-V100
**/.Trashes

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk

**/.AppleDB
**/.AppleDesktop
**/Network Trash Folder
**/Temporary Items
**/.apdisk

### Swift ###
# Xcode
#
build/
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata
*.xccheckout
*.moved-aside
DerivedData
*.hmap
*.ipa
*.xcuserstate

**/build/
**/*.pbxuser
**/!default.pbxuser
**/*.mode1v3
**/!default.mode1v3
**/*.mode2v3
**/!default.mode2v3
**/*.perspectivev3
**/!default.perspectivev3
**/xcuserdata
**/*.xccheckout
**/*.moved-aside
**/DerivedData
**/*.hmap
**/*.ipa
**/*.xcuserstate

# CocoaPods
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# http://guides.cocoapods.org/using/using-cocoapods.html#should-i-ignore-the-pods-directory-in-source-control
#
Pods/
**/Pods/

### Xcode ###
build/
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata
*.xccheckout
*.moved-aside
DerivedData
*.xcuserstate

**/build/
**/*.pbxuser
**/!default.pbxuser
**/*.mode1v3
**/!default.mode1v3
**/*.mode2v3
**/!default.mode2v3
**/*.perspectivev3
**/!default.perspectivev3
**/xcuserdata
**/*.xccheckout
**/*.moved-aside
**/DerivedData
**/*.xcuserstate
```