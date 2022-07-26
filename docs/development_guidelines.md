# Development Guidelines
To make this project readable and easy to be maintained we have some common rules.

## Naming
Use prefix `ET_` for all mod content. 
Can be scripted in som GFX.
A suffixe for type of file may be used on some files.

**Exsamples**
- `ET_init_country_scripted_effect.txt` > adds new scripted effect, effects.
- `ET_00_on_actions.txt` > adds new on actions effects.
- `00_ideologies.txt` > replaces vanilla ideologies.

The name structure for mod files are `[TAG]_[WhatEverItIsSupposeToBeDoing](_[TYPE]).txt`
(*`_[TYPE]` is optional were it is not pressent on other files.*)

### flags
**Global Flags:** `ET_flag_global_[NAME]`

**Country Flags:** `ET_flag_country_[NAME]`


### Scripted
Scripts effects and triggers should be named what they do and be generic.

**Bad:**
```
ET_give_political_power_to_nation = { add_political_power = 10 }
```
**Good:**
```
ET_add_political_power_10 = { add_political_power = 10 }
```

For some systems that require some sort of initzialisation a `ET_Init_Something` can be used this functions can do allot of things.
`ET_Init_Egypt`
