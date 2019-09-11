.class public abstract Lio/socket/engineio/client/transports/Polling;
.super Lio/socket/engineio/client/Transport;
.source "Polling.java"


# static fields
.field public static final EVENT_POLL:Ljava/lang/String; = "poll"

.field public static final EVENT_POLL_COMPLETE:Ljava/lang/String; = "pollComplete"

.field public static final NAME:Ljava/lang/String; = "polling"

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private polling:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-class v0, Lio/socket/engineio/client/transports/Polling;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/Transport$Options;)V
    .locals 1
    .param p1, "opts"    # Lio/socket/engineio/client/Transport$Options;

    .line 30
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Transport;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    .line 31
    const-string v0, "polling"

    iput-object v0, p0, Lio/socket/engineio/client/transports/Polling;->name:Ljava/lang/String;

    .line 32
    return-void
.end method

.method private _onData(Ljava/lang/Object;)V
    .locals 6
    .param p1, "data"    # Ljava/lang/Object;

    .line 110
    move-object v0, p0

    .line 111
    .local v0, "self":Lio/socket/engineio/client/transports/Polling;
    sget-object v1, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const-string v5, "polling got data %s"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 112
    new-instance v1, Lio/socket/engineio/client/transports/Polling$2;

    invoke-direct {v1, p0, v0}, Lio/socket/engineio/client/transports/Polling$2;-><init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;)V

    .line 129
    .local v1, "callback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;
    instance-of v3, p1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 131
    move-object v3, v1

    .line 132
    .local v3, "tempCallback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<Ljava/lang/String;>;"
    move-object v5, p1

    check-cast v5, Ljava/lang/String;

    invoke-static {v5, v3}, Lio/socket/engineio/parser/Parser;->decodePayload(Ljava/lang/String;Lio/socket/engineio/parser/Parser$DecodePayloadCallback;)V

    .end local v3    # "tempCallback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<Ljava/lang/String;>;"
    goto :goto_0

    .line 133
    :cond_0
    instance-of v3, p1, [B

    if-eqz v3, :cond_1

    .line 134
    move-object v3, p1

    check-cast v3, [B

    check-cast v3, [B

    invoke-static {v3, v1}, Lio/socket/engineio/parser/Parser;->decodePayload([BLio/socket/engineio/parser/Parser$DecodePayloadCallback;)V

    goto :goto_1

    .line 133
    :cond_1
    :goto_0
    nop

    .line 137
    :goto_1
    iget-object v3, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v5, Lio/socket/engineio/client/Transport$ReadyState;->CLOSED:Lio/socket/engineio/client/Transport$ReadyState;

    if-eq v3, v5, :cond_3

    .line 138
    iput-boolean v4, p0, Lio/socket/engineio/client/transports/Polling;->polling:Z

    .line 139
    new-array v3, v4, [Ljava/lang/Object;

    const-string v5, "pollComplete"

    invoke-virtual {p0, v5, v3}, Lio/socket/engineio/client/transports/Polling;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 141
    iget-object v3, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v5, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    if-ne v3, v5, :cond_2

    .line 142
    invoke-direct {p0}, Lio/socket/engineio/client/transports/Polling;->poll()V

    goto :goto_2

    .line 144
    :cond_2
    sget-object v3, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    aput-object v5, v2, v4

    const-string v4, "ignoring poll - transport state \'%s\'"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 147
    :cond_3
    :goto_2
    return-void
.end method

.method static synthetic access$002(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/Transport$ReadyState;)Lio/socket/engineio/client/Transport$ReadyState;
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/Polling;
    .param p1, "x1"    # Lio/socket/engineio/client/Transport$ReadyState;

    .line 17
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    return-object p1
.end method

.method static synthetic access$100()Ljava/util/logging/Logger;
    .locals 1

    .line 17
    sget-object v0, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$202(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/Transport$ReadyState;)Lio/socket/engineio/client/Transport$ReadyState;
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/Polling;
    .param p1, "x1"    # Lio/socket/engineio/client/Transport$ReadyState;

    .line 17
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    return-object p1
.end method

.method static synthetic access$300(Lio/socket/engineio/client/transports/Polling;)Z
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/transports/Polling;

    .line 17
    iget-boolean v0, p0, Lio/socket/engineio/client/transports/Polling;->polling:Z

    return v0
.end method

.method static synthetic access$400(Lio/socket/engineio/client/transports/Polling;)Lio/socket/engineio/client/Transport$ReadyState;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/transports/Polling;

    .line 17
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    return-object v0
.end method

.method static synthetic access$500(Lio/socket/engineio/client/transports/Polling;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/Polling;

    .line 17
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/Polling;->onOpen()V

    return-void
.end method

.method static synthetic access$600(Lio/socket/engineio/client/transports/Polling;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/Polling;

    .line 17
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/Polling;->onClose()V

    return-void
.end method

.method static synthetic access$700(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/parser/Packet;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/Polling;
    .param p1, "x1"    # Lio/socket/engineio/parser/Packet;

    .line 17
    invoke-virtual {p0, p1}, Lio/socket/engineio/client/transports/Polling;->onPacket(Lio/socket/engineio/parser/Packet;)V

    return-void
.end method

.method private poll()V
    .locals 2

    .line 93
    sget-object v0, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    const-string v1, "polling"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 94
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/socket/engineio/client/transports/Polling;->polling:Z

    .line 95
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/Polling;->doPoll()V

    .line 96
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "poll"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/Polling;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 97
    return-void
.end method


# virtual methods
.method protected doClose()V
    .locals 4

    .line 150
    move-object v0, p0

    .line 152
    .local v0, "self":Lio/socket/engineio/client/transports/Polling;
    new-instance v1, Lio/socket/engineio/client/transports/Polling$3;

    invoke-direct {v1, p0, v0}, Lio/socket/engineio/client/transports/Polling$3;-><init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;)V

    .line 164
    .local v1, "close":Lio/socket/emitter/Emitter$Listener;
    iget-object v2, p0, Lio/socket/engineio/client/transports/Polling;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v3, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    if-ne v2, v3, :cond_0

    .line 165
    sget-object v2, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    const-string v3, "transport open - closing"

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 166
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v1, v2}, Lio/socket/emitter/Emitter$Listener;->call([Ljava/lang/Object;)V

    goto :goto_0

    .line 170
    :cond_0
    sget-object v2, Lio/socket/engineio/client/transports/Polling;->logger:Ljava/util/logging/Logger;

    const-string v3, "transport not open - deferring close"

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 171
    const-string v2, "open"

    invoke-virtual {p0, v2, v1}, Lio/socket/engineio/client/transports/Polling;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 173
    :goto_0
    return-void
.end method

.method protected doOpen()V
    .locals 0

    .line 35
    invoke-direct {p0}, Lio/socket/engineio/client/transports/Polling;->poll()V

    .line 36
    return-void
.end method

.method protected abstract doPoll()V
.end method

.method protected abstract doWrite([BLjava/lang/Runnable;)V
.end method

.method protected onData(Ljava/lang/String;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/String;

    .line 101
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/Polling;->_onData(Ljava/lang/Object;)V

    .line 102
    return-void
.end method

.method protected onData([B)V
    .locals 0
    .param p1, "data"    # [B

    .line 106
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/Polling;->_onData(Ljava/lang/Object;)V

    .line 107
    return-void
.end method

.method public pause(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "onPause"    # Ljava/lang/Runnable;

    .line 39
    new-instance v0, Lio/socket/engineio/client/transports/Polling$1;

    invoke-direct {v0, p0, p1}, Lio/socket/engineio/client/transports/Polling$1;-><init>(Lio/socket/engineio/client/transports/Polling;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 90
    return-void
.end method

.method protected uri()Ljava/lang/String;
    .locals 8

    .line 195
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling;->query:Ljava/util/Map;

    .line 196
    .local v0, "query":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 197
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v0, v1

    .line 199
    :cond_0
    iget-boolean v1, p0, Lio/socket/engineio/client/transports/Polling;->secure:Z

    const-string v2, "https"

    const-string v3, "http"

    if-eqz v1, :cond_1

    move-object v1, v2

    goto :goto_0

    :cond_1
    move-object v1, v3

    .line 200
    .local v1, "schema":Ljava/lang/String;
    :goto_0
    const-string v4, ""

    .line 202
    .local v4, "port":Ljava/lang/String;
    iget-boolean v5, p0, Lio/socket/engineio/client/transports/Polling;->timestampRequests:Z

    if-eqz v5, :cond_2

    .line 203
    iget-object v5, p0, Lio/socket/engineio/client/transports/Polling;->timestampParam:Ljava/lang/String;

    invoke-static {}, Lio/socket/yeast/Yeast;->yeast()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    :cond_2
    invoke-static {v0}, Lio/socket/parseqs/ParseQS;->encode(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    .line 208
    .local v5, "derivedQuery":Ljava/lang/String;
    iget v6, p0, Lio/socket/engineio/client/transports/Polling;->port:I

    const-string v7, ":"

    if-lez v6, :cond_5

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lio/socket/engineio/client/transports/Polling;->port:I

    const/16 v6, 0x1bb

    if-ne v2, v6, :cond_4

    .line 209
    :cond_3
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget v2, p0, Lio/socket/engineio/client/transports/Polling;->port:I

    const/16 v3, 0x50

    if-eq v2, v3, :cond_5

    .line 210
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lio/socket/engineio/client/transports/Polling;->port:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 213
    :cond_5
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_6

    .line 214
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 217
    :cond_6
    iget-object v2, p0, Lio/socket/engineio/client/transports/Polling;->hostname:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 218
    .local v2, "ipv6":Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "://"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v2, :cond_7

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lio/socket/engineio/client/transports/Polling;->hostname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_7
    iget-object v6, p0, Lio/socket/engineio/client/transports/Polling;->hostname:Ljava/lang/String;

    :goto_1
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lio/socket/engineio/client/transports/Polling;->path:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method protected write([Lio/socket/engineio/parser/Packet;)V
    .locals 3
    .param p1, "packets"    # [Lio/socket/engineio/parser/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .line 176
    move-object v0, p0

    .line 177
    .local v0, "self":Lio/socket/engineio/client/transports/Polling;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/socket/engineio/client/transports/Polling;->writable:Z

    .line 178
    new-instance v1, Lio/socket/engineio/client/transports/Polling$4;

    invoke-direct {v1, p0, v0}, Lio/socket/engineio/client/transports/Polling$4;-><init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;)V

    .line 186
    .local v1, "callbackfn":Ljava/lang/Runnable;
    new-instance v2, Lio/socket/engineio/client/transports/Polling$5;

    invoke-direct {v2, p0, v0, v1}, Lio/socket/engineio/client/transports/Polling$5;-><init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;Ljava/lang/Runnable;)V

    invoke-static {p1, v2}, Lio/socket/engineio/parser/Parser;->encodePayload([Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V

    .line 192
    return-void
.end method
