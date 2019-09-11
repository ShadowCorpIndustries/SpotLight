.class public Lio/socket/engineio/client/transports/WebSocket;
.super Lio/socket/engineio/client/Transport;
.source "WebSocket.java"


# static fields
.field public static final NAME:Ljava/lang/String; = "websocket"

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private ws:Lokhttp3/WebSocket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    const-class v0, Lio/socket/engineio/client/transports/PollingXHR;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/transports/WebSocket;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/Transport$Options;)V
    .locals 1
    .param p1, "opts"    # Lio/socket/engineio/client/Transport$Options;

    .line 33
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Transport;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    .line 34
    const-string v0, "websocket"

    iput-object v0, p0, Lio/socket/engineio/client/transports/WebSocket;->name:Ljava/lang/String;

    .line 35
    return-void
.end method

.method static synthetic access$000(Lio/socket/engineio/client/transports/WebSocket;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/WebSocket;

    .line 24
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/WebSocket;->onOpen()V

    return-void
.end method

.method static synthetic access$100(Lio/socket/engineio/client/transports/WebSocket;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/WebSocket;
    .param p1, "x1"    # Ljava/lang/String;

    .line 24
    invoke-virtual {p0, p1}, Lio/socket/engineio/client/transports/WebSocket;->onData(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lio/socket/engineio/client/transports/WebSocket;[B)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/WebSocket;
    .param p1, "x1"    # [B

    .line 24
    invoke-virtual {p0, p1}, Lio/socket/engineio/client/transports/WebSocket;->onData([B)V

    return-void
.end method

.method static synthetic access$300(Lio/socket/engineio/client/transports/WebSocket;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/WebSocket;

    .line 24
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/WebSocket;->onClose()V

    return-void
.end method

.method static synthetic access$400(Lio/socket/engineio/client/transports/WebSocket;Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/transports/WebSocket;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Exception;

    .line 24
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/transports/WebSocket;->onError(Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lio/socket/engineio/client/transports/WebSocket;)Lokhttp3/WebSocket;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/transports/WebSocket;

    .line 24
    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket;->ws:Lokhttp3/WebSocket;

    return-object v0
.end method

.method static synthetic access$600()Ljava/util/logging/Logger;
    .locals 1

    .line 24
    sget-object v0, Lio/socket/engineio/client/transports/WebSocket;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method


# virtual methods
.method protected doClose()V
    .locals 3

    .line 189
    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket;->ws:Lokhttp3/WebSocket;

    if-eqz v0, :cond_0

    .line 191
    const/16 v1, 0x3e8

    :try_start_0
    const-string v2, ""

    invoke-interface {v0, v1, v2}, Lokhttp3/WebSocket;->close(ILjava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    goto :goto_0

    .line 192
    :catch_0
    move-exception v0

    .line 196
    :cond_0
    :goto_0
    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket;->ws:Lokhttp3/WebSocket;

    if-eqz v0, :cond_1

    .line 197
    invoke-interface {v0}, Lokhttp3/WebSocket;->cancel()V

    .line 199
    :cond_1
    return-void
.end method

.method protected doOpen()V
    .locals 9

    .line 38
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 39
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v2, "requestHeaders"

    invoke-virtual {p0, v2, v1}, Lio/socket/engineio/client/transports/WebSocket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 41
    move-object v1, p0

    .line 42
    .local v1, "self":Lio/socket/engineio/client/transports/WebSocket;
    new-instance v2, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v2}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 44
    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 45
    invoke-virtual {v2, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 46
    invoke-virtual {v2, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    .line 48
    .local v2, "clientBuilder":Lokhttp3/OkHttpClient$Builder;
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->sslContext:Ljavax/net/ssl/SSLContext;

    if-eqz v3, :cond_0

    .line 49
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->sslContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    .line 50
    .local v3, "factory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v2, v3}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lokhttp3/OkHttpClient$Builder;

    .line 52
    .end local v3    # "factory":Ljavax/net/ssl/SSLSocketFactory;
    :cond_0
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v3, :cond_1

    .line 53
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    invoke-virtual {v2, v3}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    .line 55
    :cond_1
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->proxy:Ljava/net/Proxy;

    if-eqz v3, :cond_2

    .line 56
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->proxy:Ljava/net/Proxy;

    invoke-virtual {v2, v3}, Lokhttp3/OkHttpClient$Builder;->proxy(Ljava/net/Proxy;)Lokhttp3/OkHttpClient$Builder;

    .line 58
    :cond_2
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->proxyLogin:Ljava/lang/String;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->proxyLogin:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 59
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->proxyLogin:Ljava/lang/String;

    iget-object v4, p0, Lio/socket/engineio/client/transports/WebSocket;->proxyPassword:Ljava/lang/String;

    invoke-static {v3, v4}, Lokhttp3/Credentials;->basic(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 61
    .local v3, "credentials":Ljava/lang/String;
    new-instance v4, Lio/socket/engineio/client/transports/WebSocket$1;

    invoke-direct {v4, p0, v3}, Lio/socket/engineio/client/transports/WebSocket$1;-><init>(Lio/socket/engineio/client/transports/WebSocket;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lokhttp3/OkHttpClient$Builder;->proxyAuthenticator(Lokhttp3/Authenticator;)Lokhttp3/OkHttpClient$Builder;

    .line 70
    .end local v3    # "credentials":Ljava/lang/String;
    :cond_3
    new-instance v3, Lokhttp3/Request$Builder;

    invoke-direct {v3}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {p0}, Lio/socket/engineio/client/transports/WebSocket;->uri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    .line 71
    .local v3, "builder":Lokhttp3/Request$Builder;
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 72
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 73
    .local v7, "v":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v3, v8, v7}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 74
    .end local v7    # "v":Ljava/lang/String;
    goto :goto_1

    .line 75
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_4
    goto :goto_0

    .line 76
    :cond_5
    invoke-virtual {v3}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v4

    .line 77
    .local v4, "request":Lokhttp3/Request;
    invoke-virtual {v2}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v5

    .line 78
    .local v5, "client":Lokhttp3/OkHttpClient;
    new-instance v6, Lio/socket/engineio/client/transports/WebSocket$2;

    invoke-direct {v6, p0, v1}, Lio/socket/engineio/client/transports/WebSocket$2;-><init>(Lio/socket/engineio/client/transports/WebSocket;Lio/socket/engineio/client/transports/WebSocket;)V

    invoke-virtual {v5, v4, v6}, Lokhttp3/OkHttpClient;->newWebSocket(Lokhttp3/Request;Lokhttp3/WebSocketListener;)Lokhttp3/WebSocket;

    move-result-object v6

    iput-object v6, p0, Lio/socket/engineio/client/transports/WebSocket;->ws:Lokhttp3/WebSocket;

    .line 140
    invoke-virtual {v5}, Lokhttp3/OkHttpClient;->dispatcher()Lokhttp3/Dispatcher;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 141
    return-void
.end method

.method protected uri()Ljava/lang/String;
    .locals 8

    .line 202
    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket;->query:Ljava/util/Map;

    .line 203
    .local v0, "query":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 204
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v0, v1

    .line 206
    :cond_0
    iget-boolean v1, p0, Lio/socket/engineio/client/transports/WebSocket;->secure:Z

    const-string v2, "wss"

    const-string v3, "ws"

    if-eqz v1, :cond_1

    move-object v1, v2

    goto :goto_0

    :cond_1
    move-object v1, v3

    .line 207
    .local v1, "schema":Ljava/lang/String;
    :goto_0
    const-string v4, ""

    .line 209
    .local v4, "port":Ljava/lang/String;
    iget v5, p0, Lio/socket/engineio/client/transports/WebSocket;->port:I

    const-string v6, ":"

    if-lez v5, :cond_4

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, p0, Lio/socket/engineio/client/transports/WebSocket;->port:I

    const/16 v5, 0x1bb

    if-ne v2, v5, :cond_3

    .line 210
    :cond_2
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget v2, p0, Lio/socket/engineio/client/transports/WebSocket;->port:I

    const/16 v3, 0x50

    if-eq v2, v3, :cond_4

    .line 211
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lio/socket/engineio/client/transports/WebSocket;->port:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 214
    :cond_4
    iget-boolean v2, p0, Lio/socket/engineio/client/transports/WebSocket;->timestampRequests:Z

    if-eqz v2, :cond_5

    .line 215
    iget-object v2, p0, Lio/socket/engineio/client/transports/WebSocket;->timestampParam:Ljava/lang/String;

    invoke-static {}, Lio/socket/yeast/Yeast;->yeast()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    :cond_5
    invoke-static {v0}, Lio/socket/parseqs/ParseQS;->encode(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    .line 219
    .local v2, "derivedQuery":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6

    .line 220
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "?"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 223
    :cond_6
    iget-object v3, p0, Lio/socket/engineio/client/transports/WebSocket;->hostname:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    .line 224
    .local v3, "ipv6":Z
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v3, :cond_7

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lio/socket/engineio/client/transports/WebSocket;->hostname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_7
    iget-object v6, p0, Lio/socket/engineio/client/transports/WebSocket;->hostname:Ljava/lang/String;

    :goto_1
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lio/socket/engineio/client/transports/WebSocket;->path:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method protected write([Lio/socket/engineio/parser/Packet;)V
    .locals 8
    .param p1, "packets"    # [Lio/socket/engineio/parser/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .line 144
    move-object v0, p0

    .line 145
    .local v0, "self":Lio/socket/engineio/client/transports/WebSocket;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/socket/engineio/client/transports/WebSocket;->writable:Z

    .line 147
    new-instance v2, Lio/socket/engineio/client/transports/WebSocket$3;

    invoke-direct {v2, p0, v0}, Lio/socket/engineio/client/transports/WebSocket$3;-><init>(Lio/socket/engineio/client/transports/WebSocket;Lio/socket/engineio/client/transports/WebSocket;)V

    .line 162
    .local v2, "done":Ljava/lang/Runnable;
    const/4 v3, 0x1

    new-array v3, v3, [I

    array-length v4, p1

    aput v4, v3, v1

    .line 163
    .local v3, "total":[I
    array-length v4, p1

    :goto_0
    if-ge v1, v4, :cond_1

    aget-object v5, p1, v1

    .line 164
    .local v5, "packet":Lio/socket/engineio/parser/Packet;
    iget-object v6, p0, Lio/socket/engineio/client/transports/WebSocket;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v7, Lio/socket/engineio/client/Transport$ReadyState;->OPENING:Lio/socket/engineio/client/Transport$ReadyState;

    if-eq v6, v7, :cond_0

    iget-object v6, p0, Lio/socket/engineio/client/transports/WebSocket;->readyState:Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v7, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    if-eq v6, v7, :cond_0

    .line 166
    goto :goto_1

    .line 169
    :cond_0
    new-instance v6, Lio/socket/engineio/client/transports/WebSocket$4;

    invoke-direct {v6, p0, v0, v3, v2}, Lio/socket/engineio/client/transports/WebSocket$4;-><init>(Lio/socket/engineio/client/transports/WebSocket;Lio/socket/engineio/client/transports/WebSocket;[ILjava/lang/Runnable;)V

    invoke-static {v5, v6}, Lio/socket/engineio/parser/Parser;->encodePacket(Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V

    .line 163
    .end local v5    # "packet":Lio/socket/engineio/parser/Packet;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 186
    :cond_1
    :goto_1
    return-void
.end method
