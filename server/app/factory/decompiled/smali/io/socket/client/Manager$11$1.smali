.class Lio/socket/client/Manager$11$1;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager$11;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/client/Manager$11;


# direct methods
.method constructor <init>(Lio/socket/client/Manager$11;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/client/Manager$11;

    .line 547
    iput-object p1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 550
    iget-object v0, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v0, v0, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-static {v0}, Lio/socket/client/Manager;->access$300(Lio/socket/client/Manager;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 552
    :cond_0
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, "attempting reconnect"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 553
    iget-object v0, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v0, v0, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-static {v0}, Lio/socket/client/Manager;->access$2000(Lio/socket/client/Manager;)Lio/socket/backo/Backoff;

    move-result-object v0

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    .line 554
    .local v0, "attempts":I
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "reconnect_attempt"

    invoke-static {v1, v4, v3}, Lio/socket/client/Manager;->access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 555
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    const-string v3, "reconnecting"

    invoke-static {v1, v3, v2}, Lio/socket/client/Manager;->access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 558
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$300(Lio/socket/client/Manager;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 560
    :cond_1
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    new-instance v2, Lio/socket/client/Manager$11$1$1;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$11$1$1;-><init>(Lio/socket/client/Manager$11$1;)V

    invoke-virtual {v1, v2}, Lio/socket/client/Manager;->open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;

    .line 574
    return-void
.end method
