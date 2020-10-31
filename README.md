# bookmarks-manager
A simple web based bookmarks capture tool.

I am writing this as part of learning to use common-lisp more frequently. I hope the add the following features as I go:

1. Basic user authentication. Only authenticated users can add a bookmark.
2. Tags to qualify and filter the bookmarks.
3. Note to describe the bookmark - for research, say.
4. Edit the link added, modify tags, modify note.
5. Ability to sign up for an account, change password or reset password.
6. Quick usage stats - per account, global
7. Shareable list of bookmarks - anonymous listing of selected bookmarks.
8. Example configuration for using postgresql.
9. Example configuration to use [djula](http://mmontone.github.io/djula/) instead of [clip](https://shinmera.github.io/clip/).
10. More logging. Example configuration to use [log4cl](https://github.com/sharplispers/log4cl) instead of default [verbose](https://shinmera.github.io/verbose/).

For css, I use tailwindcss. I'll share the tailwind sources soon. It is pretty much vanilla tailwind compile.

## 31 Oct 2019

- Removed all framework dependence. I plan to try vanilla hunchentoot interface.
- Code is back by a few days in the sense it doesn't serve up a page now.
