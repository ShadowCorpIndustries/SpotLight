.class final Lokhttp3/internal/ws/WebSocketWriter;
.super Ljava/lang/Object;
.source "WebSocketWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/ws/WebSocketWriter$FrameSink;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field activeWriter:Z

.field final buffer:Lokio/Buffer;

.field final frameSink:Lokhttp3/internal/ws/WebSocketWriter$FrameSink;

.field final isClient:Z

.field final maskBuffer:[B

.field final maskKey:[B

.field final random:Ljava/util/Random;

.field final sink:Lokio/BufferedSink;

.field writerClosed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 47
    return-void
.end method

.method constructor <init>(ZLokio/BufferedSink;Ljava/util/Random;)V
    .locals 2
    .param p1, "isClient"    # Z
    .param p2, "sink"    # Lokio/BufferedSink;
    .param p3, "random"    # Ljava/util/Random;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->buffer:Lokio/Buffer;

    .line 57
    new-instance v0, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;

    invoke-direct {v0, p0}, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;-><init>(Lokhttp3/internal/ws/WebSocketWriter;)V

    iput-object v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->frameSink:Lokhttp3/internal/ws/WebSocketWriter$FrameSink;

    .line 65
    if-eqz p2, :cond_3

    .line 66
    if-eqz p3, :cond_2

    .line 67
    iput-boolean p1, p0, Lokhttp3/internal/ws/WebSocketWriter;->isClient:Z

    .line 68
    iput-object p2, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    .line 69
    iput-object p3, p0, Lokhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    .line 72
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 v1, 0x4

    new-array v1, v1, [B

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    iput-object v1, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    .line 73
    if-eqz p1, :cond_1

    const/16 v0, 0x2000

    new-array v0, v0, [B

    :cond_1
    iput-object v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskBuffer:[B

    .line 74
    return-void

    .line 66
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "random == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "sink == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private writeControlFrameSynchronized(ILokio/ByteString;)V
    .locals 11
    .param p1, "opcode"    # I
    .param p2, "payload"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    nop

    .line 123
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    if-nez v0, :cond_2

    .line 125
    invoke-virtual {p2}, Lokio/ByteString;->size()I

    move-result v0

    .line 126
    .local v0, "length":I
    int-to-long v1, v0

    const-wide/16 v3, 0x7d

    cmp-long v5, v1, v3

    if-gtz v5, :cond_1

    .line 131
    or-int/lit16 v1, p1, 0x80

    .line 132
    .local v1, "b0":I
    iget-object v2, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v2, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 134
    move v2, v0

    .line 135
    .local v2, "b1":I
    iget-boolean v3, p0, Lokhttp3/internal/ws/WebSocketWriter;->isClient:Z

    if-eqz v3, :cond_0

    .line 136
    or-int/lit16 v2, v2, 0x80

    .line 137
    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 139
    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    iget-object v4, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextBytes([B)V

    .line 140
    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    iget-object v4, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-interface {v3, v4}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 142
    invoke-virtual {p2}, Lokio/ByteString;->toByteArray()[B

    move-result-object v3

    .line 143
    .local v3, "bytes":[B
    array-length v4, v3

    int-to-long v6, v4

    iget-object v8, p0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    const-wide/16 v9, 0x0

    move-object v5, v3

    invoke-static/range {v5 .. v10}, Lokhttp3/internal/ws/WebSocketProtocol;->toggleMask([BJ[BJ)V

    .line 144
    iget-object v4, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v4, v3}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 145
    .end local v3    # "bytes":[B
    goto :goto_0

    .line 146
    :cond_0
    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 147
    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, p2}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 150
    :goto_0
    iget-object v3, p0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V

    .line 151
    return-void

    .line 127
    .end local v1    # "b0":I
    .end local v2    # "b1":I
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Payload size must be less than or equal to 125"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 123
    .end local v0    # "length":I
    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method newMessageSink(IJ)Lokio/Sink;
    .locals 2
    .param p1, "formatOpcode"    # I
    .param p2, "contentLength"    # J

    .line 158
    iget-boolean v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->activeWriter:Z

    if-nez v0, :cond_0

    .line 161
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokhttp3/internal/ws/WebSocketWriter;->activeWriter:Z

    .line 164
    iget-object v1, p0, Lokhttp3/internal/ws/WebSocketWriter;->frameSink:Lokhttp3/internal/ws/WebSocketWriter$FrameSink;

    iput p1, v1, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;->formatOpcode:I

    .line 165
    iput-wide p2, v1, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;->contentLength:J

    .line 166
    iput-boolean v0, v1, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;->isFirstFrame:Z

    .line 167
    const/4 v0, 0x0

    iput-boolean v0, v1, Lokhttp3/internal/ws/WebSocketWriter$FrameSink;->closed:Z

    .line 169
    return-object v1

    .line 159
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Another message writer is active. Did you call close()?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method writeClose(ILokio/ByteString;)V
    .locals 3
    .param p1, "code"    # I
    .param p2, "reason"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    sget-object v0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    .line 99
    .local v0, "payload":Lokio/ByteString;
    if-nez p1, :cond_0

    if-eqz p2, :cond_3

    .line 100
    :cond_0
    if-eqz p1, :cond_1

    .line 101
    invoke-static {p1}, Lokhttp3/internal/ws/WebSocketProtocol;->validateCloseCode(I)V

    .line 103
    :cond_1
    new-instance v1, Lokio/Buffer;

    invoke-direct {v1}, Lokio/Buffer;-><init>()V

    .line 104
    .local v1, "buffer":Lokio/Buffer;
    invoke-virtual {v1, p1}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    .line 105
    if-eqz p2, :cond_2

    .line 106
    invoke-virtual {v1, p2}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    .line 108
    :cond_2
    invoke-virtual {v1}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v0

    .line 111
    .end local v1    # "buffer":Lokio/Buffer;
    :cond_3
    monitor-enter p0

    .line 113
    const/16 v1, 0x8

    const/4 v2, 0x1

    :try_start_0
    invoke-direct {p0, v1, v0}, Lokhttp3/internal/ws/WebSocketWriter;->writeControlFrameSynchronized(ILokio/ByteString;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 115
    :try_start_1
    iput-boolean v2, p0, Lokhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    .line 116
    nop

    .line 117
    monitor-exit p0

    .line 118
    return-void

    .line 117
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 115
    :catchall_1
    move-exception v1

    iput-boolean v2, p0, Lokhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    .end local v0    # "payload":Lokio/ByteString;
    .end local p1    # "code":I
    .end local p2    # "reason":Lokio/ByteString;
    throw v1

    .line 117
    .restart local v0    # "payload":Lokio/ByteString;
    .restart local p1    # "code":I
    .restart local p2    # "reason":Lokio/ByteString;
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method writeMessageFrameSynchronized(IJZZ)V
    .locals 16
    .param p1, "formatOpcode"    # I
    .param p2, "byteCount"    # J
    .param p4, "isFirstFrame"    # Z
    .param p5, "isFinal"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 174
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    .line 176
    iget-boolean v3, v0, Lokhttp3/internal/ws/WebSocketWriter;->writerClosed:Z

    if-nez v3, :cond_8

    .line 178
    const/4 v3, 0x0

    if-eqz p4, :cond_0

    move/from16 v4, p1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 179
    .local v4, "b0":I
    :goto_0
    if-eqz p5, :cond_1

    .line 180
    or-int/lit16 v4, v4, 0x80

    .line 182
    :cond_1
    iget-object v5, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v5, v4}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 184
    const/4 v5, 0x0

    .line 185
    .local v5, "b1":I
    iget-boolean v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->isClient:Z

    if-eqz v6, :cond_2

    .line 186
    or-int/lit16 v5, v5, 0x80

    .line 188
    :cond_2
    const-wide/16 v6, 0x7d

    cmp-long v8, v1, v6

    if-gtz v8, :cond_3

    .line 189
    long-to-int v6, v1

    or-int/2addr v5, v6

    .line 190
    iget-object v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v6, v5}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    goto :goto_1

    .line 191
    :cond_3
    const-wide/32 v6, 0xffff

    cmp-long v8, v1, v6

    if-gtz v8, :cond_4

    .line 192
    or-int/lit8 v5, v5, 0x7e

    .line 193
    iget-object v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v6, v5}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 194
    iget-object v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    long-to-int v7, v1

    invoke-interface {v6, v7}, Lokio/BufferedSink;->writeShort(I)Lokio/BufferedSink;

    goto :goto_1

    .line 196
    :cond_4
    or-int/lit8 v5, v5, 0x7f

    .line 197
    iget-object v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v6, v5}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 198
    iget-object v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v6, v1, v2}, Lokio/BufferedSink;->writeLong(J)Lokio/BufferedSink;

    .line 201
    :goto_1
    iget-boolean v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->isClient:Z

    if-eqz v6, :cond_7

    .line 202
    iget-object v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    iget-object v7, v0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {v6, v7}, Ljava/util/Random;->nextBytes([B)V

    .line 203
    iget-object v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    iget-object v7, v0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-interface {v6, v7}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 205
    const-wide/16 v6, 0x0

    .local v6, "written":J
    :goto_2
    cmp-long v8, v6, v1

    if-gez v8, :cond_6

    .line 206
    iget-object v8, v0, Lokhttp3/internal/ws/WebSocketWriter;->maskBuffer:[B

    array-length v8, v8

    int-to-long v8, v8

    invoke-static {v1, v2, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v14, v8

    .line 207
    .local v14, "toRead":I
    iget-object v8, v0, Lokhttp3/internal/ws/WebSocketWriter;->buffer:Lokio/Buffer;

    iget-object v9, v0, Lokhttp3/internal/ws/WebSocketWriter;->maskBuffer:[B

    invoke-virtual {v8, v9, v3, v14}, Lokio/Buffer;->read([BII)I

    move-result v15

    .line 208
    .local v15, "read":I
    const/4 v8, -0x1

    if-eq v15, v8, :cond_5

    .line 209
    iget-object v8, v0, Lokhttp3/internal/ws/WebSocketWriter;->maskBuffer:[B

    int-to-long v9, v15

    iget-object v11, v0, Lokhttp3/internal/ws/WebSocketWriter;->maskKey:[B

    move-wide v12, v6

    invoke-static/range {v8 .. v13}, Lokhttp3/internal/ws/WebSocketProtocol;->toggleMask([BJ[BJ)V

    .line 210
    iget-object v8, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    iget-object v9, v0, Lokhttp3/internal/ws/WebSocketWriter;->maskBuffer:[B

    invoke-interface {v8, v9, v3, v15}, Lokio/BufferedSink;->write([BII)Lokio/BufferedSink;

    .line 211
    int-to-long v8, v15

    add-long/2addr v6, v8

    .line 212
    .end local v14    # "toRead":I
    .end local v15    # "read":I
    goto :goto_2

    .line 208
    .restart local v14    # "toRead":I
    .restart local v15    # "read":I
    :cond_5
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 212
    .end local v6    # "written":J
    .end local v14    # "toRead":I
    .end local v15    # "read":I
    :cond_6
    goto :goto_3

    .line 214
    :cond_7
    iget-object v3, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    iget-object v6, v0, Lokhttp3/internal/ws/WebSocketWriter;->buffer:Lokio/Buffer;

    invoke-interface {v3, v6, v1, v2}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 217
    :goto_3
    iget-object v3, v0, Lokhttp3/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->emit()Lokio/BufferedSink;

    .line 218
    return-void

    .line 176
    .end local v4    # "b0":I
    .end local v5    # "b1":I
    :cond_8
    new-instance v3, Ljava/io/IOException;

    const-string v4, "closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v3

    :goto_5
    goto :goto_4
.end method

.method writePing(Lokio/ByteString;)V
    .locals 1
    .param p1, "payload"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    monitor-enter p0

    .line 79
    const/16 v0, 0x9

    :try_start_0
    invoke-direct {p0, v0, p1}, Lokhttp3/internal/ws/WebSocketWriter;->writeControlFrameSynchronized(ILokio/ByteString;)V

    .line 80
    monitor-exit p0

    .line 81
    return-void

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method writePong(Lokio/ByteString;)V
    .locals 1
    .param p1, "payload"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    monitor-enter p0

    .line 86
    const/16 v0, 0xa

    :try_start_0
    invoke-direct {p0, v0, p1}, Lokhttp3/internal/ws/WebSocketWriter;->writeControlFrameSynchronized(ILokio/ByteString;)V

    .line 87
    monitor-exit p0

    .line 88
    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
