.class final Lio/socket/engineio/parser/Parser$2;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Lio/socket/engineio/parser/Parser$EncodeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/parser/Parser;->encodePayload([Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$results:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lio/socket/engineio/parser/Parser$2;->val$results:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)V
    .locals 9
    .param p1, "packet"    # Ljava/lang/Object;

    .line 124
    instance-of v0, p1, Ljava/lang/String;

    const/4 v1, -0x1

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_1

    .line 125
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "encodingLength":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v2

    new-array v5, v5, [B

    .line 128
    .local v5, "sizeBuffer":[B
    aput-byte v3, v5, v3

    .line 129
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v6, v7, :cond_0

    .line 130
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v8

    int-to-byte v8, v8

    aput-byte v8, v5, v7

    .line 129
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 132
    .end local v6    # "i":I
    :cond_0
    array-length v6, v5

    sub-int/2addr v6, v4

    aput-byte v1, v5, v6

    .line 133
    iget-object v1, p0, Lio/socket/engineio/parser/Parser$2;->val$results:Ljava/util/ArrayList;

    new-array v2, v2, [[B

    aput-object v5, v2, v3

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lio/socket/engineio/parser/Parser;->access$000(Ljava/lang/String;)[B

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v2}, Lio/socket/engineio/parser/Buffer;->concat([[B)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    return-void

    .line 137
    .end local v0    # "encodingLength":Ljava/lang/String;
    .end local v5    # "sizeBuffer":[B
    :cond_1
    move-object v0, p1

    check-cast v0, [B

    check-cast v0, [B

    array-length v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 138
    .restart local v0    # "encodingLength":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v2

    new-array v5, v5, [B

    .line 139
    .restart local v5    # "sizeBuffer":[B
    aput-byte v4, v5, v3

    .line 140
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v6, v7, :cond_2

    .line 141
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v8

    int-to-byte v8, v8

    aput-byte v8, v5, v7

    .line 140
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 143
    .end local v6    # "i":I
    :cond_2
    array-length v6, v5

    sub-int/2addr v6, v4

    aput-byte v1, v5, v6

    .line 144
    iget-object v1, p0, Lio/socket/engineio/parser/Parser$2;->val$results:Ljava/util/ArrayList;

    new-array v2, v2, [[B

    aput-object v5, v2, v3

    move-object v3, p1

    check-cast v3, [B

    check-cast v3, [B

    aput-object v3, v2, v4

    invoke-static {v2}, Lio/socket/engineio/parser/Buffer;->concat([[B)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    return-void
.end method
