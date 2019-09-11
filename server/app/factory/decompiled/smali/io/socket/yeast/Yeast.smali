.class public final Lio/socket/yeast/Yeast;
.super Ljava/lang/Object;
.source "Yeast.java"


# static fields
.field private static alphabet:[C

.field private static length:I

.field private static map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static prev:Ljava/lang/String;

.field private static seed:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 11
    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lio/socket/yeast/Yeast;->alphabet:[C

    .line 13
    sget-object v0, Lio/socket/yeast/Yeast;->alphabet:[C

    array-length v0, v0

    sput v0, Lio/socket/yeast/Yeast;->length:I

    .line 14
    const/4 v0, 0x0

    sput v0, Lio/socket/yeast/Yeast;->seed:I

    .line 16
    new-instance v0, Ljava/util/HashMap;

    sget v1, Lio/socket/yeast/Yeast;->length:I

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lio/socket/yeast/Yeast;->map:Ljava/util/Map;

    .line 18
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget v1, Lio/socket/yeast/Yeast;->length:I

    if-ge v0, v1, :cond_0

    .line 19
    sget-object v1, Lio/socket/yeast/Yeast;->map:Ljava/util/Map;

    sget-object v2, Lio/socket/yeast/Yeast;->alphabet:[C

    aget-char v2, v2, v0

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 21
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)J
    .locals 10
    .param p0, "str"    # Ljava/lang/String;

    .line 37
    const-wide/16 v0, 0x0

    .line 39
    .local v0, "decoded":J
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-char v5, v2, v4

    .line 40
    .local v5, "c":C
    sget v6, Lio/socket/yeast/Yeast;->length:I

    int-to-long v6, v6

    mul-long v6, v6, v0

    sget-object v8, Lio/socket/yeast/Yeast;->map:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    int-to-long v8, v8

    add-long v0, v6, v8

    .line 39
    .end local v5    # "c":C
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 43
    :cond_0
    return-wide v0
.end method

.method public static encode(J)Ljava/lang/String;
    .locals 7
    .param p0, "num"    # J

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .local v0, "encoded":Ljava/lang/StringBuilder;
    move-wide v1, p0

    .line 29
    .local v1, "dividedNum":J
    :goto_0
    const/4 v3, 0x0

    sget-object v4, Lio/socket/yeast/Yeast;->alphabet:[C

    sget v5, Lio/socket/yeast/Yeast;->length:I

    int-to-long v5, v5

    rem-long v5, v1, v5

    long-to-int v6, v5

    aget-char v4, v4, v6

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 30
    sget v3, Lio/socket/yeast/Yeast;->length:I

    int-to-long v3, v3

    div-long/2addr v1, v3

    .line 31
    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-gtz v5, :cond_0

    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 31
    :cond_0
    goto :goto_0
.end method

.method public static yeast()Ljava/lang/String;
    .locals 4

    .line 47
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/socket/yeast/Yeast;->encode(J)Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "now":Ljava/lang/String;
    sget-object v1, Lio/socket/yeast/Yeast;->prev:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 50
    const/4 v1, 0x0

    sput v1, Lio/socket/yeast/Yeast;->seed:I

    .line 51
    sput-object v0, Lio/socket/yeast/Yeast;->prev:Ljava/lang/String;

    .line 52
    return-object v0

    .line 55
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lio/socket/yeast/Yeast;->seed:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lio/socket/yeast/Yeast;->seed:I

    int-to-long v2, v2

    invoke-static {v2, v3}, Lio/socket/yeast/Yeast;->encode(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
