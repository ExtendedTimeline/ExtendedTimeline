# Scenario framework
*[back to home](index)*

- **Unknown World** *(Scenario_ID: 0)*
- **The Cold War** *(Scenario_ID: 1)*
- **A Eagle World** *(Scenario_ID: 2)* (WIP)
- **A Draggon Empire** *(Scenario_ID: 3)* (WIP)

## Effects Triggers, Flags, Localization

### Adding a Scenaro
1. Figure out a possible scenario World War 2 ending scenario that you've seen or experienced your self.
1. Select a Scenario ID
1. Setup the trigger this is done under [`ET_set_scenario`](https://github.com/ExtendedTimeline/ExtendedTimeline/blob/main/common/scripted_effects/ET_scenario_scripted_effect.txt#L40) in [common/scripted_effects/ET_scenario_scripted_effect.txt](https://github.com/ExtendedTimeline/ExtendedTimeline/blob/main/common/scripted_effects/ET_scenario_scripted_effect.txt). Make sure this triggers are specific but general enought to be missed or get caught.
1. You can add focus trees for your scenario. Scenario specific effects should use a id prefix. *Exsample: `ET_S2_MyScenarioSpecificEvents.txt`*
### Effects

| Effect                            | Description                                                                   | Scope    |
| ---                               | ---                                                                           | ---      |
| `ET_set_new_era`                  | Apply global flag new era                                                     | Global   |
| `ET_remove_new_era`               | Remove global flag new era (used by debug)                                    | Global   |
| `ET_set_new_era_country`          | Apply country flag new era                                                    | Country  |
| `ET_remove_new_era_country`       | Remove country flag new era (used by debug)                                   | Country  |
| `ET_set_scenario`                 | Selects a scenario based on world parameters                                  | Global   |
| `ET_set_new_era_effect`           | Apply new era effects (Called by `ET_set_scenario`)                           | Country  |
| `ET_clr_modifiers_effect`         | Remove National Spirits and modifiers (Called by `ET_set_scenario`)           | Country  |
| `ET_set_new_focus_tree_effect`    | Apply focus tree based on scenario (Called by `ET_set_new_focus_tree_effect`) | Country  |

### Triggers

| Trigger                           | Description                                                 | Scope    |
| ---                               | ---                                                         | ---      |
| `ET_in_new_era`                   | Checks if the world is in the new era                       | Global   |
| `ET_in_new_era_country`           | Checks if the world and country is in the new era           | Country  |
| `ET_is_era_avalible_country`      | Checks if the world is in the new era and country can entre | Country  |
| `ET_has_scenario`                 | Check if you have any scenario                              | Global   |
| `ET_has_scenario_none`            | Check if you have no scenario                               | Global   |
| `ET_has_scenario_0`               | Check if you have scenario 0                                | Global   |
| `ET_has_scenario_1`               | Check if you have scenario 1                                | Global   |
| `ET_has_scenario_2`               | Check if you have scenario 2                                | Global   |
| `ET_has_scenario_3`               | Check if you have scenario 3                                | Global   |
| `ET_has_scenario_4`               | Check if you have scenario 4                                | Global   |
| `ET_has_scenario_5`               | Check if you have scenario 5                                | Global   |
| `ET_has_scenario_6`               | Check if you have scenario 6                                | Global   |
| `ET_has_scenario_7`               | Check if you have scenario 7                                | Global   |
| `ET_has_scenario_8`               | Check if you have scenario 8                                | Global   |
| `ET_has_scenario_9`               | Check if you have scenario 9                                | Global   |
| `ET_has_scenario_10`              | Check if you have scenario 10                               | Global   |
| `ET_has_scenario_11`              | Check if you have scenario 11                               | Global   |
| `ET_has_scenario_12`              | Check if you have scenario 12                               | Global   |
### Localization

| Localization                      | Description                                                                   | Scope    |
| ---                               | ---                                                                           | ---      |
| `ET_getCurrentScenarioName`       | Writes your current scenario name                                             | Global   |
| `ET_Scenario_None_Name`           | Writes scenaro name                                                           | Global   |
| `ET_Scenario_0_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_1_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_2_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_3_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_4_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_5_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_6_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_7_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_8_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_9_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_10_Name`             | Writes scenaro name                                                           | Global   |
| `ET_Scenario_11_Name`             | Writes scenaro name                                                           | Global   |
| `ET_Scenario_12_Name`             | Writes scenaro name                                                           | Global   |
### Flags

| Flags                             | Description                                                                   |
| ---                               | ---                                                                           |
| `ET_flag_country_newera`          | Added wen the country enter in to the new era (Used to controll focus trees)  |
| `ET_flag_global_newera`           | Added when the world enter in to the new era                                  |
| `ET_flag_global_scenario_0`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_1`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_2`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_3`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_4`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_5`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_6`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_7`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_8`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_9`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_10`      | Is a scenario flag                                                            |
| `ET_flag_global_scenario_11`      | Is a scenario flag                                                            |
| `ET_flag_global_scenario_12`      | Is a scenario flag                                                            |
