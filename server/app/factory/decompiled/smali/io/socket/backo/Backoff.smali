.class public Lio/socket/backo/Backoff;
.super Ljava/lang/Object;
.source "Backoff.java"


# instance fields
.field private attempts:I

.field private factor:I

.field private jitter:D

.field private max:J

.field private ms:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const-wide/16 v0, 0x64

    iput-wide v0, p0, Lio/socket/backo/Backoff;->ms:J

    .line 9
    const-wide/16 v0, 0x2710

    iput-wide v0, p0, Lio/socket/backo/Backoff;->max:J

    .line 10
    const/4 v0, 0x2

    iput v0, p0, Lio/socket/backo/Backoff;->factor:I

    .line 14
    return-void
.end method


# virtual methods
.method public duration()J
    .locals 6

    .line 17
    iget-wide v0, p0, Lio/socket/backo/Backoff;->ms:J

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    iget v1, p0, Lio/socket/backo/Backoff;->factor:I

    int-to-long v1, v1

    .line 18
    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    iget v2, p0, Lio/socket/backo/Backoff;->attempts:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lio/socket/backo/Backoff;->attempts:I

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 19
    .local v0, "ms":Ljava/math/BigInteger;
    iget-wide v1, p0, Lio/socket/backo/Backoff;->jitter:D

    const-wide/16 v3, 0x0

    cmpl-double v5, v1, v3

    if-eqz v5, :cond_1

    .line 20
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    .line 21
    .local v1, "rand":D
    invoke-static {v1, v2}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v3

    iget-wide v4, p0, Lio/socket/backo/Backoff;->jitter:D

    .line 22
    invoke-static {v4, v5}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    new-instance v4, Ljava/math/BigDecimal;

    invoke-direct {v4, v0}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    .line 23
    invoke-virtual {v3, v4}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v3

    .line 24
    .local v3, "deviation":Ljava/math/BigInteger;
    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    mul-double v4, v4, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v4, v4

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_0

    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    :goto_0
    move-object v0, v4

    .line 26
    .end local v1    # "rand":D
    .end local v3    # "deviation":Ljava/math/BigInteger;
    :cond_1
    iget-wide v1, p0, Lio/socket/backo/Backoff;->max:J

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->min(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v1

    return-wide v1
.end method

.method public getAttempts()I
    .locals 1

    .line 54
    iget v0, p0, Lio/socket/backo/Backoff;->attempts:I

    return v0
.end method

.method public reset()V
    .locals 1

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lio/socket/backo/Backoff;->attempts:I

    .line 31
    return-void
.end method

.method public setFactor(I)Lio/socket/backo/Backoff;
    .locals 0
    .param p1, "factor"    # I

    .line 44
    iput p1, p0, Lio/socket/backo/Backoff;->factor:I

    .line 45
    return-object p0
.end method

.method public setJitter(D)Lio/socket/backo/Backoff;
    .locals 0
    .param p1, "jitter"    # D

    .line 49
    iput-wide p1, p0, Lio/socket/backo/Backoff;->jitter:D

    .line 50
    return-object p0
.end method

.method public setMax(J)Lio/socket/backo/Backoff;
    .locals 0
    .param p1, "max"    # J

    .line 39
    iput-wide p1, p0, Lio/socket/backo/Backoff;->max:J

    .line 40
    return-object p0
.end method

.method public setMin(J)Lio/socket/backo/Backoff;
    .locals 0
    .param p1, "min"    # J

    .line 34
    iput-wide p1, p0, Lio/socket/backo/Backoff;->ms:J

    .line 35
    return-object p0
.end method
