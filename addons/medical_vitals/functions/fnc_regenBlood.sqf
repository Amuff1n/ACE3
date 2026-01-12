#include "..\script_component.hpp"
/*
 * Author: Thoreaufare
 * Calculates blood regeneration.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 *
 * Return Value:
 * Blood volume change (liters per second) <NUMBER>
 *
 * Example:
 * [player, 1] call ace_medical_vitals_regenBlood
 *
 * Public: No
 */

params ["_unit", "_deltaT"];

// Check for conditions that may prevent blood regeneration based on settings
if (GVAR(simulateBloodRegen) > 0 && {isPlayer _unit || GVAR(simulateBloodRegen) == 2}) exitWith {0};
if (GVAR(requireClosedWounds) && {IS_BLEEDING(_unit)}) exitWith {0};
if (GVAR(requireHeartRate) && {IN_CRDC_ARRST(_unit)}) exitWith {0};
if (GVAR(requireStableVitals) && {!(_unit call EFUNC(medical_status,hasStableVitals))}) exitWith {0};
if (GVAR(requireConsciousness) && {IS_UNCONSCIOUS(_unit)}) exitWith {0};

private _bloodVolumeChange = 0;

_bloodVolumeChange = (_deltaT * EGVAR(medical_vitals, bloodRegenRate) * BLOOD_REGEN_PER_SECOND);

_bloodVolumeChange // return
