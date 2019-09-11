.class final Lokhttp3/internal/ws/WebSocketReader;
.super Ljava/lang/Object;
.source "WebSocketReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/ws/WebSocketReader$FrameCallback;
    }
.end annotation


# instance fields
.field closed:Z

.field frameBytesRead:J

.field final frameCallback:Lokhttp3/internal/ws/WebSocketReader$FrameCallback;

.field frameLength:J

.field final isClient:Z

.field isControlFrame:Z

.field isFinalFrame:Z

.field isMasked:Z

.field final maskBuffer:[B

.field final maskKey:[B

.field opcode:I

.field final source:Lokio/BufferedSource;


# direct methods
.method constructor <init>(ZLokio/BufferedSource;Lokhttp3/internal/ws/WebSocketReader$FrameCallback;)V
    .locals 2
    .param p1, "isClient"    # Z
    .param p2, "source"    # Lokio/BufferedSource;
    .param p3, "frameCallback"    # Lokhttp3/internal/ws/WebSocketReader$FrameCallback;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lokhttp3/internal/ws/WebSocketReader;->maskKey:[B

    .line 76
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    .line 79
    if-eqz p2, :cond_1

    .line 80
    if-eqz p3, :cond_0

    .line 81
    iput-boolean p1, p0, Lokhttp3/internal/ws/WebSocketReader;->isClient:Z

    .line 82
    iput-object p2, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    .line 83
    iput-object p3, p0, Lokhttp3/internal/ws/WebSocketReader;->frameCallback:Lokhttp3/internal/ws/WebSocketReader$FrameCallback;

    .line 84
    return-void

    .line 80
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "frameCallback == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readControlFrame()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 169
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 170
    .local v0, "buffer":Lokio/Buffer;
    iget-wide v1, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    iget-wide v3, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    cmp-long v5, v1, v3

    if-gez v5, :cond_2

    .line 171
    iget-boolean v1, p0, Lokhttp3/internal/ws/WebSocketReader;->isClient:Z

    if-eqz v1, :cond_0

    .line 172
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v1, v0, v3, v4}, Lokio/BufferedSource;->readFully(Lokio/Buffer;J)V

    goto :goto_1

    .line 174
    :cond_0
    :goto_0
    iget-wide v1, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    iget-wide v3, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    cmp-long v5, v1, v3

    if-gez v5, :cond_2

    .line 175
    sub-long/2addr v3, v1

    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    array-length v1, v1

    int-to-long v1, v1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v2, v1

    .line 176
    .local v2, "toRead":I
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    const/4 v4, 0x0

    invoke-interface {v1, v3, v4, v2}, Lokio/BufferedSource;->read([BII)I

    move-result v1

    .line 177
    .local v1, "read":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 178
    iget-object v5, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    int-to-long v6, v1

    iget-object v8, p0, Lokhttp3/internal/ws/WebSocketReader;->maskKey:[B

    iget-wide v9, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    invoke-static/range {v5 .. v10}, Lokhttp3/internal/ws/WebSocketProtocol;->toggleMask([BJ[BJ)V

    .line 179
    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    invoke-virtual {v0, v3, v4, v1}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 180
    iget-wide v3, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    int-to-long v5, v1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    .line 181
    .end local v1    # "read":I
    .end local v2    # "toRead":I
    goto :goto_0

    .line 177
    .restart local v1    # "read":I
    .restart local v2    # "toRead":I
    :cond_1
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 185
    .end local v1    # "read":I
    .end local v2    # "toRead":I
    :cond_2
    :goto_1
    iget v1, p0, Lokhttp3/internal/ws/WebSocketReader;->opcode:I

    packed-switch v1, :pswitch_data_0

    .line 208
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown control opcode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lokhttp3/internal/ws/WebSocketReader;->opcode:I

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 190
    :pswitch_0
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketReader;->frameCallback:Lokhttp3/internal/ws/WebSocketReader$FrameCallback;

    invoke-virtual {v0}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v2

    invoke-interface {v1, v2}, Lokhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadPong(Lokio/ByteString;)V

    .line 191
    goto :goto_3

    .line 187
    :pswitch_1
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketReader;->frameCallback:Lokhttp3/internal/ws/WebSocketReader$FrameCallback;

    invoke-virtual {v0}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v2

    invoke-interface {v1, v2}, Lokhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadPing(Lokio/ByteString;)V

    .line 188
    goto :goto_3

    .line 193
    :pswitch_2
    const/16 v1, 0x3ed

    .line 194
    .local v1, "code":I
    const-string v2, ""

    .line 195
    .local v2, "reason":Ljava/lang/String;
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v3

    .line 196
    .local v3, "bufferSize":J
    const-wide/16 v5, 0x1

    cmp-long v7, v3, v5

    if-eqz v7, :cond_5

    .line 198
    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-eqz v7, :cond_4

    .line 199
    invoke-virtual {v0}, Lokio/Buffer;->readShort()S

    move-result v1

    .line 200
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v2

    .line 201
    invoke-static {v1}, Lokhttp3/internal/ws/WebSocketProtocol;->closeCodeExceptionMessage(I)Ljava/lang/String;

    move-result-object v5

    .line 202
    .local v5, "codeExceptionMessage":Ljava/lang/String;
    if-nez v5, :cond_3

    goto :goto_2

    :cond_3
    new-instance v6, Ljava/net/ProtocolException;

    invoke-direct {v6, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 204
    .end local v5    # "codeExceptionMessage":Ljava/lang/String;
    :cond_4
    :goto_2
    iget-object v5, p0, Lokhttp3/internal/ws/WebSocketReader;->frameCallback:Lokhttp3/internal/ws/WebSocketReader$FrameCallback;

    invoke-interface {v5, v1, v2}, Lokhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadClose(ILjava/lang/String;)V

    .line 205
    const/4 v5, 0x1

    iput-boolean v5, p0, Lokhttp3/internal/ws/WebSocketReader;->closed:Z

    .line 206
    nop

    .line 210
    .end local v1    # "code":I
    .end local v2    # "reason":Ljava/lang/String;
    .end local v3    # "bufferSize":J
    :goto_3
    return-void

    .line 197
    .restart local v1    # "code":I
    .restart local v2    # "reason":Ljava/lang/String;
    .restart local v3    # "bufferSize":J
    :cond_5
    new-instance v5, Ljava/net/ProtocolException;

    const-string v6, "Malformed close payload length of 1."

    invoke-direct {v5, v6}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v5

    :goto_5
    goto :goto_4

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private readHeader()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 106
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketReader;->closed:Z

    if-nez v0, :cond_11

    .line 110
    iget-object v0, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v0

    invoke-virtual {v0}, Lokio/Timeout;->timeoutNanos()J

    move-result-wide v0

    .line 111
    .local v0, "timeoutBefore":J
    iget-object v2, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v2

    invoke-virtual {v2}, Lokio/Timeout;->clearTimeout()Lokio/Timeout;

    .line 113
    :try_start_0
    iget-object v2, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readByte()B

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    and-int/lit16 v2, v2, 0xff

    .line 115
    .local v2, "b0":I
    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v3

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1, v4}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 116
    nop

    .line 118
    and-int/lit8 v3, v2, 0xf

    iput v3, p0, Lokhttp3/internal/ws/WebSocketReader;->opcode:I

    .line 119
    and-int/lit16 v3, v2, 0x80

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    iput-boolean v3, p0, Lokhttp3/internal/ws/WebSocketReader;->isFinalFrame:Z

    .line 120
    and-int/lit8 v3, v2, 0x8

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    iput-boolean v3, p0, Lokhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    .line 123
    iget-boolean v3, p0, Lokhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    if-eqz v3, :cond_3

    iget-boolean v3, p0, Lokhttp3/internal/ws/WebSocketReader;->isFinalFrame:Z

    if-eqz v3, :cond_2

    goto :goto_2

    .line 124
    :cond_2
    new-instance v3, Ljava/net/ProtocolException;

    const-string v4, "Control frames must be final."

    invoke-direct {v3, v4}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 127
    :cond_3
    :goto_2
    and-int/lit8 v3, v2, 0x40

    if-eqz v3, :cond_4

    const/4 v3, 0x1

    goto :goto_3

    :cond_4
    const/4 v3, 0x0

    .line 128
    .local v3, "reservedFlag1":Z
    :goto_3
    and-int/lit8 v6, v2, 0x20

    if-eqz v6, :cond_5

    const/4 v6, 0x1

    goto :goto_4

    :cond_5
    const/4 v6, 0x0

    .line 129
    .local v6, "reservedFlag2":Z
    :goto_4
    and-int/lit8 v7, v2, 0x10

    if-eqz v7, :cond_6

    const/4 v7, 0x1

    goto :goto_5

    :cond_6
    const/4 v7, 0x0

    .line 130
    .local v7, "reservedFlag3":Z
    :goto_5
    if-nez v3, :cond_10

    if-nez v6, :cond_10

    if-nez v7, :cond_10

    .line 135
    iget-object v8, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v8}, Lokio/BufferedSource;->readByte()B

    move-result v8

    and-int/lit16 v8, v8, 0xff

    .line 137
    .local v8, "b1":I
    and-int/lit16 v9, v8, 0x80

    if-eqz v9, :cond_7

    goto :goto_6

    :cond_7
    const/4 v4, 0x0

    :goto_6
    iput-boolean v4, p0, Lokhttp3/internal/ws/WebSocketReader;->isMasked:Z

    .line 138
    iget-boolean v4, p0, Lokhttp3/internal/ws/WebSocketReader;->isMasked:Z

    iget-boolean v5, p0, Lokhttp3/internal/ws/WebSocketReader;->isClient:Z

    if-ne v4, v5, :cond_9

    .line 140
    new-instance v4, Ljava/net/ProtocolException;

    if-eqz v5, :cond_8

    const-string v5, "Server-sent frames must not be masked."

    goto :goto_7

    :cond_8
    const-string v5, "Client-sent frames must be masked."

    :goto_7
    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 146
    :cond_9
    and-int/lit8 v4, v8, 0x7f

    int-to-long v4, v4

    iput-wide v4, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    .line 147
    iget-wide v4, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    const-wide/16 v9, 0x7e

    const-wide/16 v11, 0x0

    cmp-long v13, v4, v9

    if-nez v13, :cond_a

    .line 148
    iget-object v4, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readShort()S

    move-result v4

    int-to-long v4, v4

    const-wide/32 v9, 0xffff

    and-long/2addr v4, v9

    iput-wide v4, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    goto :goto_8

    .line 149
    :cond_a
    const-wide/16 v9, 0x7f

    cmp-long v13, v4, v9

    if-nez v13, :cond_c

    .line 150
    iget-object v4, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    .line 151
    iget-wide v4, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    cmp-long v9, v4, v11

    if-ltz v9, :cond_b

    goto :goto_8

    .line 152
    :cond_b
    new-instance v4, Ljava/net/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Frame length 0x"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v9, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    .line 153
    invoke-static {v9, v10}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " > 0x7FFFFFFFFFFFFFFF"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 156
    :cond_c
    :goto_8
    iput-wide v11, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    .line 158
    iget-boolean v4, p0, Lokhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    if-eqz v4, :cond_e

    iget-wide v4, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    const-wide/16 v9, 0x7d

    cmp-long v11, v4, v9

    if-gtz v11, :cond_d

    goto :goto_9

    .line 159
    :cond_d
    new-instance v4, Ljava/net/ProtocolException;

    const-string v5, "Control frame must be less than 125B."

    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 162
    :cond_e
    :goto_9
    iget-boolean v4, p0, Lokhttp3/internal/ws/WebSocketReader;->isMasked:Z

    if-eqz v4, :cond_f

    .line 164
    iget-object v4, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    iget-object v5, p0, Lokhttp3/internal/ws/WebSocketReader;->maskKey:[B

    invoke-interface {v4, v5}, Lokio/BufferedSource;->readFully([B)V

    .line 166
    :cond_f
    return-void

    .line 132
    .end local v8    # "b1":I
    :cond_10
    new-instance v4, Ljava/net/ProtocolException;

    const-string v5, "Reserved flags are unsupported."

    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 115
    .end local v2    # "b0":I
    .end local v3    # "reservedFlag1":Z
    .end local v6    # "reservedFlag2":Z
    .end local v7    # "reservedFlag3":Z
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v3

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1, v4}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    throw v2

    .line 106
    .end local v0    # "timeoutBefore":J
    :cond_11
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readMessage(Lokio/Buffer;)V
    .locals 14
    .param p1, "sink"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    :goto_0
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketReader;->closed:Z

    if-nez v0, :cond_6

    .line 248
    iget-wide v0, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    iget-wide v2, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    .line 249
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketReader;->isFinalFrame:Z

    if-eqz v0, :cond_0

    return-void

    .line 251
    :cond_0
    invoke-virtual {p0}, Lokhttp3/internal/ws/WebSocketReader;->readUntilNonControlFrame()V

    .line 252
    iget v0, p0, Lokhttp3/internal/ws/WebSocketReader;->opcode:I

    if-nez v0, :cond_1

    .line 255
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketReader;->isFinalFrame:Z

    if-eqz v0, :cond_2

    iget-wide v0, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    .line 256
    return-void

    .line 253
    :cond_1
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected continuation opcode. Got: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lokhttp3/internal/ws/WebSocketReader;->opcode:I

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 260
    :cond_2
    iget-wide v0, p0, Lokhttp3/internal/ws/WebSocketReader;->frameLength:J

    iget-wide v2, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    sub-long/2addr v0, v2

    .line 263
    .local v0, "toRead":J
    iget-boolean v2, p0, Lokhttp3/internal/ws/WebSocketReader;->isMasked:Z

    const-wide/16 v3, -0x1

    if-eqz v2, :cond_4

    .line 264
    iget-object v2, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    array-length v2, v2

    int-to-long v5, v2

    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 265
    iget-object v2, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    iget-object v5, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    long-to-int v6, v0

    const/4 v7, 0x0

    invoke-interface {v2, v5, v7, v6}, Lokio/BufferedSource;->read([BII)I

    move-result v2

    int-to-long v5, v2

    .line 266
    .local v5, "read":J
    cmp-long v2, v5, v3

    if-eqz v2, :cond_3

    .line 267
    iget-object v8, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    iget-object v11, p0, Lokhttp3/internal/ws/WebSocketReader;->maskKey:[B

    iget-wide v12, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    move-wide v9, v5

    invoke-static/range {v8 .. v13}, Lokhttp3/internal/ws/WebSocketProtocol;->toggleMask([BJ[BJ)V

    .line 268
    iget-object v2, p0, Lokhttp3/internal/ws/WebSocketReader;->maskBuffer:[B

    long-to-int v3, v5

    invoke-virtual {p1, v2, v7, v3}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    goto :goto_1

    .line 266
    :cond_3
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 270
    .end local v5    # "read":J
    :cond_4
    iget-object v2, p0, Lokhttp3/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;

    invoke-interface {v2, p1, v0, v1}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v5

    .line 271
    .restart local v5    # "read":J
    cmp-long v2, v5, v3

    if-eqz v2, :cond_5

    .line 274
    :goto_1
    iget-wide v2, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    add-long/2addr v2, v5

    iput-wide v2, p0, Lokhttp3/internal/ws/WebSocketReader;->frameBytesRead:J

    .line 275
    .end local v0    # "toRead":J
    .end local v5    # "read":J
    goto/16 :goto_0

    .line 271
    .restart local v0    # "toRead":J
    .restart local v5    # "read":J
    :cond_5
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 246
    .end local v0    # "toRead":J
    .end local v5    # "read":J
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method private readMessageFrame()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 213
    iget v0, p0, Lokhttp3/internal/ws/WebSocketReader;->opcode:I

    .line 214
    .local v0, "opcode":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 215
    :cond_0
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown opcode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_1
    :goto_0
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 219
    .local v2, "message":Lokio/Buffer;
    invoke-direct {p0, v2}, Lokhttp3/internal/ws/WebSocketReader;->readMessage(Lokio/Buffer;)V

    .line 221
    if-ne v0, v1, :cond_2

    .line 222
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketReader;->frameCallback:Lokhttp3/internal/ws/WebSocketReader$FrameCallback;

    invoke-virtual {v2}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadMessage(Ljava/lang/String;)V

    goto :goto_1

    .line 224
    :cond_2
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketReader;->frameCallback:Lokhttp3/internal/ws/WebSocketReader$FrameCallback;

    invoke-virtual {v2}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v3

    invoke-interface {v1, v3}, Lokhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadMessage(Lokio/ByteString;)V

    .line 226
    :goto_1
    return-void
.end method


# virtual methods
.method processNextFrame()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    invoke-direct {p0}, Lokhttp3/internal/ws/WebSocketReader;->readHeader()V

    .line 98
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    if-eqz v0, :cond_0

    .line 99
    invoke-direct {p0}, Lokhttp3/internal/ws/WebSocketReader;->readControlFrame()V

    goto :goto_0

    .line 101
    :cond_0
    invoke-direct {p0}, Lokhttp3/internal/ws/WebSocketReader;->readMessageFrame()V

    .line 103
    :goto_0
    return-void
.end method

.method readUntilNonControlFrame()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 230
    :goto_0
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketReader;->closed:Z

    if-nez v0, :cond_1

    .line 231
    invoke-direct {p0}, Lokhttp3/internal/ws/WebSocketReader;->readHeader()V

    .line 232
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketReader;->isControlFrame:Z

    if-nez v0, :cond_0

    .line 233
    goto :goto_1

    .line 235
    :cond_0
    invoke-direct {p0}, Lokhttp3/internal/ws/WebSocketReader;->readControlFrame()V

    goto :goto_0

    .line 237
    :cond_1
    :goto_1
    return-void
.end method
