emacs-package-store
===================

An add on to package.el that caches packages in a local cache and
let's you use them when the network is down.

If you install this package (it's in http://marmalade-repo.org) your
package downloads will be cached to:

```
package-store-cache-dir
```

which by default is:

```
~/.emacs.d/package-cache
```

This allows you to then download the packages from the cache instead
of the network.  This is most useful when you are on a plane or
somewhere else that does not have a network connection.  Particularly
so you can continue to test code with packages.


Use 

```
M-x toggle-package-store-connected
```

To manually turn on retrieval from the cache.

