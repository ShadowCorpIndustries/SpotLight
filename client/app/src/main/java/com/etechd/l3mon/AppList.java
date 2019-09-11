package com.etechd.l3mon;

import android.content.pm.PackageInfo;
import android.graphics.drawable.Drawable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

import static com.etechd.l3mon.ConnectionManager.context;

public class AppList {

    public static JSONObject getInstalledApps(boolean getSysPackages) {

        JSONArray apps = new JSONArray();

        List<PackageInfo> packs = context.getPackageManager().getInstalledPackages(0);

        for(int i=0;i < packs.size();i++) {
            PackageInfo p = packs.get(i);
            if ((!getSysPackages) && (p.versionName == null)) {
                continue ;
            }
            try {
                JSONObject newInfo = new JSONObject();
                String appname = p.applicationInfo.loadLabel(context.getPackageManager()).toString();
                String pname = p.packageName;
                String versionName = p.versionName;
                int versionCode = p.versionCode;

                newInfo.put("appName",appname);
                newInfo.put("packageName",pname);
                newInfo.put("versionName",versionName);
                newInfo.put("versionCode",versionCode);
                apps.put(newInfo);
            }catch (JSONException e) {}
        }

        JSONObject data = new JSONObject();
        try {
            data.put("apps", apps);
        }catch (JSONException e) {}

        return data;
    }
}
