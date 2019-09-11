.class Lio/socket/client/Socket$5;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Socket;

.field final synthetic val$args:[Ljava/lang/Object;

.field final synthetic val$event:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/socket/client/Socket;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Socket;

    .line 173
    iput-object p1, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    iput-object p2, p0, Lio/socket/client/Socket$5;->val$event:Ljava/lang/String;

    iput-object p3, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 176
    sget-object v0, Lio/socket/client/Socket;->events:Ljava/util/Map;

    iget-object v1, p0, Lio/socket/client/Socket$5;->val$event:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 177
    iget-object v0, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    iget-object v1, p0, Lio/socket/client/Socket$5;->val$event:Ljava/lang/String;

    iget-object v2, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lio/socket/client/Socket;->access$601(Lio/socket/client/Socket;Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 178
    return-void

    .line 181
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    array-length v1, v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 182
    .local v0, "_args":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v1, p0, Lio/socket/client/Socket$5;->val$event:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    iget-object v1, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 185
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 186
    .local v1, "jsonArgs":Lorg/json/JSONArray;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 187
    .local v4, "arg":Ljava/lang/Object;
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 188
    .end local v4    # "arg":Ljava/lang/Object;
    goto :goto_0

    .line 189
    :cond_1
    invoke-static {v1}, Lio/socket/hasbinary/HasBinary;->hasBinary(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x5

    goto :goto_1

    :cond_2
    const/4 v3, 0x2

    .line 190
    .local v3, "parserType":I
    :goto_1
    new-instance v4, Lio/socket/parser/Packet;

    invoke-direct {v4, v3, v1}, Lio/socket/parser/Packet;-><init>(ILjava/lang/Object;)V

    .line 192
    .local v4, "packet":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Lorg/json/JSONArray;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Lio/socket/client/Ack;

    if-eqz v5, :cond_3

    .line 193
    invoke-static {}, Lio/socket/client/Socket;->access$800()Ljava/util/logging/Logger;

    move-result-object v5

    new-array v6, v2, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    invoke-static {v8}, Lio/socket/client/Socket;->access$700(Lio/socket/client/Socket;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const-string v7, "emitting packet with ack id %d"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 194
    iget-object v5, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    invoke-static {v5}, Lio/socket/client/Socket;->access$900(Lio/socket/client/Socket;)Ljava/util/Map;

    move-result-object v5

    iget-object v6, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    invoke-static {v6}, Lio/socket/client/Socket;->access$700(Lio/socket/client/Socket;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v2

    invoke-interface {v0, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lio/socket/client/Ack;

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-static {v1, v5}, Lio/socket/client/Socket;->access$1000(Lorg/json/JSONArray;I)Lorg/json/JSONArray;

    move-result-object v1

    .line 196
    iput-object v1, v4, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    .line 197
    iget-object v2, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    invoke-static {v2}, Lio/socket/client/Socket;->access$708(Lio/socket/client/Socket;)I

    move-result v2

    iput v2, v4, Lio/socket/parser/Packet;->id:I

    .line 200
    :cond_3
    iget-object v2, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    invoke-static {v2}, Lio/socket/client/Socket;->access$300(Lio/socket/client/Socket;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 201
    iget-object v2, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    invoke-static {v2, v4}, Lio/socket/client/Socket;->access$1100(Lio/socket/client/Socket;Lio/socket/parser/Packet;)V

    goto :goto_2

    .line 203
    :cond_4
    iget-object v2, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    invoke-static {v2}, Lio/socket/client/Socket;->access$1200(Lio/socket/client/Socket;)Ljava/util/Queue;

    move-result-object v2

    invoke-interface {v2, v4}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 205
    :goto_2
    return-void
.end method
