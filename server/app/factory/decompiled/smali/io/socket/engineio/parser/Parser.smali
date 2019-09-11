.class public Lio/socket/engineio/parser/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/parser/Parser$DecodePayloadCallback;,
        Lio/socket/engineio/parser/Parser$EncodeCallback;
    }
.end annotation


# static fields
.field private static final MAX_INT_CHAR_LENGTH:I

.field public static final PROTOCOL:I = 0x3

.field private static err:Lio/socket/engineio/parser/Packet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/socket/engineio/parser/Packet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final packets:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final packetslist:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 15
    const v0, 0x7fffffff

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lio/socket/engineio/parser/Parser;->MAX_INT_CHAR_LENGTH:I

    .line 19
    new-instance v0, Lio/socket/engineio/parser/Parser$1;

    invoke-direct {v0}, Lio/socket/engineio/parser/Parser$1;-><init>()V

    sput-object v0, Lio/socket/engineio/parser/Parser;->packets:Ljava/util/Map;

    .line 29
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    .line 31
    sget-object v0, Lio/socket/engineio/parser/Parser;->packets:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    sget-object v2, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 36
    :cond_0
    new-instance v0, Lio/socket/engineio/parser/Packet;

    const-string v1, "error"

    const-string v2, "parser error"

    invoke-direct {v0, v1, v2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .line 13
    invoke-static {p0}, Lio/socket/engineio/parser/Parser;->stringToByteArray(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method private static byteArrayToString([B)Ljava/lang/String;
    .locals 5
    .param p0, "bytes"    # [B

    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 262
    .local v0, "builder":Ljava/lang/StringBuilder;
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p0, v2

    .line 263
    .local v3, "b":B
    and-int/lit16 v4, v3, 0xff

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 262
    .end local v3    # "b":B
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 265
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static decodePacket(Ljava/lang/String;)Lio/socket/engineio/parser/Packet;
    .locals 1
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lio/socket/engineio/parser/Packet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 75
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/socket/engineio/parser/Parser;->decodePacket(Ljava/lang/String;Z)Lio/socket/engineio/parser/Packet;

    move-result-object v0

    return-object v0
.end method

.method public static decodePacket(Ljava/lang/String;Z)Lio/socket/engineio/parser/Packet;
    .locals 5
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "utf8decode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lio/socket/engineio/parser/Packet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 81
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .local v0, "type":I
    goto :goto_0

    .line 82
    .end local v0    # "type":I
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    const/4 v0, -0x1

    .line 86
    .local v0, "type":I
    :goto_0
    if-eqz p1, :cond_0

    .line 88
    :try_start_1
    invoke-static {p0}, Lio/socket/utf8/UTF8;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catch Lio/socket/utf8/UTF8Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object p0, v1

    .line 91
    goto :goto_1

    .line 89
    :catch_1
    move-exception v1

    .line 90
    .local v1, "e":Lio/socket/utf8/UTF8Exception;
    sget-object v2, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    return-object v2

    .line 94
    .end local v1    # "e":Lio/socket/utf8/UTF8Exception;
    :cond_0
    :goto_1
    if-ltz v0, :cond_3

    sget-object v1, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-lt v0, v1, :cond_1

    goto :goto_2

    .line 98
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_2

    .line 99
    new-instance v1, Lio/socket/engineio/parser/Packet;

    sget-object v3, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1

    .line 101
    :cond_2
    new-instance v1, Lio/socket/engineio/parser/Packet;

    sget-object v2, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {v1, v2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 95
    :cond_3
    :goto_2
    sget-object v1, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    return-object v1
.end method

.method public static decodePacket([B)Lio/socket/engineio/parser/Packet;
    .locals 5
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Lio/socket/engineio/parser/Packet<",
            "[B>;"
        }
    .end annotation

    .line 106
    const/4 v0, 0x0

    aget-byte v1, p0, v0

    .line 107
    .local v1, "type":I
    array-length v2, p0

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    new-array v2, v2, [B

    .line 108
    .local v2, "intArray":[B
    array-length v4, v2

    invoke-static {p0, v3, v2, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 109
    new-instance v0, Lio/socket/engineio/parser/Packet;

    sget-object v3, Lio/socket/engineio/parser/Parser;->packetslist:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-direct {v0, v3, v2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method public static decodePayload(Ljava/lang/String;Lio/socket/engineio/parser/Parser$DecodePayloadCallback;)V
    .locals 11
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 153
    .local p1, "callback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<Ljava/lang/String;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_2

    .line 158
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .local v2, "length":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .local v4, "l":I
    :goto_0
    if-ge v3, v4, :cond_4

    .line 160
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 162
    .local v5, "chr":C
    const/16 v6, 0x3a

    if-eq v6, v5, :cond_1

    .line 163
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 167
    :cond_1
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 171
    .local v6, "n":I
    nop

    .line 175
    add-int/lit8 v7, v3, 0x1

    add-int/lit8 v8, v3, 0x1

    add-int/2addr v8, v6

    :try_start_1
    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 179
    .local v7, "msg":Ljava/lang/String;
    nop

    .line 181
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_3

    .line 182
    invoke-static {v7, v1}, Lio/socket/engineio/parser/Parser;->decodePacket(Ljava/lang/String;Z)Lio/socket/engineio/parser/Packet;

    move-result-object v8

    .line 183
    .local v8, "packet":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<Ljava/lang/String;>;"
    sget-object v9, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    iget-object v9, v9, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    iget-object v10, v8, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    sget-object v9, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    iget-object v9, v9, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v10, v8, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 184
    sget-object v9, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, v9, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    .line 185
    return-void

    .line 188
    :cond_2
    add-int v9, v3, v6

    invoke-interface {p1, v8, v9, v4}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    move-result v9

    .line 189
    .local v9, "ret":Z
    if-nez v9, :cond_3

    return-void

    .line 192
    .end local v8    # "packet":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<Ljava/lang/String;>;"
    .end local v9    # "ret":Z
    :cond_3
    add-int/2addr v3, v6

    .line 193
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move-object v2, v8

    .line 159
    .end local v5    # "chr":C
    .end local v6    # "n":I
    .end local v7    # "msg":Ljava/lang/String;
    :goto_1
    add-int/2addr v3, v1

    goto :goto_0

    .line 176
    .restart local v5    # "chr":C
    .restart local v6    # "n":I
    :catch_0
    move-exception v7

    .line 177
    .local v7, "e":Ljava/lang/IndexOutOfBoundsException;
    sget-object v8, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, v8, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    .line 178
    return-void

    .line 168
    .end local v6    # "n":I
    .end local v7    # "e":Ljava/lang/IndexOutOfBoundsException;
    :catch_1
    move-exception v6

    .line 169
    .local v6, "e":Ljava/lang/NumberFormatException;
    sget-object v7, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, v7, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    .line 170
    return-void

    .line 197
    .end local v3    # "i":I
    .end local v4    # "l":I
    .end local v5    # "chr":C
    .end local v6    # "e":Ljava/lang/NumberFormatException;
    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_5

    .line 198
    sget-object v3, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, v3, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    .line 200
    :cond_5
    return-void

    .line 154
    .end local v2    # "length":Ljava/lang/StringBuilder;
    :cond_6
    :goto_2
    sget-object v2, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {p1, v2, v0, v1}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    .line 155
    return-void
.end method

.method public static decodePayload([BLio/socket/engineio/parser/Parser$DecodePayloadCallback;)V
    .locals 12
    .param p0, "data"    # [B
    .param p1, "callback"    # Lio/socket/engineio/parser/Parser$DecodePayloadCallback;

    .line 203
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 204
    .local v0, "bufferTail":Ljava/nio/ByteBuffer;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 206
    .local v1, "buffers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    const/4 v3, 0x1

    if-lez v2, :cond_5

    .line 207
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    .local v2, "strLen":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v5

    const/16 v6, 0xff

    and-int/2addr v5, v6

    if-nez v5, :cond_0

    const/4 v5, 0x1

    goto :goto_1

    :cond_0
    const/4 v5, 0x0

    .line 209
    .local v5, "isString":Z
    :goto_1
    const/4 v7, 0x0

    .line 210
    .local v7, "numberTooLong":Z
    const/4 v8, 0x1

    .line 211
    .local v8, "i":I
    :goto_2
    invoke-virtual {v0, v8}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v9

    and-int/2addr v9, v6

    .line 212
    .local v9, "b":I
    if-ne v9, v6, :cond_1

    goto :goto_3

    .line 214
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    sget v11, Lio/socket/engineio/parser/Parser;->MAX_INT_CHAR_LENGTH:I

    if-le v10, v11, :cond_4

    .line 215
    const/4 v7, 0x1

    .line 216
    nop

    .line 220
    .end local v8    # "i":I
    .end local v9    # "b":I
    :goto_3
    if-eqz v7, :cond_2

    .line 222
    move-object v6, p1

    .line 223
    .local v6, "tempCallback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<Ljava/lang/String;>;"
    sget-object v8, Lio/socket/engineio/parser/Parser;->err:Lio/socket/engineio/parser/Packet;

    invoke-interface {v6, v8, v4, v3}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    .line 224
    return-void

    .line 226
    .end local v6    # "tempCallback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<Ljava/lang/String;>;"
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/2addr v4, v3

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 227
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 229
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 231
    .local v4, "msgLength":I
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 232
    add-int/lit8 v3, v4, 0x1

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 233
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v3, v3, [B

    .line 234
    .local v3, "msg":[B
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 235
    if-eqz v5, :cond_3

    .line 236
    invoke-static {v3}, Lio/socket/engineio/parser/Parser;->byteArrayToString([B)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 238
    :cond_3
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    :goto_4
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 241
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 242
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 243
    .end local v2    # "strLen":Ljava/lang/StringBuilder;
    .end local v3    # "msg":[B
    .end local v4    # "msgLength":I
    .end local v5    # "isString":Z
    .end local v7    # "numberTooLong":Z
    goto :goto_0

    .line 218
    .restart local v2    # "strLen":Ljava/lang/StringBuilder;
    .restart local v5    # "isString":Z
    .restart local v7    # "numberTooLong":Z
    .restart local v8    # "i":I
    .restart local v9    # "b":I
    :cond_4
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    .end local v9    # "b":I
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 245
    .end local v2    # "strLen":Ljava/lang/StringBuilder;
    .end local v5    # "isString":Z
    .end local v7    # "numberTooLong":Z
    .end local v8    # "i":I
    :cond_5
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    .line 246
    .local v2, "total":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_5
    if-ge v4, v2, :cond_8

    .line 247
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 248
    .local v5, "buffer":Ljava/lang/Object;
    instance-of v6, v5, Ljava/lang/String;

    if-eqz v6, :cond_6

    .line 250
    move-object v6, p1

    .line 251
    .restart local v6    # "tempCallback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<Ljava/lang/String;>;"
    move-object v7, v5

    check-cast v7, Ljava/lang/String;

    invoke-static {v7, v3}, Lio/socket/engineio/parser/Parser;->decodePacket(Ljava/lang/String;Z)Lio/socket/engineio/parser/Packet;

    move-result-object v7

    invoke-interface {v6, v7, v4, v2}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    .end local v6    # "tempCallback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<Ljava/lang/String;>;"
    goto :goto_6

    .line 252
    :cond_6
    instance-of v6, v5, [B

    if-eqz v6, :cond_7

    .line 254
    move-object v6, p1

    .line 255
    .local v6, "tempCallback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<[B>;"
    move-object v7, v5

    check-cast v7, [B

    check-cast v7, [B

    invoke-static {v7}, Lio/socket/engineio/parser/Parser;->decodePacket([B)Lio/socket/engineio/parser/Packet;

    move-result-object v7

    invoke-interface {v6, v7, v4, v2}, Lio/socket/engineio/parser/Parser$DecodePayloadCallback;->call(Lio/socket/engineio/parser/Packet;II)Z

    goto :goto_7

    .line 252
    .end local v6    # "tempCallback":Lio/socket/engineio/parser/Parser$DecodePayloadCallback;, "Lio/socket/engineio/parser/Parser$DecodePayloadCallback<[B>;"
    :cond_7
    :goto_6
    nop

    .line 246
    .end local v5    # "buffer":Ljava/lang/Object;
    :goto_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 258
    .end local v4    # "i":I
    :cond_8
    return-void
.end method

.method private static encodeByteArray(Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/socket/engineio/parser/Packet<",
            "[B>;",
            "Lio/socket/engineio/parser/Parser$EncodeCallback<",
            "[B>;)V"
        }
    .end annotation

    .line 67
    .local p0, "packet":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<[B>;"
    .local p1, "callback":Lio/socket/engineio/parser/Parser$EncodeCallback;, "Lio/socket/engineio/parser/Parser$EncodeCallback<[B>;"
    iget-object v0, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    check-cast v0, [B

    .line 68
    .local v0, "data":[B
    array-length v1, v0

    const/4 v2, 0x1

    add-int/2addr v1, v2

    new-array v1, v1, [B

    .line 69
    .local v1, "resultArray":[B
    sget-object v3, Lio/socket/engineio/parser/Parser;->packets:Ljava/util/Map;

    iget-object v4, p0, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->byteValue()B

    move-result v3

    const/4 v4, 0x0

    aput-byte v3, v1, v4

    .line 70
    array-length v3, v0

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 71
    invoke-interface {p1, v1}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    .line 72
    return-void
.end method

.method public static encodePacket(Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 1
    .param p0, "packet"    # Lio/socket/engineio/parser/Packet;
    .param p1, "callback"    # Lio/socket/engineio/parser/Parser$EncodeCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .line 42
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lio/socket/engineio/parser/Parser;->encodePacket(Lio/socket/engineio/parser/Packet;ZLio/socket/engineio/parser/Parser$EncodeCallback;)V

    .line 43
    return-void
.end method

.method public static encodePacket(Lio/socket/engineio/parser/Packet;ZLio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 3
    .param p0, "packet"    # Lio/socket/engineio/parser/Packet;
    .param p1, "utf8encode"    # Z
    .param p2, "callback"    # Lio/socket/engineio/parser/Parser$EncodeCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    instance-of v0, v0, [B

    if-eqz v0, :cond_0

    .line 48
    move-object v0, p0

    .line 50
    .local v0, "packetToEncode":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<[B>;"
    move-object v1, p2

    .line 51
    .local v1, "callbackToEncode":Lio/socket/engineio/parser/Parser$EncodeCallback;, "Lio/socket/engineio/parser/Parser$EncodeCallback<[B>;"
    invoke-static {v0, v1}, Lio/socket/engineio/parser/Parser;->encodeByteArray(Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V

    .line 52
    return-void

    .line 55
    .end local v0    # "packetToEncode":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<[B>;"
    .end local v1    # "callbackToEncode":Lio/socket/engineio/parser/Parser$EncodeCallback;, "Lio/socket/engineio/parser/Parser$EncodeCallback<[B>;"
    :cond_0
    sget-object v0, Lio/socket/engineio/parser/Parser;->packets:Ljava/util/Map;

    iget-object v1, p0, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "encoded":Ljava/lang/String;
    iget-object v1, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    if-eqz v1, :cond_2

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_1

    iget-object v2, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lio/socket/utf8/UTF8;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 62
    :cond_2
    move-object v1, p2

    .line 63
    .local v1, "tempCallback":Lio/socket/engineio/parser/Parser$EncodeCallback;, "Lio/socket/engineio/parser/Parser$EncodeCallback<Ljava/lang/String;>;"
    invoke-interface {v1, v0}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    .line 64
    return-void
.end method

.method public static encodePayload([Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 6
    .param p0, "packets"    # [Lio/socket/engineio/parser/Packet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/socket/engineio/parser/Packet;",
            "Lio/socket/engineio/parser/Parser$EncodeCallback<",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .line 113
    .local p1, "callback":Lio/socket/engineio/parser/Parser$EncodeCallback;, "Lio/socket/engineio/parser/Parser$EncodeCallback<[B>;"
    array-length v0, p0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 114
    new-array v0, v1, [B

    invoke-interface {p1, v0}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    .line 115
    return-void

    .line 118
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p0

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 120
    .local v0, "results":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    array-length v2, p0

    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, p0, v1

    .line 121
    .local v3, "packet":Lio/socket/engineio/parser/Packet;
    new-instance v4, Lio/socket/engineio/parser/Parser$2;

    invoke-direct {v4, v0}, Lio/socket/engineio/parser/Parser$2;-><init>(Ljava/util/ArrayList;)V

    const/4 v5, 0x1

    invoke-static {v3, v5, v4}, Lio/socket/engineio/parser/Parser;->encodePacket(Lio/socket/engineio/parser/Packet;ZLio/socket/engineio/parser/Parser$EncodeCallback;)V

    .line 120
    .end local v3    # "packet":Lio/socket/engineio/parser/Packet;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 149
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [[B

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    invoke-static {v1}, Lio/socket/engineio/parser/Buffer;->concat([[B)[B

    move-result-object v1

    invoke-interface {p1, v1}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    .line 150
    return-void
.end method

.method private static stringToByteArray(Ljava/lang/String;)[B
    .locals 4
    .param p0, "string"    # Ljava/lang/String;

    .line 269
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 270
    .local v0, "len":I
    new-array v1, v0, [B

    .line 271
    .local v1, "bytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 272
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 271
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 274
    .end local v2    # "i":I
    :cond_0
    return-object v1
.end method
