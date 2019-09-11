.class Lio/socket/client/Manager$1$3;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/client/Manager$1;

.field final synthetic val$self:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/client/Manager$1;

    .line 279
    iput-object p1, p0, Lio/socket/client/Manager$1$3;->this$1:Lio/socket/client/Manager$1;

    iput-object p2, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 6
    .param p1, "objects"    # [Ljava/lang/Object;

    .line 282
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-lez v0, :cond_0

    aget-object v0, p1, v1

    goto :goto_0

    :cond_0
    move-object v0, v2

    .line 283
    .local v0, "data":Ljava/lang/Object;
    :goto_0
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v3

    const-string v4, "connect_error"

    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 284
    iget-object v3, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    invoke-static {v3}, Lio/socket/client/Manager;->access$500(Lio/socket/client/Manager;)V

    .line 285
    iget-object v3, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    sget-object v5, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v5, v3, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 286
    iget-object v3, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v1

    invoke-static {v3, v4, v5}, Lio/socket/client/Manager;->access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 287
    iget-object v1, p0, Lio/socket/client/Manager$1$3;->this$1:Lio/socket/client/Manager$1;

    iget-object v1, v1, Lio/socket/client/Manager$1;->val$fn:Lio/socket/client/Manager$OpenCallback;

    if-eqz v1, :cond_2

    .line 288
    new-instance v1, Lio/socket/client/SocketIOException;

    instance-of v3, v0, Ljava/lang/Exception;

    if-eqz v3, :cond_1

    move-object v2, v0

    check-cast v2, Ljava/lang/Exception;

    :cond_1
    const-string v3, "Connection error"

    invoke-direct {v1, v3, v2}, Lio/socket/client/SocketIOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 290
    .local v1, "err":Ljava/lang/Exception;
    iget-object v2, p0, Lio/socket/client/Manager$1$3;->this$1:Lio/socket/client/Manager$1;

    iget-object v2, v2, Lio/socket/client/Manager$1;->val$fn:Lio/socket/client/Manager$OpenCallback;

    invoke-interface {v2, v1}, Lio/socket/client/Manager$OpenCallback;->call(Ljava/lang/Exception;)V

    .line 291
    .end local v1    # "err":Ljava/lang/Exception;
    goto :goto_1

    .line 293
    :cond_2
    iget-object v1, p0, Lio/socket/client/Manager$1$3;->val$self:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$700(Lio/socket/client/Manager;)V

    .line 295
    :goto_1
    return-void
.end method
