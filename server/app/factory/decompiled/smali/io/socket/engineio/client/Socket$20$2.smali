.class Lio/socket/engineio/client/Socket$20$2;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


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

.field final synthetic val$close:Ljava/lang/Runnable;

.field final synthetic val$self:Lio/socket/engineio/client/Socket;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/Socket$20;Lio/socket/engineio/client/Socket;[Lio/socket/emitter/Emitter$Listener;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/engineio/client/Socket$20;

    .line 729
    iput-object p1, p0, Lio/socket/engineio/client/Socket$20$2;->this$1:Lio/socket/engineio/client/Socket$20;

    iput-object p2, p0, Lio/socket/engineio/client/Socket$20$2;->val$self:Lio/socket/engineio/client/Socket;

    iput-object p3, p0, Lio/socket/engineio/client/Socket$20$2;->val$cleanupAndClose:[Lio/socket/emitter/Emitter$Listener;

    iput-object p4, p0, Lio/socket/engineio/client/Socket$20$2;->val$close:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 4
    .param p1, "args"    # [Ljava/lang/Object;

    .line 732
    iget-object v0, p0, Lio/socket/engineio/client/Socket$20$2;->val$self:Lio/socket/engineio/client/Socket;

    iget-object v1, p0, Lio/socket/engineio/client/Socket$20$2;->val$cleanupAndClose:[Lio/socket/emitter/Emitter$Listener;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-string v3, "upgrade"

    invoke-virtual {v0, v3, v1}, Lio/socket/engineio/client/Socket;->off(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 733
    iget-object v0, p0, Lio/socket/engineio/client/Socket$20$2;->val$self:Lio/socket/engineio/client/Socket;

    iget-object v1, p0, Lio/socket/engineio/client/Socket$20$2;->val$cleanupAndClose:[Lio/socket/emitter/Emitter$Listener;

    aget-object v1, v1, v2

    const-string v2, "upgradeError"

    invoke-virtual {v0, v2, v1}, Lio/socket/engineio/client/Socket;->off(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 734
    iget-object v0, p0, Lio/socket/engineio/client/Socket$20$2;->val$close:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 735
    return-void
.end method
