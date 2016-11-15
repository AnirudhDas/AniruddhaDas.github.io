# Inheritance VS Association (Aggregation and Composition)



### Inheritance

It is a property by which a ```sub class``` can inherit properties and methods of it's ```super class```.

**Example**

```
//Super Class
class A
{
	int a = 5;
	void m()
	{
		System.out.println("Hello World");
	}
}

//Sub Class
class B extends A
{
	void f()
	{
		System.out.println(a);
		System.out.println(m());
	}
}
```

### Association

It simply means that there is some relationship between two different classes.

Two flavours of Association are:

1. Composition
2. Aggregation

### Composition

It means two classes are tightly coupled. Say, ```class A``` is tightly coupled to ```class B```, i.e. ```class A``` can't exist independently without ```class B```.

**Example**

```
class A
{
	int a;
}

class B
{
	A objA = new A(); /* A is instantiated inside B. So A is existent dependent on B. */
}

class C
{
	B objB = new B(); /* When B is instantiated, A is also instantiated inside it. */
	
	objB = null; /* As soon as B is removed from memory, A is also removed. */
}
```

### Aggregation

It means two classes are loosely coupled. Say, ```class A``` is loosely coupled to ```class B```, i.e. ```class A``` can exist independently without ```class B```.

**Example**

```
class A
{
	int a;
}

class B
{
	A objA;
	
	B(A objA)
	{
		this.objA = objA; /* A is not instantiated inside B. B only receives a copy of A in it's constructor. So A is not existent dependent on B. */
	}
}

class C
{
	A obj A = new A(); /* A is instantiated outside B. */
	
	B objB = new B(objA); /* When B is instantiated, we only send a copy of A to it's constructor. */
	
	objB = null; /* As soon as B is removed from memory, A is not removed. */
}
```