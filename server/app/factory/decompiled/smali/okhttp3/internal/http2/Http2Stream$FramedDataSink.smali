.class final Lokhttp3/internal/http2/Http2Stream$FramedDataSink;
.super Ljava/lang/Object;
.source "Http2Stream.java"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/http2/Http2Stream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "FramedDataSink"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final EMIT_BUFFER_SIZE:J = 0x4000L


# instance fields
.field closed:Z

.field finished:Z

.field private final sendBuffer:Lokio/Buffer;

.field final synthetic this$0:Lokhttp3/internal/http2/Http2Stream;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 455
    return-void
.end method

.method constructor <init>(Lokhttp3/internal/http2/Http2Stream;)V
    .locals 1
    .param p1, "this$0"    # Lokhttp3/internal/http2/Http2Stream;

    .line 455
    iput-object p1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 462
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    return-void
.end method

.method private emitDataFrame(Z)V
    .locals 9
    .param p1, "outFinished"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 485
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    monitor-enter v0

    .line 486
    :try_start_0
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v1, v1, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->enter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 488
    :goto_0
    :try_start_1
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-wide v1, v1, Lokhttp3/internal/http2/Http2Stream;->bytesLeftInWriteWindow:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-gtz v5, :cond_0

    iget-boolean v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->finished:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->closed:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v1, v1, Lokhttp3/internal/http2/Http2Stream;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    if-nez v1, :cond_0

    .line 489
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Stream;->waitForIo()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 492
    :cond_0
    :try_start_2
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v1, v1, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    .line 493
    nop

    .line 495
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Stream;->checkOutNotClosed()V

    .line 496
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-wide v1, v1, Lokhttp3/internal/http2/Http2Stream;->bytesLeftInWriteWindow:J

    iget-object v3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v3}, Lokio/Buffer;->size()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    .line 497
    .local v1, "toWrite":J
    iget-object v3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-wide v4, v3, Lokhttp3/internal/http2/Http2Stream;->bytesLeftInWriteWindow:J

    sub-long/2addr v4, v1

    iput-wide v4, v3, Lokhttp3/internal/http2/Http2Stream;->bytesLeftInWriteWindow:J

    .line 498
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 500
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->enter()V

    .line 502
    :try_start_3
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v3, v0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget v4, v0, Lokhttp3/internal/http2/Http2Stream;->id:I

    if-eqz p1, :cond_1

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v5

    cmp-long v0, v1, v5

    if-nez v0, :cond_1

    const/4 v0, 0x1

    const/4 v5, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    const/4 v5, 0x0

    :goto_1
    iget-object v6, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    move-wide v7, v1

    invoke-virtual/range {v3 .. v8}, Lokhttp3/internal/http2/Http2Connection;->writeData(IZLokio/Buffer;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 504
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    .line 505
    nop

    .line 506
    return-void

    .line 504
    :catchall_0
    move-exception v0

    iget-object v3, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v3, v3, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v3}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    throw v0

    .line 492
    .end local v1    # "toWrite":J
    :catchall_1
    move-exception v1

    :try_start_4
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v2, v2, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v2}, Lokhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    .end local p1    # "outFinished":Z
    throw v1

    .line 498
    .restart local p1    # "outFinished":Z
    :catchall_2
    move-exception v1

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_3

    :goto_2
    throw v1

    :goto_3
    goto :goto_2
.end method


# virtual methods
.method public close()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 524
    nop

    .line 525
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    monitor-enter v0

    .line 526
    :try_start_0
    iget-boolean v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->closed:Z

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    .line 527
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 528
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->sink:Lokhttp3/internal/http2/Http2Stream$FramedDataSink;

    iget-boolean v0, v0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->finished:Z

    const/4 v1, 0x1

    if-nez v0, :cond_2

    .line 530
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    .line 531
    :goto_0
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v2

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    .line 532
    invoke-direct {p0, v1}, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->emitDataFrame(Z)V

    goto :goto_0

    .line 536
    :cond_1
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v2, v0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget v3, v0, Lokhttp3/internal/http2/Http2Stream;->id:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Lokhttp3/internal/http2/Http2Connection;->writeData(IZLokio/Buffer;J)V

    .line 539
    :cond_2
    iget-object v2, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    monitor-enter v2

    .line 540
    :try_start_1
    iput-boolean v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->closed:Z

    .line 541
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 542
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Connection;->flush()V

    .line 543
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Stream;->cancelStreamIfNecessary()V

    .line 544
    return-void

    .line 541
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 527
    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public flush()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 509
    nop

    .line 510
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    monitor-enter v0

    .line 511
    :try_start_0
    iget-object v1, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    invoke-virtual {v1}, Lokhttp3/internal/http2/Http2Stream;->checkOutNotClosed()V

    .line 512
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 513
    :goto_0
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 514
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->emitDataFrame(Z)V

    .line 515
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->connection:Lokhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0}, Lokhttp3/internal/http2/Http2Connection;->flush()V

    goto :goto_0

    .line 517
    :cond_0
    return-void

    .line 512
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method

.method public timeout()Lokio/Timeout;
    .locals 1

    .line 520
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->this$0:Lokhttp3/internal/http2/Http2Stream;

    iget-object v0, v0, Lokhttp3/internal/http2/Http2Stream;->writeTimeout:Lokhttp3/internal/http2/Http2Stream$StreamTimeout;

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .locals 5
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 472
    nop

    .line 473
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0, p1, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 474
    :goto_0
    iget-object v0, p0, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4000

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    .line 475
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lokhttp3/internal/http2/Http2Stream$FramedDataSink;->emitDataFrame(Z)V

    goto :goto_0

    .line 477
    :cond_0
    return-void
.end method
