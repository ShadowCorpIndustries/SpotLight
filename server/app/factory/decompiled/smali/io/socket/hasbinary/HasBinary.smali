.class public Lio/socket/hasbinary/HasBinary;
.super Ljava/lang/Object;
.source "HasBinary.java"


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    const-class v0, Lio/socket/hasbinary/HasBinary;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/hasbinary/HasBinary;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _hasBinary(Ljava/lang/Object;)Z
    .locals 8
    .param p0, "obj"    # Ljava/lang/Object;

    .line 22
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 24
    :cond_0
    instance-of v1, p0, [B

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 25
    return v2

    .line 28
    :cond_1
    instance-of v1, p0, Lorg/json/JSONArray;

    if-eqz v1, :cond_5

    .line 29
    move-object v1, p0

    check-cast v1, Lorg/json/JSONArray;

    .line 30
    .local v1, "_obj":Lorg/json/JSONArray;
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 31
    .local v3, "length":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_4

    .line 34
    :try_start_0
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_2

    const/4 v5, 0x0

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .local v5, "v":Ljava/lang/Object;
    :goto_1
    nop

    .line 39
    invoke-static {v5}, Lio/socket/hasbinary/HasBinary;->_hasBinary(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 40
    return v2

    .line 31
    .end local v5    # "v":Ljava/lang/Object;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 35
    :catch_0
    move-exception v2

    .line 36
    .local v2, "e":Lorg/json/JSONException;
    sget-object v5, Lio/socket/hasbinary/HasBinary;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v7, "An error occured while retrieving data from JSONArray"

    invoke-virtual {v5, v6, v7, v2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    return v0

    .line 31
    .end local v1    # "_obj":Lorg/json/JSONArray;
    .end local v2    # "e":Lorg/json/JSONException;
    .end local v3    # "length":I
    .end local v4    # "i":I
    :cond_4
    goto :goto_3

    .line 43
    :cond_5
    instance-of v1, p0, Lorg/json/JSONObject;

    if-eqz v1, :cond_7

    .line 44
    move-object v1, p0

    check-cast v1, Lorg/json/JSONObject;

    .line 45
    .local v1, "_obj":Lorg/json/JSONObject;
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 46
    .local v3, "keys":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 47
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 50
    .local v4, "key":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 54
    .restart local v5    # "v":Ljava/lang/Object;
    nop

    .line 55
    invoke-static {v5}, Lio/socket/hasbinary/HasBinary;->_hasBinary(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 56
    return v2

    .line 58
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "v":Ljava/lang/Object;
    :cond_6
    goto :goto_2

    .line 51
    .restart local v4    # "key":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 52
    .restart local v2    # "e":Lorg/json/JSONException;
    sget-object v5, Lio/socket/hasbinary/HasBinary;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v7, "An error occured while retrieving data from JSONObject"

    invoke-virtual {v5, v6, v7, v2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    return v0

    .line 43
    .end local v1    # "_obj":Lorg/json/JSONObject;
    .end local v2    # "e":Lorg/json/JSONException;
    .end local v3    # "keys":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    :cond_7
    :goto_3
    nop

    .line 61
    :cond_8
    return v0
.end method

.method public static hasBinary(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "data"    # Ljava/lang/Object;

    .line 18
    invoke-static {p0}, Lio/socket/hasbinary/HasBinary;->_hasBinary(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
