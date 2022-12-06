# Using Stow

What happens with --no-folders?

What if I want to link something but not link the folders? Like, I have a config file for nvim, but don't want the entire folder to be symlinked? That way any plugins and etc will not be automatically included...


## `stow -D package-name`

This will delete symlinks.

If I have a symlinked folder and create some files within that, they will not be deleted. The files actually live within the original directory.

## `--no-folding` option
disable folding of newly stowed directories when stowing, and refolding of newly foldable directories when unstowing.

What?

I saw that this was explained differently in a comment online. Someone said this disables folder symlinks - or doesn't create folders - or something.


If the folders don't already exist: 

- it creates the folders
- only the files inside the package are symlinked

If the folders already exist:

- there is no conflict, it will just put the symlinks in
- `stow -D package` will just remove the symlinks, it will keep everything else in place

What if I create a new folder? It does not get added into the stow package.

So, the --no-folding essentially just does files. If the folder structure is not already there it will be created. Folders are not symlinked.


---

What if I stow and the folder structure is there and there are different folders?

If the folder structure already exists it will only symlink the files inside the package.

---

what if I want to absorb the files from the target into my stow package?

Essentially, if the folder structure and some files already exist and they are the same as what is in my package, what happens if I --adopt?

Will my current files be overwritten? What happens?

- Symlink is created for any files that existed in both
- Files that existed are overwritten with those from the target
- No symlink for existing folder stucture


---

With all that being said... there are a few approaches that might fit what I need for config files.

1. Use `stow package` as is for files that sit top level
2. Use `stow --no-folding` when I have nested config files and I don't want to symlink the folders
3. Possibly use .gitignore for scenarios where I want to symlink the folders but don't want to have everything absorbed in git.



---

Can I stow nested things?
If I can stow nested things, maybe some folder structures could be synced...

For example nvim has Ultisnips. I want the init.vim and the Ultisnips folder. But I don't want other folders or files.

The behavior of stow kind of allows for this but it's not something to rely on. If the folder structure and files are already there they will not be symlinked.

So-- one possible way would be to create the folder ... but this isn't good to do.

I think it's probably better to just have different stow packages for everything.

i.e. 

- nvim
- nvim-ultisnips -> folder for it



