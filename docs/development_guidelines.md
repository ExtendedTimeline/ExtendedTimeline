# Development Guidelines
*[back to home](index)*

To make this project as easy as possible to maintain and update we are enforcing some code styling.
It allow us to quickly get out updates to this mod as well as read the code. 

## Indent
Indents should use 4 spaces.
Exception is replacement files were tab is used as it is default PDX usage.

## Naming
Use prefix `ET_` for all new files. 

Use prefix `ET_` for all mod scripts.

Interface `name =` use `GFX_ET_`.

When you overwrite a file the original name is used with no prefix.
Added code inside still use the `ET_` prefix rule

**Exsamples**
- `ET_init_country_scripted_effect.txt` > adds new scripted effect, effects.
- `ET_00_on_actions.txt` > adds new on actions effects.
- `00_ideologies.txt` > replaces vanilla ideologies.

The name structure for mod files are `[TAG]_[WhatEverItIsSupposeToBeDoing](_[TYPE]).txt`
(*`_[TYPE]` is optional were it is not pressent on other files.*)

### flags
**Global Flags:** `ET_flag_global_[NAME]`

**Country Flags:** `ET_flag_country_[NAME]`

**Exsamples**
- `set_country_flag = ET_flag_country_have_surrended`
- `set_global_flag = ET_flag_global_usa_have_surrended`

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
## Logging
Logging is good and usefull to se when and if something is done or done correctly.
Tho writing to external files ussaly have a tiny performence impact. There for all logs should be wrapped in a if.
It's also recommended to have formated strings and start with [GetDateText].

**Example**
```
if = { limit = { is_debug = yes } log = "[GetDateText]: Checking releasable nations for [This.Owner.GetTag]..." }
```

## Comments
Complicated and large code should use comments to explain what is happening.
