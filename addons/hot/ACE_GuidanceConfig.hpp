class EGVAR(missileguidance,AttackProfiles) {
    class WIRE {
        name = CSTRING(missileType);
        visualName = CSTRING(missileType);
        description = CSTRING(missileType_Description);

        functionName = QFUNC(attackProfile_WIRE);
        onFired = QFUNC(wire_onFired);
    };
};
class EGVAR(missileguidance,SeekerTypes) {
    class SACLOS {
        name = "SACLOS";
        visualName = "SACLOS";
        description = CSTRING(SACLOS_Description);

        functionName = QFUNC(seekerType_SACLOS);
        onFired = QFUNC(SACLOS_onFired);
    };
};

