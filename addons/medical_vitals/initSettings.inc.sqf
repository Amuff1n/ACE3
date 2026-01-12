[
    QGVAR(simulateSpO2),
    "CHECKBOX",
    [LSTRING(simulateSpO2_DisplayName), LSTRING(simulateSpO2_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    1,
    {
        if (_this) exitWith {}; // skip if true
        {
            _x setVariable [VAR_OXYGEN_DEMAND, 0, true];
            _x setVariable [VAR_SPO2, DEFAULT_SPO2, true];
        } forEach (allUnits select {local _x})
    } // reset oxygen demand on setting change
] call CBA_fnc_addSetting;

[
    QGVAR(simulateBloodRegen),
    "LIST",
    [LSTRING(simulateBloodRegen_DisplayName), LSTRING(simulateBloodRegen_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [
        [0, 1, 2],
        ["STR_A3_OPTIONS_DISABLED", ELSTRING(common,playerOnly), ELSTRING(common,playersAndAI)],
        1
    ],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bloodRegenRate),
    "SLIDER",
    [LSTRING(bloodRegenRate_DisplayName), LSTRING(bloodRegenRate_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [0, 1000, 1, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(requireNoBleeding),
    "CHECKBOX",
    [LSTRING(requireNoBleeding_DisplayName), LSTRING(requireNoBleeding_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(requireHeartRate),
    "CHECKBOX",
    [LSTRING(requireHeartRate_DisplayName), LSTRING(requireHeartRate_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(requireStableVitals),
    "CHECKBOX",
    [LSTRING(requireStableVitals_DisplayName), LSTRING(requireStableVitals_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(requireConsciousness),
    "CHECKBOX",
    [LSTRING(requireConsciousness_DisplayName), LSTRING(requireConsciousness_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    false,
    1
] call CBA_fnc_addSetting;
