.class public final Lokio/HashingSource;
.super Lokio/ForwardingSource;
.source "HashingSource.java"


# instance fields
.field private final mac:Ljavax/crypto/Mac;

.field private final messageDigest:Ljava/security/MessageDigest;


# direct methods
.method private constructor <init>(Lokio/Source;Ljava/lang/String;)V
    .locals 2
    .param p1, "source"    # Lokio/Source;
    .param p2, "algorithm"    # Ljava/lang/String;

    .line 71
    invoke-direct {p0, p1}, Lokio/ForwardingSource;-><init>(Lokio/Source;)V

    .line 73
    :try_start_0
    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lokio/HashingSource;->messageDigest:Ljava/security/MessageDigest;

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lokio/HashingSource;->mac:Ljavax/crypto/Mac;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    nop

    .line 78
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method private constructor <init>(Lokio/Source;Lokio/ByteString;Ljava/lang/String;)V
    .locals 3
    .param p1, "source"    # Lokio/Source;
    .param p2, "key"    # Lokio/ByteString;
    .param p3, "algorithm"    # Ljava/lang/String;

    .line 81
    invoke-direct {p0, p1}, Lokio/ForwardingSource;-><init>(Lokio/Source;)V

    .line 83
    :try_start_0
    invoke-static {p3}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    iput-object v0, p0, Lokio/HashingSource;->mac:Ljavax/crypto/Mac;

    .line 84
    iget-object v0, p0, Lokio/HashingSource;->mac:Ljavax/crypto/Mac;

    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lokio/ByteString;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2, p3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 85
    const/4 v0, 0x0

    iput-object v0, p0, Lokio/HashingSource;->messageDigest:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    nop

    .line 91
    return-void

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/security/InvalidKeyException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 86
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_1
    move-exception v0

    .line 87
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public static hmacSha1(Lokio/Source;Lokio/ByteString;)Lokio/HashingSource;
    .locals 2
    .param p0, "source"    # Lokio/Source;
    .param p1, "key"    # Lokio/ByteString;

    .line 62
    new-instance v0, Lokio/HashingSource;

    const-string v1, "HmacSHA1"

    invoke-direct {v0, p0, p1, v1}, Lokio/HashingSource;-><init>(Lokio/Source;Lokio/ByteString;Ljava/lang/String;)V

    return-object v0
.end method

.method public static hmacSha256(Lokio/Source;Lokio/ByteString;)Lokio/HashingSource;
    .locals 2
    .param p0, "source"    # Lokio/Source;
    .param p1, "key"    # Lokio/ByteString;

    .line 67
    new-instance v0, Lokio/HashingSource;

    const-string v1, "HmacSHA256"

    invoke-direct {v0, p0, p1, v1}, Lokio/HashingSource;-><init>(Lokio/Source;Lokio/ByteString;Ljava/lang/String;)V

    return-object v0
.end method

.method public static md5(Lokio/Source;)Lokio/HashingSource;
    .locals 2
    .param p0, "source"    # Lokio/Source;

    .line 47
    new-instance v0, Lokio/HashingSource;

    const-string v1, "MD5"

    invoke-direct {v0, p0, v1}, Lokio/HashingSource;-><init>(Lokio/Source;Ljava/lang/String;)V

    return-object v0
.end method

.method public static sha1(Lokio/Source;)Lokio/HashingSource;
    .locals 2
    .param p0, "source"    # Lokio/Source;

    .line 52
    new-instance v0, Lokio/HashingSource;

    const-string v1, "SHA-1"

    invoke-direct {v0, p0, v1}, Lokio/HashingSource;-><init>(Lokio/Source;Ljava/lang/String;)V

    return-object v0
.end method

.method public static sha256(Lokio/Source;)Lokio/HashingSource;
    .locals 2
    .param p0, "source"    # Lokio/Source;

    .line 57
    new-instance v0, Lokio/HashingSource;

    const-string v1, "SHA-256"

    invoke-direct {v0, p0, v1}, Lokio/HashingSource;-><init>(Lokio/Source;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public hash()Lokio/ByteString;
    .locals 2

    .line 131
    iget-object v0, p0, Lokio/HashingSource;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lokio/HashingSource;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v0}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v0

    .line 132
    .local v0, "result":[B
    :goto_0
    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v1

    return-object v1
.end method

.method public read(Lokio/Buffer;J)J
    .locals 11
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    invoke-super {p0, p1, p2, p3}, Lokio/ForwardingSource;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 96
    .local v0, "result":J
    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_2

    .line 97
    iget-wide v2, p1, Lokio/Buffer;->size:J

    sub-long/2addr v2, v0

    .line 100
    .local v2, "start":J
    iget-wide v4, p1, Lokio/Buffer;->size:J

    .line 101
    .local v4, "offset":J
    iget-object v6, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 102
    .local v6, "s":Lokio/Segment;
    :goto_0
    cmp-long v7, v4, v2

    if-lez v7, :cond_0

    .line 103
    iget-object v6, v6, Lokio/Segment;->prev:Lokio/Segment;

    .line 104
    iget v7, v6, Lokio/Segment;->limit:I

    iget v8, v6, Lokio/Segment;->pos:I

    sub-int/2addr v7, v8

    int-to-long v7, v7

    sub-long/2addr v4, v7

    goto :goto_0

    .line 108
    :cond_0
    :goto_1
    iget-wide v7, p1, Lokio/Buffer;->size:J

    cmp-long v9, v4, v7

    if-gez v9, :cond_2

    .line 109
    iget v7, v6, Lokio/Segment;->pos:I

    int-to-long v7, v7

    add-long/2addr v7, v2

    sub-long/2addr v7, v4

    long-to-int v8, v7

    .line 110
    .local v8, "pos":I
    iget-object v7, p0, Lokio/HashingSource;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v7, :cond_1

    .line 111
    iget-object v9, v6, Lokio/Segment;->data:[B

    iget v10, v6, Lokio/Segment;->limit:I

    sub-int/2addr v10, v8

    invoke-virtual {v7, v9, v8, v10}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_2

    .line 113
    :cond_1
    iget-object v7, p0, Lokio/HashingSource;->mac:Ljavax/crypto/Mac;

    iget-object v9, v6, Lokio/Segment;->data:[B

    iget v10, v6, Lokio/Segment;->limit:I

    sub-int/2addr v10, v8

    invoke-virtual {v7, v9, v8, v10}, Ljavax/crypto/Mac;->update([BII)V

    .line 115
    :goto_2
    iget v7, v6, Lokio/Segment;->limit:I

    iget v9, v6, Lokio/Segment;->pos:I

    sub-int/2addr v7, v9

    int-to-long v9, v7

    add-long/2addr v4, v9

    .line 116
    move-wide v2, v4

    .line 117
    iget-object v6, v6, Lokio/Segment;->next:Lokio/Segment;

    .line 118
    .end local v8    # "pos":I
    goto :goto_1

    .line 121
    .end local v2    # "start":J
    .end local v4    # "offset":J
    .end local v6    # "s":Lokio/Segment;
    :cond_2
    return-wide v0
.end method
