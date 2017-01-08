# Is overriding and overloading possible in the same class?

Yes. It is possible.

**Example:**

```
class A {
//Has only Overloading
	void m(int a) {
	}
	
	void m(String s) {
	}
}

class B extends A {
//Has Overriding and Overloading at same time
	void m(int a) {
		System.out.println(a);
	}
	
	void m(String s) {
		System.out.println(s);
	}
	
	void m(float f) {
		System.out.println(f);
	}
}

public class Polymorphism {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		B ob = new B();
		ob.m(4);
		ob.m("Ani");
		ob.m(10.2f);
	}

}
```