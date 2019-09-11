.class Lio/socket/engineio/client/transports/PollingXHR$Request$1;
.super Ljava/lang/Object;
.source "PollingXHR.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/PollingXHR$Request;->create()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/PollingXHR$Request;

.field final synthetic val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/PollingXHR$Request;Lio/socket/engineio/client/transports/PollingXHR$Request;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;

    .line 199
    iput-object p1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->this$0:Lio/socket/engineio/client/transports/PollingXHR$Request;

    iput-object p2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 202
    const/4 v0, 0x0

    .line 204
    .local v0, "output":Ljava/io/OutputStream;
    :try_start_0
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$300(Lio/socket/engineio/client/transports/PollingXHR$Request;)[B

    move-result-object v1

    if-eqz v1, :cond_0

    .line 205
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->this$0:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$400(Lio/socket/engineio/client/transports/PollingXHR$Request;)Ljava/net/HttpURLConnection;

    move-result-object v1

    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v2}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$300(Lio/socket/engineio/client/transports/PollingXHR$Request;)[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 206
    new-instance v1, Ljava/io/BufferedOutputStream;

    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->this$0:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v2}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$400(Lio/socket/engineio/client/transports/PollingXHR$Request;)Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v0, v1

    .line 207
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$300(Lio/socket/engineio/client/transports/PollingXHR$Request;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 208
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 211
    :cond_0
    iget-object v1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->this$0:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$400(Lio/socket/engineio/client/transports/PollingXHR$Request;)Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v1

    .line 212
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v2, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$500(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/util/Map;)V

    .line 214
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->this$0:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v2}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$400(Lio/socket/engineio/client/transports/PollingXHR$Request;)Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    .line 215
    .local v2, "statusCode":I
    const/16 v3, 0xc8

    if-ne v3, v2, :cond_1

    .line 216
    iget-object v3, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v3}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$600(Lio/socket/engineio/client/transports/PollingXHR$Request;)V

    goto :goto_0

    .line 218
    :cond_1
    iget-object v3, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    new-instance v4, Ljava/io/IOException;

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v4}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$700(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/lang/Exception;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 228
    .end local v1    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "statusCode":I
    :goto_0
    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 229
    :catch_0
    move-exception v1

    .line 230
    goto :goto_2

    .line 229
    :cond_2
    :goto_1
    goto :goto_2

    .line 227
    :catchall_0
    move-exception v1

    goto :goto_3

    .line 222
    :catch_1
    move-exception v1

    .line 225
    .local v1, "e":Ljava/lang/NullPointerException;
    :try_start_2
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v2, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$700(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 228
    .end local v1    # "e":Ljava/lang/NullPointerException;
    if-eqz v0, :cond_2

    :try_start_3
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 220
    :catch_2
    move-exception v1

    .line 221
    .local v1, "e":Ljava/io/IOException;
    :try_start_4
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v2, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$700(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 228
    .end local v1    # "e":Ljava/io/IOException;
    if-eqz v0, :cond_2

    :try_start_5
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    .line 231
    :goto_2
    return-void

    .line 228
    :goto_3
    if-eqz v0, :cond_3

    :try_start_6
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_4

    .line 229
    :catch_3
    move-exception v2

    :cond_3
    :goto_4
    goto :goto_6

    :goto_5
    throw v1

    :goto_6
    goto :goto_5
.end method
