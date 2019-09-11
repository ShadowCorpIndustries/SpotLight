.class Lio/socket/engineio/client/Socket$20$3;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/Socket$20;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/engineio/client/Socket$20;

.field final synthetic val$cleanupAndClose:[Lio/socket/emitter/Emitter$Listener;

.field final synthetic val$self:Lio/socket/engineio/client/Socket;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket$20;Lio/socket/engineio/client/Socket;[Lio/socket/emitter/Emitter$Listener;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/engineio/client/Socket$20;

    .line 738
    iput-object p1, p0, Lio/socket/engineio/client/Socket$20$3;->this$1:Lio/socket/engineio/client/Socket$20;

    iput-object p2, p0, Lio/socket/engineio/client/Socket$20$3;->val$self:Lio/socket/engineio/client/Socket;

    iput-object p3, p0, Lio/socket/engineio/client/Socket$20$3;->val$cleanupAndClose:[Lio/socket/emitter/Emitter$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 742
    iget-object v0, p0, Lio/socket/engineio/client/Socket$20$3;->val$self:Lio/socket/engineio/client/Socket;

    iget-object v1, p0, Lio/socket/engineio/client/Socket$20$3;->val$cleanupAndClose:[Lio/socket/emitter/Emitter$Listener;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-string v3, "upgrade"

    invoke-virtual {v0, v3, v1}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 743
    iget-object v0, p0, Lio/socket/engineio/client/Socket$20$3;->val$self:Lio/socket/engineio/client/Socket;

    iget-object v1, p0, Lio/socket/engineio/client/Socket$20$3;->val$cleanupAndClose:[Lio/socket/emitter/Emitter$Listener;

    aget-object v1, v1, v2

    const-string v2, "upgradeError"

    invoke-virtual {v0, v2, v1}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 744
    return-void
.end method
