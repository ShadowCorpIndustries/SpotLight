.class Lio/socket/engineio/client/Socket$9;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/Socket;->probe(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/Socket;

.field final synthetic val$freezeTransport:Lio/socket/emitter/Emitter$Listener;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$self:Lio/socket/engineio/client/Socket;

.field final synthetic val$transport:[Lio/socket/engineio/client/Transport;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;Ljava/lang/String;Lio/socket/engineio/client/Socket;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/engineio/client/Socket;

    .line 405
    iput-object p1, p0, Lio/socket/engineio/client/Socket$9;->this$0:Lio/socket/engineio/client/Socket;

    iput-object p2, p0, Lio/socket/engineio/client/Socket$9;->val$transport:[Lio/socket/engineio/client/Transport;

    iput-object p3, p0, Lio/socket/engineio/client/Socket$9;->val$freezeTransport:Lio/socket/emitter/Emitter$Listener;

    iput-object p4, p0, Lio/socket/engineio/client/Socket$9;->val$name:Ljava/lang/String;

    iput-object p5, p0, Lio/socket/engineio/client/Socket$9;->val$self:Lio/socket/engineio/client/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 7
    .param p1, "args"    # [Ljava/lang/Object;

    .line 408
    const/4 v0, 0x0

    aget-object v1, p1, v0

    .line 410
    .local v1, "err":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/Exception;

    const-string v3, "probe error"

    if-eqz v2, :cond_0

    .line 411
    new-instance v2, Lio/socket/engineio/client/EngineIOException;

    move-object v4, v1

    check-cast v4, Ljava/lang/Exception;

    invoke-direct {v2, v3, v4}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .local v2, "error":Lio/socket/engineio/client/EngineIOException;
    goto :goto_0

    .line 412
    .end local v2    # "error":Lio/socket/engineio/client/EngineIOException;
    :cond_0
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 413
    new-instance v2, Lio/socket/engineio/client/EngineIOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "probe error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;)V

    .restart local v2    # "error":Lio/socket/engineio/client/EngineIOException;
    goto :goto_0

    .line 415
    .end local v2    # "error":Lio/socket/engineio/client/EngineIOException;
    :cond_1
    new-instance v2, Lio/socket/engineio/client/EngineIOException;

    invoke-direct {v2, v3}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;)V

    .line 417
    .restart local v2    # "error":Lio/socket/engineio/client/EngineIOException;
    :goto_0
    iget-object v3, p0, Lio/socket/engineio/client/Socket$9;->val$transport:[Lio/socket/engineio/client/Transport;

    aget-object v3, v3, v0

    iget-object v3, v3, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    iput-object v3, v2, Lio/socket/engineio/client/EngineIOException;->transport:Ljava/lang/String;

    .line 419
    iget-object v3, p0, Lio/socket/engineio/client/Socket$9;->val$freezeTransport:Lio/socket/emitter/Emitter$Listener;

    new-array v4, v0, [Ljava/lang/Object;

    invoke-interface {v3, v4}, Lio/socket/emitter/Emitter$Listener;->call([Ljava/lang/Object;)V

    .line 421
    invoke-static {}, Lio/socket/engineio/client/Socket;->access$1200()Ljava/util/logging/Logger;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lio/socket/engineio/client/Socket$9;->val$name:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v5, 0x1

    aput-object v1, v4, v5

    const-string v6, "probe transport \"%s\" failed because of error: %s"

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 423
    iget-object v3, p0, Lio/socket/engineio/client/Socket$9;->val$self:Lio/socket/engineio/client/Socket;

    new-array v4, v5, [Ljava/lang/Object;

    aput-object v2, v4, v0

    const-string v0, "upgradeError"

    invoke-virtual {v3, v0, v4}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 424
    return-void
.end method
