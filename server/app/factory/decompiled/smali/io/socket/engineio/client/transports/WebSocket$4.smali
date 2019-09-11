.class Lio/socket/engineio/client/transports/WebSocket$4;
.super Ljava/lang/Object;
.source "WebSocket.java"

# interfaces
.implements Lio/socket/engineio/parser/Parser$EncodeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/WebSocket;->write([Lio/socket/engineio/parser/Packet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/WebSocket;

.field final synthetic val$done:Ljava/lang/Runnable;

.field final synthetic val$self:Lio/socket/engineio/client/transports/WebSocket;

.field final synthetic val$total:[I


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/WebSocket;Lio/socket/engineio/client/transports/WebSocket;[ILjava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/engineio/client/transports/WebSocket;

    .line 169
    iput-object p1, p0, Lio/socket/engineio/client/transports/WebSocket$4;->this$0:Lio/socket/engineio/client/transports/WebSocket;

    iput-object p2, p0, Lio/socket/engineio/client/transports/WebSocket$4;->val$self:Lio/socket/engineio/client/transports/WebSocket;

    iput-object p3, p0, Lio/socket/engineio/client/transports/WebSocket$4;->val$total:[I

    iput-object p4, p0, Lio/socket/engineio/client/transports/WebSocket$4;->val$done:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)V
    .locals 3
    .param p1, "packet"    # Ljava/lang/Object;

    .line 173
    :try_start_0
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket$4;->val$self:Lio/socket/engineio/client/transports/WebSocket;

    invoke-static {v0}, Lio/socket/engineio/client/transports/WebSocket;->access$500(Lio/socket/engineio/client/transports/WebSocket;)Lokhttp3/WebSocket;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v1}, Lokhttp3/WebSocket;->send(Ljava/lang/String;)Z

    goto :goto_0

    .line 175
    :cond_0
    instance-of v0, p1, [B

    if-eqz v0, :cond_1

    .line 176
    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket$4;->val$self:Lio/socket/engineio/client/transports/WebSocket;

    invoke-static {v0}, Lio/socket/engineio/client/transports/WebSocket;->access$500(Lio/socket/engineio/client/transports/WebSocket;)Lokhttp3/WebSocket;

    move-result-object v0

    move-object v1, p1

    check-cast v1, [B

    check-cast v1, [B

    invoke-static {v1}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v1

    invoke-interface {v0, v1}, Lokhttp3/WebSocket;->send(Lokio/ByteString;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    :cond_1
    :goto_0
    goto :goto_1

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-static {}, Lio/socket/engineio/client/transports/WebSocket;->access$600()Ljava/util/logging/Logger;

    move-result-object v1

    const-string v2, "websocket closed before we could write"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 182
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :goto_1
    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket$4;->val$total:[I

    const/4 v1, 0x0

    aget v2, v0, v1

    add-int/lit8 v2, v2, -0x1

    aput v2, v0, v1

    if-nez v2, :cond_2

    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket$4;->val$done:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 183
    :cond_2
    return-void
.end method
