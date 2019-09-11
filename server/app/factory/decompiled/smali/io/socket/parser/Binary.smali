.class public Lio/socket/parser/Binary;
.super Ljava/lang/Object;
.source "Binary.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/parser/Binary$DeconstructedPacket;
    }
.end annotation


# static fields
.field private static final KEY_NUM:Ljava/lang/String; = "num"

.field private static final KEY_PLACEHOLDER:Ljava/lang/String; = "_placeholder"

.field private static final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-class v0, Lio/socket/parser/Binary;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/parser/Binary;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _deconstructPacket(Ljava/lang/Object;Ljava/util/List;)Ljava/lang/Object;
    .locals 9
    .param p0, "data"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "[B>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 35
    .local p1, "buffers":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 37
    :cond_0
    instance-of v1, p0, [B

    const-string v2, "An error occured while putting data to JSONObject"

    if-eqz v1, :cond_1

    .line 38
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 40
    .local v1, "placeholder":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "_placeholder"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 41
    const-string v3, "num"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    nop

    .line 46
    move-object v0, p0

    check-cast v0, [B

    check-cast v0, [B

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    return-object v1

    .line 42
    :catch_0
    move-exception v3

    .line 43
    .local v3, "e":Lorg/json/JSONException;
    sget-object v4, Lio/socket/parser/Binary;->logger:Ljava/util/logging/Logger;

    sget-object v5, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v4, v5, v2, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    return-object v0

    .line 48
    .end local v1    # "placeholder":Lorg/json/JSONObject;
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_1
    instance-of v1, p0, Lorg/json/JSONArray;

    if-eqz v1, :cond_3

    .line 49
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 50
    .local v1, "newData":Lorg/json/JSONArray;
    move-object v2, p0

    check-cast v2, Lorg/json/JSONArray;

    .line 51
    .local v2, "_data":Lorg/json/JSONArray;
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 52
    .local v3, "len":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_2

    .line 54
    :try_start_1
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5, p1}, Lio/socket/parser/Binary;->_deconstructPacket(Ljava/lang/Object;Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 58
    nop

    .line 52
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 55
    :catch_1
    move-exception v5

    .line 56
    .local v5, "e":Lorg/json/JSONException;
    sget-object v6, Lio/socket/parser/Binary;->logger:Ljava/util/logging/Logger;

    sget-object v7, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v8, "An error occured while putting packet data to JSONObject"

    invoke-virtual {v6, v7, v8, v5}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    return-object v0

    .line 60
    .end local v4    # "i":I
    .end local v5    # "e":Lorg/json/JSONException;
    :cond_2
    return-object v1

    .line 61
    .end local v1    # "newData":Lorg/json/JSONArray;
    .end local v2    # "_data":Lorg/json/JSONArray;
    .end local v3    # "len":I
    :cond_3
    instance-of v1, p0, Lorg/json/JSONObject;

    if-eqz v1, :cond_5

    .line 62
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 63
    .local v1, "newData":Lorg/json/JSONObject;
    move-object v3, p0

    check-cast v3, Lorg/json/JSONObject;

    .line 64
    .local v3, "_data":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 65
    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 66
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 68
    .local v5, "key":Ljava/lang/String;
    :try_start_2
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, p1}, Lio/socket/parser/Binary;->_deconstructPacket(Ljava/lang/Object;Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 72
    nop

    .line 73
    .end local v5    # "key":Ljava/lang/String;
    goto :goto_1

    .line 69
    .restart local v5    # "key":Ljava/lang/String;
    :catch_2
    move-exception v6

    .line 70
    .local v6, "e":Lorg/json/JSONException;
    sget-object v7, Lio/socket/parser/Binary;->logger:Ljava/util/logging/Logger;

    sget-object v8, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v7, v8, v2, v6}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    return-object v0

    .line 74
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "e":Lorg/json/JSONException;
    :cond_4
    return-object v1

    .line 76
    .end local v1    # "newData":Lorg/json/JSONObject;
    .end local v3    # "_data":Lorg/json/JSONObject;
    .end local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_5
    return-object p0
.end method

.method private static _reconstructPacket(Ljava/lang/Object;[[B)Ljava/lang/Object;
    .locals 8
    .param p0, "data"    # Ljava/lang/Object;
    .param p1, "buffers"    # [[B

    .line 87
    instance-of v0, p0, Lorg/json/JSONArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 88
    move-object v0, p0

    check-cast v0, Lorg/json/JSONArray;

    .line 89
    .local v0, "_data":Lorg/json/JSONArray;
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    .line 90
    .local v2, "len":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 92
    :try_start_0
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4, p1}, Lio/socket/parser/Binary;->_reconstructPacket(Ljava/lang/Object;[[B)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    nop

    .line 90
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 93
    :catch_0
    move-exception v4

    .line 94
    .local v4, "e":Lorg/json/JSONException;
    sget-object v5, Lio/socket/parser/Binary;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v7, "An error occured while putting packet data to JSONObject"

    invoke-virtual {v5, v6, v7, v4}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 95
    return-object v1

    .line 98
    .end local v3    # "i":I
    .end local v4    # "e":Lorg/json/JSONException;
    :cond_0
    return-object v0

    .line 99
    .end local v0    # "_data":Lorg/json/JSONArray;
    .end local v2    # "len":I
    :cond_1
    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_5

    .line 100
    move-object v0, p0

    check-cast v0, Lorg/json/JSONObject;

    .line 101
    .local v0, "_data":Lorg/json/JSONObject;
    const-string v2, "_placeholder"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 102
    const/4 v2, -0x1

    const-string v3, "num"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    .line 103
    .local v2, "num":I
    if-ltz v2, :cond_2

    array-length v3, p1

    if-ge v2, v3, :cond_2

    aget-object v1, p1, v2

    :cond_2
    return-object v1

    .line 105
    .end local v2    # "num":I
    :cond_3
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .line 106
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 107
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 109
    .local v3, "key":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4, p1}, Lio/socket/parser/Binary;->_reconstructPacket(Ljava/lang/Object;[[B)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 113
    nop

    .line 114
    .end local v3    # "key":Ljava/lang/String;
    goto :goto_1

    .line 110
    .restart local v3    # "key":Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 111
    .restart local v4    # "e":Lorg/json/JSONException;
    sget-object v5, Lio/socket/parser/Binary;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v7, "An error occured while putting data to JSONObject"

    invoke-virtual {v5, v6, v7, v4}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 112
    return-object v1

    .line 115
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "e":Lorg/json/JSONException;
    :cond_4
    return-object v0

    .line 117
    .end local v0    # "_data":Lorg/json/JSONObject;
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_5
    return-object p0
.end method

.method public static deconstructPacket(Lio/socket/parser/Packet;)Lio/socket/parser/Binary$DeconstructedPacket;
    .locals 3
    .param p0, "packet"    # Lio/socket/parser/Packet;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .local v0, "buffers":Ljava/util/List;, "Ljava/util/List<[B>;"
    iget-object v1, p0, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    invoke-static {v1, v0}, Lio/socket/parser/Binary;->_deconstructPacket(Ljava/lang/Object;Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    iput v1, p0, Lio/socket/parser/Packet;->attachments:I

    .line 28
    new-instance v1, Lio/socket/parser/Binary$DeconstructedPacket;

    invoke-direct {v1}, Lio/socket/parser/Binary$DeconstructedPacket;-><init>()V

    .line 29
    .local v1, "result":Lio/socket/parser/Binary$DeconstructedPacket;
    iput-object p0, v1, Lio/socket/parser/Binary$DeconstructedPacket;->packet:Lio/socket/parser/Packet;

    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [[B

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[B

    iput-object v2, v1, Lio/socket/parser/Binary$DeconstructedPacket;->buffers:[[B

    .line 31
    return-object v1
.end method

.method public static reconstructPacket(Lio/socket/parser/Packet;[[B)Lio/socket/parser/Packet;
    .locals 1
    .param p0, "packet"    # Lio/socket/parser/Packet;
    .param p1, "buffers"    # [[B

    .line 81
    iget-object v0, p0, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    invoke-static {v0, p1}, Lio/socket/parser/Binary;->_reconstructPacket(Ljava/lang/Object;[[B)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    .line 82
    const/4 v0, -0x1

    iput v0, p0, Lio/socket/parser/Packet;->attachments:I

    .line 83
    return-object p0
.end method
