# Scenario Documentation

## Avalible Scenarios
Scenarios is the corner stone of this mod. When the war is comming to a close a scenario will be selected for you. This is based on sertain parameters if nations exist hwo got defeated as well as what government countries have.

### Unknown World 
When you there are no fitting scenario this senario is selected.

*Scenario_ID: 0*

### The Cold War
The world have beaten the axis and it is time to divide Europe between the victories powers. Soviet to the East and the Allies to the West. Navigate the Cold War in a authentic Hoi4 style avoid the inevitable looming war or throw your self and defend the right of your existence in a full scale war.

**How do I get this scenario?** Try play historically and make sure Germany and Japan are defeated. The scenario gets enabled after the final peace conference. 

*Scenario_ID: 1*

### A Fascist World
Germany stand victorious against the allied powers proving the superiority of the German Rich. Germany have manage to extend it self from the Atlantic to the North Pacific. But a looming succession crisis is rising. Hitler is getting sicker and Germany now needs to decide on what way it should go.

The allied powers is broken. Following the surrender of United Kingdom the island nation have gone in to isolation. The United States and Canada in the Americas stands as the last bastions of democracy and freedom in the world. But a opportunity might soon present it self.

**How do I get this scenario?** Surrender to Germany as United Kingdom or United States. This option is a decision available when the Soviet Union capitulates. The AI may do this if war support and the war have going on for too long.

*Scenario_ID: 2*

## Development
The scenario picker is triggered on a peace conference when its triggered passed year 1945.

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
| Trigger                           | Description                                                                   | Scope    |
| ---                               | ---                                                                           | ---      |
| `ET_in_new_era`                   | Checks if the world is in the new era                                         | Global   |
| `ET_in_new_era_country`           | Checks if the world and country is in the new era                             | Country  |
| `ET_is_era_avalible_country`      | Checks if the world is in the new era and country can entre                   | Country  |
| `ET_has_scenario`                 | Check if you have any scenario                                                | Global   |
| `ET_has_scenario_none`            | Check if you have no scenario                                                 | Global   |
| `ET_has_scenario_0`               | Check if you have scenario 0                                                  | Global   |
| `ET_has_scenario_1`               | Check if you have scenario 1                                                  | Global   |
| `ET_has_scenario_2`               | Check if you have scenario 2                                                  | Global   |

### Localization

| Localization                      | Description                                                                   | Scope    |
| ---                               | ---                                                                           | ---      |
| `ET_getCurrentScenarioName`       | Writes your current scenario name                                             | Global   |
| `ET_Scenario_None_Name`           | Writes scenaro name                                                           | Global   |
| `ET_Scenario_0_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_1_Name`              | Writes scenaro name                                                           | Global   |
| `ET_Scenario_2_Name`              | Writes scenaro name                                                           | Global   |

### Flags
| Flags                             | Description                                                                   |
| ---                               | ---                                                                           |
| `ET_flag_country_newera`          | Added wen the country enter in to the new era (Used to controll focus trees)  |
| `ET_flag_global_newera`           | Added when the world enter in to the new era                                  |
| `ET_flag_global_scenario_0`       | Is scenario flag                                                              |
| `ET_flag_global_scenario_1`       | Is scenario flag                                                              |
| `ET_flag_global_scenario_2`       | Is scenario flag                                                              |
