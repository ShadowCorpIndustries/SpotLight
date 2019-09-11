.class Lio/socket/client/Socket$7$1;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Socket$7;->call([Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/client/Socket$7;

.field final synthetic val$args:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Lio/socket/client/Socket$7;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/client/Socket$7;

    .line 352
    iput-object p1, p0, Lio/socket/client/Socket$7$1;->this$1:Lio/socket/client/Socket$7;

    iput-object p2, p0, Lio/socket/client/Socket$7$1;->val$args:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 355
    iget-object v0, p0, Lio/socket/client/Socket$7$1;->this$1:Lio/socket/client/Socket$7;

    iget-object v0, v0, Lio/socket/client/Socket$7;->val$sent:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_0

    return-void

    .line 356
    :cond_0
    iget-object v0, p0, Lio/socket/client/Socket$7$1;->this$1:Lio/socket/client/Socket$7;

    iget-object v0, v0, Lio/socket/client/Socket$7;->val$sent:[Z

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    .line 357
    invoke-static {}, Lio/socket/client/Socket;->access$800()Ljava/util/logging/Logger;

    move-result-object v0

    iget-object v2, p0, Lio/socket/client/Socket$7$1;->val$args:[Ljava/lang/Object;

    array-length v3, v2

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    const-string v3, "sending ack %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 359
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 360
    .local v0, "jsonArgs":Lorg/json/JSONArray;
    iget-object v2, p0, Lio/socket/client/Socket$7$1;->val$args:[Ljava/lang/Object;

    array-length v3, v2

    :goto_1
    if-ge v1, v3, :cond_2

    aget-object v4, v2, v1

    .line 361
    .local v4, "arg":Ljava/lang/Object;
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 360
    .end local v4    # "arg":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 364
    :cond_2
    invoke-static {v0}, Lio/socket/hasbinary/HasBinary;->hasBinary(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x6

    goto :goto_2

    :cond_3
    const/4 v1, 0x3

    .line 366
    .local v1, "type":I
    :goto_2
    new-instance v2, Lio/socket/parser/Packet;

    invoke-direct {v2, v1, v0}, Lio/socket/parser/Packet;-><init>(ILjava/lang/Object;)V

    .line 367
    .local v2, "packet":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Lorg/json/JSONArray;>;"
    iget-object v3, p0, Lio/socket/client/Socket$7$1;->this$1:Lio/socket/client/Socket$7;

    iget v3, v3, Lio/socket/client/Socket$7;->val$id:I

    iput v3, v2, Lio/socket/parser/Packet;->id:I

    .line 368
    iget-object v3, p0, Lio/socket/client/Socket$7$1;->this$1:Lio/socket/client/Socket$7;

    iget-object v3, v3, Lio/socket/client/Socket$7;->val$self:Lio/socket/client/Socket;

    invoke-static {v3, v2}, Lio/socket/client/Socket;->access$1100(Lio/socket/client/Socket;Lio/socket/parser/Packet;)V

    .line 369
    return-void
.end method
