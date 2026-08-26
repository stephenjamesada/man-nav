# Man Navigator (man-nav)

## Description

Dead-simple, self-explanatory Bash script that helps you navigate man pages much faster.
With `man-nav`, there's no need to memorize every section, and every entry in it; it's already there for you.

> Targeting Debian-based systems, so fd is written as fdfind in the script.

## Dependencies

- `fdfind`
- `fzf`

## Usage

```
./man-nav.sh
```

### Output

#### Title

```
======= Man Navigator =======
        1. Browse Sections
        2. Help
        3. Quit
> 
```

> Help = `man man`

#### Browse Sections

```
======= Choose a section (1-9) =======
	    1. User commands & executables
	    2. Syscalls
	    3. Library calls
	    4. Device files, special files
	    5. File formats & conventions
	    6. Games
	    7. Misc.
	    8. System administration commands
	    9. Non-standard kernel routines
> 
```
