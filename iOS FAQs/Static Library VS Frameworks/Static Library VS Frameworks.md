# Static Library VS Frameworks

* Static library is a set of precompiled classes packaged in the form of a file with ".a" extension, which we can reuse in several projects and also distribute in our team.

* Framework is also a set of precompiled classes, which can have images, resources, xibs in the same bundle. But static library can't have all of them in the same bundle. We need to distribute them in separate bundles.

* If we need to distribute everything in same bundle, we go for framework. Whereas, if we want to distribute code and resources as separate bundles, we opt for static library.

* Both provide us means to hide our source code from others. We only distribute precompiled classes for usablity.