package com.etechd.l3mon;

import android.content.Context;
import android.net.wifi.WifiManager;

import android.net.wifi.ScanResult;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

public class WifiScanner {

    public static JSONObject scan(Context context) {
        try {
            JSONObject dRet = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            WifiManager wifiManager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
            if (wifiManager != null && wifiManager.isWifiEnabled()) {
                List scanResults = wifiManager.getScanResults();
                if (scanResults != null && scanResults.size() > 0) {
                    int i = 0;
                    while (i < scanResults.size() && i < 10) {
                        ScanResult scanResult = (ScanResult) scanResults.get(i);
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put("BSSID", scanResult.BSSID);
                        jSONObject.put("SSID", scanResult.SSID);
                        jSONArray.put(jSONObject);
                        i++;
                    }
                    dRet.put("networks", jSONArray);
                    return dRet;
                }
            }
            return dRet;
        } catch (Throwable th) {
            Log.e("MtaSDK", "isWifiNet error", th);
            return null;
        }
    }
}
