# Scripted Scenario Selection

## Scenarios
The mod selects a scenario at the end of the World War 2 of any of its shape of forms.

### Scenario 1 - The Cold War
This is a historical Cold War scenario. Experience a Cold War scenario within the vanilla game in all its glory.

## Development
The scenario picker is triggered on a peace conference when its triggered passed year 1945.

### Flags
- `ET_flag_country_newera` > Added on the new era decision is pressed.
- `ET_flag_global_newera` > Added when a new era is triggerd.
- `ET_flag_global_scenario_1` > Is Scenario 1 name.

### Related files
- `common\on_actions\ET_00_on_actions.txt`
- `common\scripted_effects\ET_scenario_scripted_effect.txt`
- `events\ET_S1_Division_World.txt`
- `events\ET_Scenario_News.txt`
