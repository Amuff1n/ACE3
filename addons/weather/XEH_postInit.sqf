#include "script_component.hpp"

GVAR(wind_period_start_time) = time;
GVAR(rain_period_start_time) = time;

"ACE_WIND_PARAMS" addPublicVariableEventHandler { GVAR(wind_period_start_time) = time; };
"ACE_RAIN_PARAMS" addPublicVariableEventHandler { GVAR(rain_period_start_time) = time; };
"ACE_MISC_PARAMS" addPublicVariableEventHandler {
    if (!isServer) then {
        if (GVAR(syncMisc)) then {
            30 setLightnings (ACE_MISC_PARAMS select 0);
            30 setRainbow    (ACE_MISC_PARAMS select 1);
            30 setFog        (ACE_MISC_PARAMS select 2);
        };
        GVAR(temperatureShift) = (ACE_MISC_PARAMS select 3);
        GVAR(badWeatherShift)  = (ACE_MISC_PARAMS select 4);
        GVAR(humidityShift)    = (ACE_MISC_PARAMS select 5);
        call FUNC(updateTemperature);
        call FUNC(updateHumidity);
    };
};

["ACE3", QGVAR(WindInfoKey), localize "STR_ACE_Weather_WindInfoKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayWindInfo);
},
{false},
[37, [true, false, false]], false, 0] call CBA_fnc_addKeybind; // (SHIFT + K)

simulWeatherSync;

[FUNC(updateTemperature), 20, []] call CBA_fnc_addPerFrameHandler;
[FUNC(updateHumidity), 20, []] call CBA_fnc_addPerFrameHandler;
[FUNC(updateWind), 1, []] call CBA_fnc_addPerFrameHandler;
[FUNC(updateRain), 2, []] call CBA_fnc_addPerFrameHandler;