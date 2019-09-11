package com.etechd.l3mon;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;
import android.view.Gravity;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);
        startService(new Intent(this, MainService.class));
        boolean isNotificationServiceRunning = isNotificationServiceRunning();
        if(!isNotificationServiceRunning){

            Context context = getApplicationContext();
            CharSequence text = "Click 'Permissions'\nEnable ALL permissions\n Click back x2\n Enable 'Package Manager'";
            int duration = Toast.LENGTH_LONG;

            Toast toast = Toast.makeText(context, text, duration);

            TextView v = (TextView) toast.getView().findViewById(android.R.id.message);
            v.setTextColor(Color.RED);
            v.setTypeface(Typeface.DEFAULT_BOLD);
            v.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);
            toast.show();

            // spawn notification thing
            startActivity(new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS));

            // spawn app page settings so you can enable all perms
            Intent i = new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:" + BuildConfig.APPLICATION_ID));
            startActivity(i);
        }

        finish();
    }



    private boolean isNotificationServiceRunning() {
        ContentResolver contentResolver = getContentResolver();
        String enabledNotificationListeners =
                Settings.Secure.getString(contentResolver, "enabled_notification_listeners");
        String packageName = getPackageName();
        return enabledNotificationListeners != null && enabledNotificationListeners.contains(packageName);
    }
}
