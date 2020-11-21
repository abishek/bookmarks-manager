# bookmarks-manager
A simple web based bookmarks capture tool.

I am writing this as part of learning to use common-lisp more frequently. I hope the add the following features as I go:

1. Basic user authentication. Only authenticated users can add a bookmark.
2. Note to describe the bookmark. For starters, this is a way to discover bookmarks. I hope to add auto summarization in the future.
3. Edit the link added, modify note.
4. Ability to sign up for an account, change password or reset password. [LOW PRIORITY]
5. Quick usage stats - per account, global
6. Shareable list of bookmarks - anonymous listing of selected bookmarks.

For css, I use tailwindcss. I'll share the tailwind sources soon. It is pretty much vanilla tailwind compile.

## 31 Oct 2019

- Removed all framework dependence. I plan to try vanilla hunchentoot interface.
- Code is back by a few days in the sense it doesn't serve up a page now.

## 21 Nov 2019

- Rethought what I really want from this tool.
- Redesigned the templates in tailwind. Updates to code pending.
- Since am learning NLP on the side, I hope to implement what I learn there to enhance the experience of this tool.
