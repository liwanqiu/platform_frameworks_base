/*
 * Copyright (C) 2016 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.net.wifi.nan;

import android.app.PendingIntent;

import android.net.wifi.nan.ConfigRequest;
import android.net.wifi.nan.IWifiNanDiscoverySessionCallback;
import android.net.wifi.nan.IWifiNanEventCallback;
import android.net.wifi.nan.PublishConfig;
import android.net.wifi.nan.SubscribeConfig;
import android.net.wifi.RttManager;

/**
 * Interface that WifiNanService implements
 *
 * {@hide}
 */
interface IWifiNanManager
{
    // NAN API
    void enableUsage();
    void disableUsage();
    boolean isUsageEnabled();

    // client API
    void connect(in IBinder binder, in String callingPackage, in IWifiNanEventCallback callback,
            in ConfigRequest configRequest, boolean notifyOnIdentityChanged);
    void disconnect(int clientId, in IBinder binder);

    void publish(int clientId, in PublishConfig publishConfig,
            in IWifiNanDiscoverySessionCallback callback);
    void subscribe(int clientId, in SubscribeConfig subscribeConfig,
            in IWifiNanDiscoverySessionCallback callback);

    // session API
    void updatePublish(int clientId, int discoverySessionId, in PublishConfig publishConfig);
    void updateSubscribe(int clientId, int discoverySessionId, in SubscribeConfig subscribeConfig);
    void sendMessage(int clientId, int discoverySessionId, int peerId, in byte[] message, int messageId,
        int retryCount);
    void terminateSession(int clientId, int discoverySessionId);
    int startRanging(int clientId, int discoverySessionId, in RttManager.ParcelableRttParams parms);
}
