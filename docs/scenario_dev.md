# Scenario framework
*[back](index)*

- **Unknown World** *(Scenario_ID: 0)*
- **The Cold War** *(Scenario_ID: 1)*
- **A Fascist World** *(Scenario_ID: 2)*
- **A Asian Giant** *(Scenario_ID: 3)*

## Effetcs Triggers, Flags, Localization

### Adding a Scenaro
1. Have a idea on what the scenario should be and be about.
2. Create the trigger for the scenario to be triggerd. This can be a a specific event or if a nation exist not.
   The Cold War scenario requires the wolrd to be at peace and that germany and japan is annexed or poppeted the yalta conference to have been taken place.
3. TBD

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

### Localization

| Localization                      | Description                                                                   | Scope    |
| ---                               | ---                                                                           | ---      |
| `ET_getCurrentScenarioName`       | Writes your current scenario name                                             | Global   |
| `ET_Scenario_None_Name`           | Writes scenaro name                                                           | Global   |
| `ET_Scenario_0_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_1_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_2_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_3_Name`              | Writes scenaro name                                                           | Global   |

### Flags

| Flags                             | Description                                                                   |
| ---                               | ---                                                                           |
| `ET_flag_country_newera`          | Added wen the country enter in to the new era (Used to controll focus trees)  |
| `ET_flag_global_newera`           | Added when the world enter in to the new era                                  |
| `ET_flag_global_scenario_0`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_1`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_2`       | Is a scenario flag                                                            |
| `ET_flag_global_scenario_3`       | Is a scenario flag                                                            |
