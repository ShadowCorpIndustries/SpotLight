.class public Lio/socket/engineio/client/transports/PollingXHR$Request;
.super Lio/socket/emitter/Emitter;
.source "PollingXHR.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/engineio/client/transports/PollingXHR;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Request"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/client/transports/PollingXHR$Request$Options;
    }
.end annotation


# static fields
.field public static final EVENT_DATA:Ljava/lang/String; = "data"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_REQUEST_HEADERS:Ljava/lang/String; = "requestHeaders"

.field public static final EVENT_RESPONSE_HEADERS:Ljava/lang/String; = "responseHeaders"

.field public static final EVENT_SUCCESS:Ljava/lang/String; = "success"


# instance fields
.field private data:[B

.field private hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private method:Ljava/lang/String;

.field private proxy:Ljava/net/Proxy;

.field private sslContext:Ljavax/net/ssl/SSLContext;

.field private uri:Ljava/lang/String;

.field private xhr:Ljava/net/HttpURLConnection;


# direct methods
.method public constructor <init>(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)V
    .locals 1
    .param p1, "opts"    # Lio/socket/engineio/client/transports/PollingXHR$Request$Options;

    .line 151
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 152
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->method:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->method:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, "GET"

    :goto_0
    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->method:Ljava/lang/String;

    .line 153
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->uri:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->uri:Ljava/lang/String;

    .line 154
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->data:[B

    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:[B

    .line 155
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->sslContext:Ljavax/net/ssl/SSLContext;

    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 156
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 157
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->proxy:Ljava/net/Proxy;

    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->proxy:Ljava/net/Proxy;

    .line 158
    return-void
.end method

.method static synthetic access$300(Lio/socket/engineio/client/transports/PollingXHR$Request;)[B
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;

    .line 132
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:[B

    return-object v0
.end method

.method static synthetic access$400(Lio/socket/engineio/client/transports/PollingXHR$Request;)Ljava/net/HttpURLConnection;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;

    .line 132
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    return-object v0
.end method

.method static synthetic access$500(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;
    .param p1, "x1"    # Ljava/util/Map;

    .line 132
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onResponseHeaders(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$600(Lio/socket/engineio/client/transports/PollingXHR$Request;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;

    .line 132
    invoke-direct {p0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onLoad()V

    return-void
.end method

.method static synthetic access$700(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;
    .param p1, "x1"    # Ljava/lang/Exception;

    .line 132
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onError(Ljava/lang/Exception;)V

    return-void
.end method

.method private cleanup()V
    .locals 1

    .line 262
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_0

    .line 263
    return-void

    .line 266
    :cond_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 267
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    .line 268
    return-void
.end method

.method private onData(Ljava/lang/String;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/String;

    .line 240
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "data"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 241
    invoke-direct {p0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onSuccess()V

    .line 242
    return-void
.end method

.method private onData([B)V
    .locals 2
    .param p1, "data"    # [B

    .line 245
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "data"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 246
    invoke-direct {p0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onSuccess()V

    .line 247
    return-void
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "err"    # Ljava/lang/Exception;

    .line 250
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "error"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 251
    return-void
.end method

.method private onLoad()V
    .locals 10

    .line 271
    const/4 v0, 0x0

    .line 272
    .local v0, "input":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 273
    .local v1, "reader":Ljava/io/BufferedReader;
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v2

    .line 275
    .local v2, "contentType":Ljava/lang/String;
    :try_start_0
    const-string v3, "application/octet-stream"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 276
    new-instance v3, Ljava/io/BufferedInputStream;

    iget-object v4, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v0, v3

    .line 277
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 278
    .local v3, "buffers":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v4, 0x0

    .line 279
    .local v4, "capacity":I
    const/4 v5, 0x0

    .line 280
    .local v5, "len":I
    const/16 v6, 0x400

    new-array v6, v6, [B

    .line 281
    .local v6, "buffer":[B
    :goto_0
    invoke-virtual {v0, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    move v5, v7

    if-lez v7, :cond_0

    .line 282
    new-array v7, v5, [B

    .line 283
    .local v7, "tempBuffer":[B
    const/4 v8, 0x0

    invoke-static {v6, v8, v7, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 284
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    add-int/2addr v4, v5

    .line 286
    .end local v7    # "tempBuffer":[B
    goto :goto_0

    .line 287
    :cond_0
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 288
    .local v7, "data":Ljava/nio/ByteBuffer;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    .line 289
    .local v9, "b":[B
    invoke-virtual {v7, v9}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 290
    nop

    .end local v9    # "b":[B
    goto :goto_1

    .line 291
    :cond_1
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    invoke-direct {p0, v8}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onData([B)V

    .line 292
    .end local v3    # "buffers":Ljava/util/List;, "Ljava/util/List<[B>;"
    .end local v4    # "capacity":I
    .end local v5    # "len":I
    .end local v6    # "buffer":[B
    .end local v7    # "data":Ljava/nio/ByteBuffer;
    goto :goto_3

    .line 294
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    .local v3, "data":Ljava/lang/StringBuilder;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v1, v4

    .line 296
    :goto_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    move-object v5, v4

    .local v5, "line":Ljava/lang/String;
    if-eqz v4, :cond_3

    .line 297
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 299
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onData(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    .end local v3    # "data":Ljava/lang/StringBuilder;
    .end local v5    # "line":Ljava/lang/String;
    :goto_3
    if-eqz v0, :cond_4

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    .line 306
    :catch_0
    move-exception v3

    :cond_4
    :goto_4
    nop

    .line 308
    if-eqz v1, :cond_6

    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_6

    .line 309
    :catch_1
    move-exception v3

    goto :goto_6

    .line 304
    :catchall_0
    move-exception v3

    goto :goto_7

    .line 301
    :catch_2
    move-exception v3

    .line 302
    .local v3, "e":Ljava/io/IOException;
    :try_start_3
    invoke-direct {p0, v3}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onError(Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 305
    .end local v3    # "e":Ljava/io/IOException;
    if-eqz v0, :cond_5

    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_5

    .line 306
    :catch_3
    move-exception v3

    :cond_5
    :goto_5
    nop

    .line 308
    if-eqz v1, :cond_6

    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_6

    .line 309
    :catch_4
    move-exception v3

    :cond_6
    :goto_6
    nop

    .line 310
    invoke-direct {p0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->cleanup()V

    .line 311
    nop

    .line 312
    return-void

    .line 305
    :goto_7
    if-eqz v0, :cond_7

    :try_start_6
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    goto :goto_8

    .line 306
    :catch_5
    move-exception v4

    :cond_7
    :goto_8
    nop

    .line 308
    if-eqz v1, :cond_8

    :try_start_7
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    goto :goto_9

    .line 309
    :catch_6
    move-exception v4

    :cond_8
    :goto_9
    nop

    .line 310
    invoke-direct {p0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->cleanup()V

    goto :goto_b

    :goto_a
    throw v3

    :goto_b
    goto :goto_a
.end method

.method private onRequestHeaders(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 254
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "requestHeaders"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 255
    return-void
.end method

.method private onResponseHeaders(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 258
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "responseHeaders"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 259
    return-void
.end method

.method private onSuccess()V
    .locals 2

    .line 236
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "success"

    invoke-virtual {p0, v1, v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 237
    return-void
.end method


# virtual methods
.method public create()V
    .locals 11

    .line 161
    move-object v0, p0

    .line 163
    .local v0, "self":Lio/socket/engineio/client/transports/PollingXHR$Request;
    :try_start_0
    invoke-static {}, Lio/socket/engineio/client/transports/PollingXHR;->access$200()Ljava/util/logging/Logger;

    move-result-object v1

    const-string v2, "xhr open %s: %s"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    iget-object v5, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->method:Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    iget-object v5, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->uri:Ljava/lang/String;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 164
    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->uri:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 165
    .local v1, "url":Ljava/net/URL;
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->proxy:Ljava/net/Proxy;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->proxy:Ljava/net/Proxy;

    invoke-virtual {v1, v2}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    goto :goto_0

    .line 166
    :cond_0
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    :goto_0
    iput-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    .line 167
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    iget-object v4, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->method:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    .end local v1    # "url":Ljava/net/URL;
    nop

    .line 173
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 175
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    instance-of v2, v1, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_2

    .line 176
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->sslContext:Ljavax/net/ssl/SSLContext;

    if-eqz v2, :cond_1

    .line 177
    check-cast v1, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 179
    :cond_1
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v1, :cond_2

    .line 180
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v2, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 184
    :cond_2
    new-instance v1, Ljava/util/TreeMap;

    sget-object v2, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v1, v2}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 186
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->method:Ljava/lang/String;

    const-string v4, "POST"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 187
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    invoke-virtual {v2, v7}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 188
    new-instance v2, Ljava/util/LinkedList;

    new-array v4, v7, [Ljava/lang/String;

    const-string v5, "application/octet-stream"

    aput-object v5, v4, v6

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    const-string v4, "Content-type"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    :cond_3
    invoke-direct {v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onRequestHeaders(Ljava/util/Map;)V

    .line 192
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 193
    .local v4, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 194
    .local v8, "v":Ljava/lang/String;
    iget-object v9, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->xhr:Ljava/net/HttpURLConnection;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v9, v10, v8}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    .end local v8    # "v":Ljava/lang/String;
    goto :goto_2

    .line 196
    .end local v4    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_4
    goto :goto_1

    .line 198
    :cond_5
    invoke-static {}, Lio/socket/engineio/client/transports/PollingXHR;->access$200()Ljava/util/logging/Logger;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->uri:Ljava/lang/String;

    aput-object v4, v3, v6

    iget-object v4, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:[B

    aput-object v4, v3, v7

    const-string v4, "sending xhr with url %s | data %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 199
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lio/socket/engineio/client/transports/PollingXHR$Request$1;

    invoke-direct {v3, p0, v0}, Lio/socket/engineio/client/transports/PollingXHR$Request$1;-><init>(Lio/socket/engineio/client/transports/PollingXHR$Request;Lio/socket/engineio/client/transports/PollingXHR$Request;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 232
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 233
    return-void

    .line 168
    .end local v1    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :catch_0
    move-exception v1

    .line 169
    .local v1, "e":Ljava/io/IOException;
    invoke-direct {p0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onError(Ljava/lang/Exception;)V

    .line 170
    return-void
.end method
