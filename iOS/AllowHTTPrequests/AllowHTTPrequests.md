# Allow HTTP requests by disabling App Transport Security

Open `Info.plist` as `source code` (right click) of your project.

Before,

```
</dict>
</plist>
```

Insert the following.

```
<code class="xml">
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
</code>
```

It should look like:

![](AppTransportSecurity.png)