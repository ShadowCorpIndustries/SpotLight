.class Lio/socket/client/Socket$8;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Socket;->close()Lio/socket/client/Socket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Socket;


# direct methods
.method constructor <init>(Lio/socket/client/Socket;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Socket;

    .line 430
    iput-object p1, p0, Lio/socket/client/Socket$8;->this$0:Lio/socket/client/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 433
    iget-object v0, p0, Lio/socket/client/Socket$8;->this$0:Lio/socket/client/Socket;

    invoke-static {v0}, Lio/socket/client/Socket;->access$300(Lio/socket/client/Socket;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 434
    invoke-static {}, Lio/socket/client/Socket;->access$800()Ljava/util/logging/Logger;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lio/socket/client/Socket$8;->this$0:Lio/socket/client/Socket;

    invoke-static {v4}, Lio/socket/client/Socket;->access$1300(Lio/socket/client/Socket;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "performing disconnect (%s)"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 435
    iget-object v0, p0, Lio/socket/client/Socket$8;->this$0:Lio/socket/client/Socket;

    new-instance v2, Lio/socket/parser/Packet;

    invoke-direct {v2, v1}, Lio/socket/parser/Packet;-><init>(I)V

    invoke-static {v0, v2}, Lio/socket/client/Socket;->access$1100(Lio/socket/client/Socket;Lio/socket/parser/Packet;)V

    .line 438
    :cond_0
    iget-object v0, p0, Lio/socket/client/Socket$8;->this$0:Lio/socket/client/Socket;

    invoke-static {v0}, Lio/socket/client/Socket;->access$1400(Lio/socket/client/Socket;)V

    .line 440
    iget-object v0, p0, Lio/socket/client/Socket$8;->this$0:Lio/socket/client/Socket;

    invoke-static {v0}, Lio/socket/client/Socket;->access$300(Lio/socket/client/Socket;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 441
    iget-object v0, p0, Lio/socket/client/Socket$8;->this$0:Lio/socket/client/Socket;

    const-string v1, "io client disconnect"

    invoke-static {v0, v1}, Lio/socket/client/Socket;->access$200(Lio/socket/client/Socket;Ljava/lang/String;)V

    .line 443
    :cond_1
    return-void
.end method
