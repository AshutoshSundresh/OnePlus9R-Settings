package com.oneplus.settings.highpowerapp;

import java.util.List;

public interface IMyActivityManager {
    List<HighPowerApp> getBgPowerHungryList();

    void setBgMonitorMode(boolean z);

    void stopBgPowerHungryApp(String str, int i);
}
