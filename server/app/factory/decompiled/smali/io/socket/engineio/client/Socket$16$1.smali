.class Lio/socket/engineio/client/Socket$16$1;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/Socket$16;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/engineio/client/Socket$16;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket$16;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/engineio/client/Socket$16;

    .line 587
    iput-object p1, p0, Lio/socket/engineio/client/Socket$16$1;->this$1:Lio/socket/engineio/client/Socket$16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 590
    iget-object v0, p0, Lio/socket/engineio/client/Socket$16$1;->this$1:Lio/socket/engineio/client/Socket$16;

    iget-object v0, v0, Lio/socket/engineio/client/Socket$16;->this$0:Lio/socket/engineio/client/Socket;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "ping"

    invoke-virtual {v0, v2, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 591
    return-void
.end method
