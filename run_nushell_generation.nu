#!/usr/bin/env nu 

# Generate zoxide configuration
if (which zoxide | empty?) == false {
	mkdir ~/.cache/zoxide/
	zoxide init nushell --hook prompt | save ~/.cache/zoxide/zoxide.nu
} 

if (which starship | empty?) == false {
	mkdir ~/.cache/starship/
	starship init nu | save ~/.cache/starship/init.nu
} 
