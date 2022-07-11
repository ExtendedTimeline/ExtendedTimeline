# Naming
Use prefix `ET_` for all mod content. 
Can be scripted in som GFX.
A suffixe for type of file may be used on some files.

## Files
`ET_init_country_scripted_effect.txt` > adds new scripted effect, effects.

`ET_00_on_actions.txt` > adds new on actions effects

`00_ideologies.txt` > replaces vanilla ideologies.

The name structure for mod files are `[TAG]_[WhatEverItIsSupposeToDo](_[TYPE]).txt`
(*`_[TYPE]` is optional were it is not pressent on other files.*)

## flags
**Global Flags:** `ET_flag_global_[NAME]`

**Country Flags:** `ET_flag_country_[NAME]`


## scripted
Scripts effects and triggers should be named what they do.

**Bad:**
```
ET_give_political_power_to_nation = { add_political_power = 10 }
```
**Good:**
```
ET_add_political_power_10 = { add_political_power = 10 }
```
