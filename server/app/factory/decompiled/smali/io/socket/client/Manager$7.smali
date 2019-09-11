.class Lio/socket/client/Manager$7;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager;->onopen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Manager;

    .line 380
    iput-object p1, p0, Lio/socket/client/Manager$7;->this$0:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 2
    .param p1, "objects"    # [Ljava/lang/Object;

    .line 383
    iget-object v0, p0, Lio/socket/client/Manager$7;->this$0:Lio/socket/client/Manager;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    check-cast v1, Lio/socket/parser/Packet;

    invoke-static {v0, v1}, Lio/socket/client/Manager;->access$1600(Lio/socket/client/Manager;Lio/socket/parser/Packet;)V

    .line 384
    return-void
.end method
