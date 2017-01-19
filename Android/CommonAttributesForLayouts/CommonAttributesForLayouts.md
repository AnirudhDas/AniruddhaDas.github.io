# Common attributes for layouts

### `android:layout_width`

**Description:**

To specify the width of the control.

**Values:**

- `wrap_content` : fit to the content size
- `match_parent` : fit to the parent container

**Sample for attributes:**

```
<TextView
    android:layout_width="wrap_content" 
/>
```

```
<TextView
    android:layout_width="match_parent" 
/>
```

----

### `android:layout_height`

**Description:**

To specify the height of the control

**Values:**

- `wrap_content` : fit to the content size
- `match_parent` : fit to the parent container

**Sample for attributes:**

```
<TextView
    android:layout_height="wrap_content" 
/>
```

```
<TextView
    android:layout_height="match_parent" 
/>
```

----

### Align Android control to parent container

- `android:layout_alignParentTop="true"` attribute is used to align your control to the TOP of parent container.
- `android:layout_alignParentRight="true"` attribute is used to align your control to the RIGHT of parent container.
- `android:layout_alignParentEnd="true"` attribute is used to align your control to the BOTTOM of parent container.
- `android:layout_alignParentLeft="true"` attribute is used to align your control to the LEFT of parent container.

### Apply MARGIN Android control

- `android:layout_margin="20dp"` will apply margin to all corners of Android control.
- `android:layout_marginBottom="10dp"` will apply margin to BOTTOM corners of Android control.
- `android:layout_marginLeft="10dp"` will apply margin to LEFT corners of Android control.
- `android:layout_marginRight="10dp"` will apply margin to RIGHT corners of Android control.
- `android:layout_marginTop="10dp"` will apply margin to TOP corners of Android control.
- `android:layout_marginStart="10dp"` will apply margin to Start corners of Android control. ( I believe, Left & Top )
- `android:layout_marginEnd="10dp"` will apply margin to End corners of Android control. ( I believe, Right & Bottom )

### Apply text size

- `android:textSize="20dp"` is not recommended at all. Always use SP for fonts.
- `android:textSize="20sp"` is always recommended. Based on user's font display settings font-size will be adjusted.

### Using system defined font sizes/styles

- `android:textSize="?android:textAppearanceLarge"`
- `android:textSize="?android:textAppearanceButton"`
- `android:textSize="?android:textAppearanceListItem"`
- `android:textSize="?android:textAppearanceListItemSeconday"`
- `android:textSize="?android:textAppearanceListItemSmall"`
- `android:textSize="?android:textAppearanceMedium"`

### Changing background color & text color

- `android:background="@android:color/darker_gray"`
- `android:background="#ce93d8"`
- `android:textColor="#4a148c"`
- `android:textColor="@android:color/darker_gray"`

### Changing text style Bold / Italic

- `android:textStyle="bold"`
- `android:textStyle="italic"`
- `android:textStyle="bold|italic"`