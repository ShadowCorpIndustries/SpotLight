.class Lio/socket/engineio/client/transports/Polling$1;
.super Ljava/lang/Object;
.source "Polling.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/Polling;->pause(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/Polling;

.field final synthetic val$onPause:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/Polling;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/engineio/client/transports/Polling;

    .line 39
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    iput-object p2, p0, Lio/socket/engineio/client/transports/Polling$1;->val$onPause:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 42
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    .line 44
    .local v0, "self":Lio/socket/engineio/client/transports/Polling;
    iget-object v1, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    sget-object v2, Lio/socket/engineio/client/Transport$ReadyState;->PAUSED:Lio/socket/engineio/client/Transport$ReadyState;

    invoke-static {v1, v2}, Lio/socket/engineio/client/transports/Polling;->access$002(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/Transport$ReadyState;)Lio/socket/engineio/client/Transport$ReadyState;

    .line 46
    new-instance v1, Lio/socket/engineio/client/transports/Polling$1$1;

    invoke-direct {v1, p0, v0}, Lio/socket/engineio/client/transports/Polling$1$1;-><init>(Lio/socket/engineio/client/transports/Polling$1;Lio/socket/engineio/client/transports/Polling;)V

    .line 55
    .local v1, "pause":Ljava/lang/Runnable;
    iget-object v2, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    invoke-static {v2}, Lio/socket/engineio/client/transports/Polling;->access$300(Lio/socket/engineio/client/transports/Polling;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    iget-boolean v2, v2, Lio/socket/engineio/client/transports/Polling;->writable:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 86
    :cond_0
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 56
    :cond_1
    :goto_0
    const/4 v2, 0x1

    new-array v3, v2, [I

    const/4 v4, 0x0

    aput v4, v3, v4

    .line 58
    .local v3, "total":[I
    iget-object v5, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    invoke-static {v5}, Lio/socket/engineio/client/transports/Polling;->access$300(Lio/socket/engineio/client/transports/Polling;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 59
    invoke-static {}, Lio/socket/engineio/client/transports/Polling;->access$100()Ljava/util/logging/Logger;

    move-result-object v5

    const-string v6, "we are currently polling - waiting to pause"

    invoke-virtual {v5, v6}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 60
    aget v5, v3, v4

    add-int/2addr v5, v2

    aput v5, v3, v4

    .line 61
    iget-object v5, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    new-instance v6, Lio/socket/engineio/client/transports/Polling$1$2;

    invoke-direct {v6, p0, v3, v1}, Lio/socket/engineio/client/transports/Polling$1$2;-><init>(Lio/socket/engineio/client/transports/Polling$1;[ILjava/lang/Runnable;)V

    const-string v7, "pollComplete"

    invoke-virtual {v5, v7, v6}, Lio/socket/engineio/client/transports/Polling;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 72
    :cond_2
    iget-object v5, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    iget-boolean v5, v5, Lio/socket/engineio/client/transports/Polling;->writable:Z

    if-nez v5, :cond_3

    .line 73
    invoke-static {}, Lio/socket/engineio/client/transports/Polling;->access$100()Ljava/util/logging/Logger;

    move-result-object v5

    const-string v6, "we are currently writing - waiting to pause"

    invoke-virtual {v5, v6}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 74
    aget v5, v3, v4

    add-int/2addr v5, v2

    aput v5, v3, v4

    .line 75
    iget-object v2, p0, Lio/socket/engineio/client/transports/Polling$1;->this$0:Lio/socket/engineio/client/transports/Polling;

    new-instance v4, Lio/socket/engineio/client/transports/Polling$1$3;

    invoke-direct {v4, p0, v3, v1}, Lio/socket/engineio/client/transports/Polling$1$3;-><init>(Lio/socket/engineio/client/transports/Polling$1;[ILjava/lang/Runnable;)V

    const-string v5, "drain"

    invoke-virtual {v2, v5, v4}, Lio/socket/engineio/client/transports/Polling;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 85
    .end local v3    # "total":[I
    :cond_3
    nop

    .line 88
    :goto_1
    return-void
.end method
