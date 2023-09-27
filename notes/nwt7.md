# GNU utilities

## ln
If you want to create a symbolic link for a directory,
eg. ln -s /usr/dir ~/dir

Make sure that ~/dir does not already exist.
    - otherwise ln will create the symbolic link target **inside** ~/dir
    - result: /usr/dir -> ~/dir/dir
    - not sure why, but `-F` does not replace the directory ie. ln -sF /usr/dir ~/dir
    does not replace ~/dir and then re-create ~/dir as a symlink
	- behaviour is still to create the `dir` symlink inside ~/dir

Just remove the target directory first, then create the link.
```
rm -rf ~/dir
ln -s /usr/dir ~/dir
```

#gnu


