.class public final Lokhttp3/Cookie;
.super Ljava/lang/Object;
.source "Cookie.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/Cookie$Builder;
    }
.end annotation


# static fields
.field private static final DAY_OF_MONTH_PATTERN:Ljava/util/regex/Pattern;

.field private static final MONTH_PATTERN:Ljava/util/regex/Pattern;

.field private static final TIME_PATTERN:Ljava/util/regex/Pattern;

.field private static final YEAR_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final domain:Ljava/lang/String;

.field private final expiresAt:J

.field private final hostOnly:Z

.field private final httpOnly:Z

.field private final name:Ljava/lang/String;

.field private final path:Ljava/lang/String;

.field private final persistent:Z

.field private final secure:Z

.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    nop

    .line 45
    const-string v0, "(\\d{2,4})[^\\d]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lokhttp3/Cookie;->YEAR_PATTERN:Ljava/util/regex/Pattern;

    .line 46
    nop

    .line 47
    const-string v0, "(?i)(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec).*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lokhttp3/Cookie;->MONTH_PATTERN:Ljava/util/regex/Pattern;

    .line 48
    nop

    .line 49
    const-string v0, "(\\d{1,2})[^\\d]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lokhttp3/Cookie;->DAY_OF_MONTH_PATTERN:Ljava/util/regex/Pattern;

    .line 50
    nop

    .line 51
    const-string v0, "(\\d{1,2}):(\\d{1,2}):(\\d{1,2})[^\\d]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lokhttp3/Cookie;->TIME_PATTERN:Ljava/util/regex/Pattern;

    .line 50
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZ)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "expiresAt"    # J
    .param p5, "domain"    # Ljava/lang/String;
    .param p6, "path"    # Ljava/lang/String;
    .param p7, "secure"    # Z
    .param p8, "httpOnly"    # Z
    .param p9, "hostOnly"    # Z
    .param p10, "persistent"    # Z

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lokhttp3/Cookie;->name:Ljava/lang/String;

    .line 67
    iput-object p2, p0, Lokhttp3/Cookie;->value:Ljava/lang/String;

    .line 68
    iput-wide p3, p0, Lokhttp3/Cookie;->expiresAt:J

    .line 69
    iput-object p5, p0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    .line 70
    iput-object p6, p0, Lokhttp3/Cookie;->path:Ljava/lang/String;

    .line 71
    iput-boolean p7, p0, Lokhttp3/Cookie;->secure:Z

    .line 72
    iput-boolean p8, p0, Lokhttp3/Cookie;->httpOnly:Z

    .line 73
    iput-boolean p9, p0, Lokhttp3/Cookie;->hostOnly:Z

    .line 74
    iput-boolean p10, p0, Lokhttp3/Cookie;->persistent:Z

    .line 75
    return-void
.end method

.method constructor <init>(Lokhttp3/Cookie$Builder;)V
    .locals 2
    .param p1, "builder"    # Lokhttp3/Cookie$Builder;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iget-object v0, p1, Lokhttp3/Cookie$Builder;->name:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 79
    iget-object v0, p1, Lokhttp3/Cookie$Builder;->value:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 80
    iget-object v0, p1, Lokhttp3/Cookie$Builder;->domain:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p1, Lokhttp3/Cookie$Builder;->name:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/Cookie;->name:Ljava/lang/String;

    .line 83
    iget-object v0, p1, Lokhttp3/Cookie$Builder;->value:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/Cookie;->value:Ljava/lang/String;

    .line 84
    iget-wide v0, p1, Lokhttp3/Cookie$Builder;->expiresAt:J

    iput-wide v0, p0, Lokhttp3/Cookie;->expiresAt:J

    .line 85
    iget-object v0, p1, Lokhttp3/Cookie$Builder;->domain:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    .line 86
    iget-object v0, p1, Lokhttp3/Cookie$Builder;->path:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/Cookie;->path:Ljava/lang/String;

    .line 87
    iget-boolean v0, p1, Lokhttp3/Cookie$Builder;->secure:Z

    iput-boolean v0, p0, Lokhttp3/Cookie;->secure:Z

    .line 88
    iget-boolean v0, p1, Lokhttp3/Cookie$Builder;->httpOnly:Z

    iput-boolean v0, p0, Lokhttp3/Cookie;->httpOnly:Z

    .line 89
    iget-boolean v0, p1, Lokhttp3/Cookie$Builder;->persistent:Z

    iput-boolean v0, p0, Lokhttp3/Cookie;->persistent:Z

    .line 90
    iget-boolean v0, p1, Lokhttp3/Cookie$Builder;->hostOnly:Z

    iput-boolean v0, p0, Lokhttp3/Cookie;->hostOnly:Z

    .line 91
    return-void

    .line 80
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "builder.domain == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "builder.value == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "builder.name == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static dateCharacterOffset(Ljava/lang/String;IIZ)I
    .locals 4
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I
    .param p3, "invert"    # Z

    .line 380
    move v0, p1

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_7

    .line 381
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 382
    .local v1, "c":I
    const/16 v2, 0x20

    if-ge v1, v2, :cond_0

    const/16 v2, 0x9

    if-ne v1, v2, :cond_5

    :cond_0
    const/16 v2, 0x7f

    if-ge v1, v2, :cond_5

    const/16 v2, 0x30

    if-lt v1, v2, :cond_1

    const/16 v2, 0x39

    if-le v1, v2, :cond_5

    :cond_1
    const/16 v2, 0x61

    if-lt v1, v2, :cond_2

    const/16 v2, 0x7a

    if-le v1, v2, :cond_5

    :cond_2
    const/16 v2, 0x41

    if-lt v1, v2, :cond_3

    const/16 v2, 0x5a

    if-le v1, v2, :cond_5

    :cond_3
    const/16 v2, 0x3a

    if-ne v1, v2, :cond_4

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    goto :goto_2

    :cond_5
    :goto_1
    const/4 v2, 0x1

    .line 387
    .local v2, "dateCharacter":Z
    :goto_2
    xor-int/lit8 v3, p3, 0x1

    if-ne v2, v3, :cond_6

    return v0

    .line 380
    .end local v1    # "c":I
    .end local v2    # "dateCharacter":Z
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 389
    .end local v0    # "i":I
    :cond_7
    return p2
.end method

.method private static domainMatch(Lokhttp3/HttpUrl;Ljava/lang/String;)Z
    .locals 4
    .param p0, "url"    # Lokhttp3/HttpUrl;
    .param p1, "domain"    # Ljava/lang/String;

    .line 183
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "urlHost":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 186
    return v2

    .line 189
    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 190
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v1, v3

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x2e

    if-ne v1, v3, :cond_1

    .line 191
    invoke-static {v0}, Lokhttp3/internal/Util;->verifyAsIpAddress(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 192
    return v2

    .line 195
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method static parse(JLokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Cookie;
    .locals 30
    .param p0, "currentTimeMillis"    # J
    .param p2, "url"    # Lokhttp3/HttpUrl;
    .param p3, "setCookie"    # Ljava/lang/String;

    .line 222
    move-object/from16 v1, p3

    const/4 v0, 0x0

    .line 223
    .local v0, "pos":I
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v2

    .line 224
    .local v2, "limit":I
    const/16 v3, 0x3b

    invoke-static {v1, v0, v2, v3}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v4

    .line 226
    .local v4, "cookiePairEnd":I
    const/16 v5, 0x3d

    invoke-static {v1, v0, v4, v5}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v6

    .line 227
    .local v6, "pairEqualsSign":I
    const/4 v7, 0x0

    if-ne v6, v4, :cond_0

    return-object v7

    .line 229
    :cond_0
    invoke-static {v1, v0, v6}, Lokhttp3/internal/Util;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v19

    .line 230
    .local v19, "cookieName":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_1

    return-object v7

    .line 232
    :cond_1
    add-int/lit8 v8, v6, 0x1

    invoke-static {v1, v8, v4}, Lokhttp3/internal/Util;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v20

    .line 234
    .local v20, "cookieValue":Ljava/lang/String;
    const-wide v8, 0xe677d21fdbffL

    .line 235
    .local v8, "expiresAt":J
    const-wide/16 v10, -0x1

    .line 236
    .local v10, "deltaSeconds":J
    const/4 v12, 0x0

    .line 237
    .local v12, "domain":Ljava/lang/String;
    const/4 v13, 0x0

    .line 238
    .local v13, "path":Ljava/lang/String;
    const/4 v14, 0x0

    .line 239
    .local v14, "secureOnly":Z
    const/4 v15, 0x0

    .line 240
    .local v15, "httpOnly":Z
    const/16 v16, 0x1

    .line 241
    .local v16, "hostOnly":Z
    const/16 v17, 0x0

    .line 243
    .local v17, "persistent":Z
    add-int/lit8 v0, v4, 0x1

    move-wide/from16 v21, v10

    move/from16 v24, v14

    move/from16 v25, v15

    move/from16 v26, v16

    move/from16 v23, v17

    move v15, v0

    .line 244
    .end local v0    # "pos":I
    .end local v10    # "deltaSeconds":J
    .end local v14    # "secureOnly":Z
    .end local v16    # "hostOnly":Z
    .end local v17    # "persistent":Z
    .local v15, "pos":I
    .local v21, "deltaSeconds":J
    .local v23, "persistent":Z
    .local v24, "secureOnly":Z
    .local v25, "httpOnly":Z
    .local v26, "hostOnly":Z
    :goto_0
    const/4 v0, 0x0

    if-ge v15, v2, :cond_9

    .line 245
    invoke-static {v1, v15, v2, v3}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v10

    .line 247
    .local v10, "attributePairEnd":I
    invoke-static {v1, v15, v10, v5}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v11

    .line 248
    .local v11, "attributeEqualsSign":I
    invoke-static {v1, v15, v11}, Lokhttp3/internal/Util;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v14

    .line 249
    .local v14, "attributeName":Ljava/lang/String;
    if-ge v11, v10, :cond_2

    add-int/lit8 v3, v11, 0x1

    .line 250
    invoke-static {v1, v3, v10}, Lokhttp3/internal/Util;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_2
    const-string v3, ""

    .line 253
    .local v3, "attributeValue":Ljava/lang/String;
    :goto_1
    const-string v5, "expires"

    invoke-virtual {v14, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 255
    :try_start_0
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    invoke-static {v3, v0, v5}, Lokhttp3/Cookie;->parseExpires(Ljava/lang/String;II)J

    move-result-wide v27
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide/from16 v8, v27

    .line 256
    const/16 v23, 0x1

    .line 259
    :goto_2
    goto :goto_4

    .line 257
    :catch_0
    move-exception v0

    goto :goto_2

    .line 260
    :cond_3
    const-string v0, "max-age"

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 262
    :try_start_1
    invoke-static {v3}, Lokhttp3/Cookie;->parseMaxAge(Ljava/lang/String;)J

    move-result-wide v27
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-wide/from16 v21, v27

    .line 263
    const/16 v23, 0x1

    .line 266
    :goto_3
    goto :goto_4

    .line 264
    :catch_1
    move-exception v0

    goto :goto_3

    .line 267
    :cond_4
    const-string v0, "domain"

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 269
    :try_start_2
    invoke-static {v3}, Lokhttp3/Cookie;->parseDomain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_2

    .line 270
    .end local v12    # "domain":Ljava/lang/String;
    .local v0, "domain":Ljava/lang/String;
    const/16 v26, 0x0

    .line 273
    move-object v12, v0

    goto :goto_4

    .line 271
    .end local v0    # "domain":Ljava/lang/String;
    .restart local v12    # "domain":Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 273
    goto :goto_4

    .line 274
    :cond_5
    const-string v0, "path"

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 275
    move-object v0, v3

    move-object v13, v0

    .end local v13    # "path":Ljava/lang/String;
    .local v0, "path":Ljava/lang/String;
    goto :goto_4

    .line 276
    .end local v0    # "path":Ljava/lang/String;
    .restart local v13    # "path":Ljava/lang/String;
    :cond_6
    const-string v0, "secure"

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 277
    const/16 v24, 0x1

    goto :goto_4

    .line 278
    :cond_7
    const-string v0, "httponly"

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 279
    const/16 v25, 0x1

    .line 282
    :cond_8
    :goto_4
    add-int/lit8 v15, v10, 0x1

    .line 283
    .end local v3    # "attributeValue":Ljava/lang/String;
    .end local v10    # "attributePairEnd":I
    .end local v11    # "attributeEqualsSign":I
    .end local v14    # "attributeName":Ljava/lang/String;
    const/16 v3, 0x3b

    const/16 v5, 0x3d

    goto :goto_0

    .line 287
    :cond_9
    const-wide/high16 v10, -0x8000000000000000L

    cmp-long v3, v21, v10

    if-nez v3, :cond_a

    .line 288
    const-wide/high16 v8, -0x8000000000000000L

    move-wide/from16 v27, v8

    goto :goto_7

    .line 289
    :cond_a
    const-wide/16 v10, -0x1

    cmp-long v3, v21, v10

    if-eqz v3, :cond_e

    .line 290
    const-wide v10, 0x20c49ba5e353f7L

    cmp-long v3, v21, v10

    if-gtz v3, :cond_b

    const-wide/16 v10, 0x3e8

    mul-long v10, v10, v21

    goto :goto_5

    :cond_b
    const-wide v10, 0x7fffffffffffffffL

    .line 293
    .local v10, "deltaMilliseconds":J
    :goto_5
    add-long v8, p0, v10

    .line 294
    cmp-long v3, v8, p0

    if-ltz v3, :cond_d

    const-wide v16, 0xe677d21fdbffL

    cmp-long v3, v8, v16

    if-lez v3, :cond_c

    goto :goto_6

    :cond_c
    move-wide/from16 v27, v8

    goto :goto_7

    .line 295
    :cond_d
    :goto_6
    const-wide v8, 0xe677d21fdbffL

    move-wide/from16 v27, v8

    goto :goto_7

    .line 289
    .end local v10    # "deltaMilliseconds":J
    :cond_e
    move-wide/from16 v27, v8

    .line 300
    .end local v8    # "expiresAt":J
    .local v27, "expiresAt":J
    :goto_7
    if-nez v12, :cond_f

    .line 301
    invoke-virtual/range {p2 .. p2}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v3

    move-object v5, v3

    move-object/from16 v3, p2

    .end local v12    # "domain":Ljava/lang/String;
    .local v3, "domain":Ljava/lang/String;
    goto :goto_8

    .line 302
    .end local v3    # "domain":Ljava/lang/String;
    .restart local v12    # "domain":Ljava/lang/String;
    :cond_f
    move-object/from16 v3, p2

    invoke-static {v3, v12}, Lokhttp3/Cookie;->domainMatch(Lokhttp3/HttpUrl;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_10

    .line 303
    return-object v7

    .line 302
    :cond_10
    move-object v5, v12

    .line 308
    .end local v12    # "domain":Ljava/lang/String;
    .local v5, "domain":Ljava/lang/String;
    :goto_8
    const-string v7, "/"

    if-eqz v13, :cond_12

    invoke-virtual {v13, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_11

    goto :goto_9

    :cond_11
    move-object v0, v13

    goto :goto_a

    .line 309
    :cond_12
    :goto_9
    invoke-virtual/range {p2 .. p2}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v8

    .line 310
    .local v8, "encodedPath":Ljava/lang/String;
    const/16 v9, 0x2f

    invoke-virtual {v8, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    .line 311
    .local v9, "lastSlash":I
    if-eqz v9, :cond_13

    invoke-virtual {v8, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    :cond_13
    move-object v0, v7

    .line 314
    .end local v8    # "encodedPath":Ljava/lang/String;
    .end local v9    # "lastSlash":I
    .end local v13    # "path":Ljava/lang/String;
    .restart local v0    # "path":Ljava/lang/String;
    :goto_a
    new-instance v7, Lokhttp3/Cookie;

    move-object v8, v7

    move-object/from16 v9, v19

    move-object/from16 v10, v20

    move-wide/from16 v11, v27

    move-object v13, v5

    move-object v14, v0

    move/from16 v29, v15

    .end local v15    # "pos":I
    .local v29, "pos":I
    move/from16 v15, v24

    move/from16 v16, v25

    move/from16 v17, v26

    move/from16 v18, v23

    invoke-direct/range {v8 .. v18}, Lokhttp3/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZ)V

    return-object v7
.end method

.method public static parse(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Cookie;
    .locals 2
    .param p0, "url"    # Lokhttp3/HttpUrl;
    .param p1, "setCookie"    # Ljava/lang/String;

    .line 218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1, p0, p1}, Lokhttp3/Cookie;->parse(JLokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Cookie;

    move-result-object v0

    return-object v0
.end method

.method public static parseAll(Lokhttp3/HttpUrl;Lokhttp3/Headers;)Ljava/util/List;
    .locals 6
    .param p0, "url"    # Lokhttp3/HttpUrl;
    .param p1, "headers"    # Lokhttp3/Headers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/HttpUrl;",
            "Lokhttp3/Headers;",
            ")",
            "Ljava/util/List<",
            "Lokhttp3/Cookie;",
            ">;"
        }
    .end annotation

    .line 432
    const-string v0, "Set-Cookie"

    invoke-virtual {p1, v0}, Lokhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 433
    .local v0, "cookieStrings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 435
    .local v1, "cookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "size":I
    :goto_0
    if-ge v2, v3, :cond_2

    .line 436
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {p0, v4}, Lokhttp3/Cookie;->parse(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/Cookie;

    move-result-object v4

    .line 437
    .local v4, "cookie":Lokhttp3/Cookie;
    if-nez v4, :cond_0

    goto :goto_1

    .line 438
    :cond_0
    if-nez v1, :cond_1

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v5

    .line 439
    :cond_1
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 435
    .end local v4    # "cookie":Lokhttp3/Cookie;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 442
    .end local v2    # "i":I
    .end local v3    # "size":I
    :cond_2
    if-eqz v1, :cond_3

    .line 443
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto :goto_2

    .line 444
    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 442
    :goto_2
    return-object v2
.end method

.method private static parseDomain(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .line 417
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 420
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 421
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 423
    :cond_0
    invoke-static {p0}, Lokhttp3/internal/Util;->domainToAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 424
    .local v0, "canonicalDomain":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 427
    return-object v0

    .line 425
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 418
    .end local v0    # "canonicalDomain":Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private static parseExpires(Ljava/lang/String;II)J
    .locals 13
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I

    .line 320
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lokhttp3/Cookie;->dateCharacterOffset(Ljava/lang/String;IIZ)I

    move-result p1

    .line 322
    const/4 v1, -0x1

    .line 323
    .local v1, "hour":I
    const/4 v2, -0x1

    .line 324
    .local v2, "minute":I
    const/4 v3, -0x1

    .line 325
    .local v3, "second":I
    const/4 v4, -0x1

    .line 326
    .local v4, "dayOfMonth":I
    const/4 v5, -0x1

    .line 327
    .local v5, "month":I
    const/4 v6, -0x1

    .line 328
    .local v6, "year":I
    sget-object v7, Lokhttp3/Cookie;->TIME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v7, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 330
    .local v7, "matcher":Ljava/util/regex/Matcher;
    :goto_0
    const/4 v8, 0x2

    const/4 v9, -0x1

    const/4 v10, 0x1

    if-ge p1, p2, :cond_4

    .line 331
    add-int/lit8 v11, p1, 0x1

    invoke-static {p0, v11, p2, v10}, Lokhttp3/Cookie;->dateCharacterOffset(Ljava/lang/String;IIZ)I

    move-result v11

    .line 332
    .local v11, "end":I
    invoke-virtual {v7, p1, v11}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    .line 334
    if-ne v1, v9, :cond_0

    sget-object v12, Lokhttp3/Cookie;->TIME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v12}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/regex/Matcher;->matches()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 335
    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 336
    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 337
    const/4 v8, 0x3

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_1

    .line 338
    :cond_0
    if-ne v4, v9, :cond_1

    sget-object v8, Lokhttp3/Cookie;->DAY_OF_MONTH_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 339
    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    goto :goto_1

    .line 340
    :cond_1
    if-ne v5, v9, :cond_2

    sget-object v8, Lokhttp3/Cookie;->MONTH_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 341
    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    .line 342
    .local v8, "monthString":Ljava/lang/String;
    sget-object v9, Lokhttp3/Cookie;->MONTH_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v9}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    div-int/lit8 v9, v9, 0x4

    .line 343
    .end local v5    # "month":I
    .end local v8    # "monthString":Ljava/lang/String;
    .local v9, "month":I
    move v5, v9

    goto :goto_1

    .end local v9    # "month":I
    .restart local v5    # "month":I
    :cond_2
    if-ne v6, v9, :cond_3

    sget-object v8, Lokhttp3/Cookie;->YEAR_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 344
    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 347
    :cond_3
    :goto_1
    add-int/lit8 v8, v11, 0x1

    invoke-static {p0, v8, p2, v0}, Lokhttp3/Cookie;->dateCharacterOffset(Ljava/lang/String;IIZ)I

    move-result p1

    .line 348
    .end local v11    # "end":I
    goto/16 :goto_0

    .line 351
    :cond_4
    const/16 v11, 0x46

    if-lt v6, v11, :cond_5

    const/16 v11, 0x63

    if-gt v6, v11, :cond_5

    add-int/lit16 v6, v6, 0x76c

    .line 352
    :cond_5
    if-ltz v6, :cond_6

    const/16 v11, 0x45

    if-gt v6, v11, :cond_6

    add-int/lit16 v6, v6, 0x7d0

    .line 356
    :cond_6
    const/16 v11, 0x641

    if-lt v6, v11, :cond_c

    .line 357
    if-eq v5, v9, :cond_b

    .line 358
    if-lt v4, v10, :cond_a

    const/16 v9, 0x1f

    if-gt v4, v9, :cond_a

    .line 359
    if-ltz v1, :cond_9

    const/16 v9, 0x17

    if-gt v1, v9, :cond_9

    .line 360
    if-ltz v2, :cond_8

    const/16 v9, 0x3b

    if-gt v2, v9, :cond_8

    .line 361
    if-ltz v3, :cond_7

    if-gt v3, v9, :cond_7

    .line 363
    new-instance v9, Ljava/util/GregorianCalendar;

    sget-object v11, Lokhttp3/internal/Util;->UTC:Ljava/util/TimeZone;

    invoke-direct {v9, v11}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 364
    .local v9, "calendar":Ljava/util/Calendar;
    invoke-virtual {v9, v0}, Ljava/util/Calendar;->setLenient(Z)V

    .line 365
    invoke-virtual {v9, v10, v6}, Ljava/util/Calendar;->set(II)V

    .line 366
    add-int/lit8 v10, v5, -0x1

    invoke-virtual {v9, v8, v10}, Ljava/util/Calendar;->set(II)V

    .line 367
    const/4 v8, 0x5

    invoke-virtual {v9, v8, v4}, Ljava/util/Calendar;->set(II)V

    .line 368
    const/16 v8, 0xb

    invoke-virtual {v9, v8, v1}, Ljava/util/Calendar;->set(II)V

    .line 369
    const/16 v8, 0xc

    invoke-virtual {v9, v8, v2}, Ljava/util/Calendar;->set(II)V

    .line 370
    const/16 v8, 0xd

    invoke-virtual {v9, v8, v3}, Ljava/util/Calendar;->set(II)V

    .line 371
    const/16 v8, 0xe

    invoke-virtual {v9, v8, v0}, Ljava/util/Calendar;->set(II)V

    .line 372
    invoke-virtual {v9}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v10

    return-wide v10

    .line 361
    .end local v9    # "calendar":Ljava/util/Calendar;
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 360
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 359
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 358
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 357
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 356
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method private static parseMaxAge(Ljava/lang/String;)J
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .line 401
    const-wide/high16 v0, -0x8000000000000000L

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 402
    .local v2, "parsed":J
    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-gtz v6, :cond_0

    goto :goto_0

    :cond_0
    move-wide v0, v2

    :goto_0
    return-wide v0

    .line 403
    .end local v2    # "parsed":J
    :catch_0
    move-exception v2

    .line 405
    .local v2, "e":Ljava/lang/NumberFormatException;
    const-string v3, "-?\\d+"

    invoke-virtual {p0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 406
    const-string v3, "-"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    const-wide v0, 0x7fffffffffffffffL

    :goto_1
    return-wide v0

    .line 408
    :cond_2
    throw v2
.end method

.method private static pathMatch(Lokhttp3/HttpUrl;Ljava/lang/String;)Z
    .locals 4
    .param p0, "url"    # Lokhttp3/HttpUrl;
    .param p1, "path"    # Ljava/lang/String;

    .line 199
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "urlPath":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 202
    return v2

    .line 205
    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 206
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    return v2

    .line 207
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x2f

    if-ne v1, v3, :cond_2

    return v2

    .line 210
    :cond_2
    const/4 v1, 0x0

    return v1
.end method


# virtual methods
.method public domain()Ljava/lang/String;
    .locals 1

    .line 140
    iget-object v0, p0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "other"    # Ljava/lang/Object;

    .line 577
    instance-of v0, p1, Lokhttp3/Cookie;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 578
    :cond_0
    move-object v0, p1

    check-cast v0, Lokhttp3/Cookie;

    .line 579
    .local v0, "that":Lokhttp3/Cookie;
    iget-object v2, v0, Lokhttp3/Cookie;->name:Ljava/lang/String;

    iget-object v3, p0, Lokhttp3/Cookie;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v0, Lokhttp3/Cookie;->value:Ljava/lang/String;

    iget-object v3, p0, Lokhttp3/Cookie;->value:Ljava/lang/String;

    .line 580
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    iget-object v3, p0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    .line 581
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v0, Lokhttp3/Cookie;->path:Ljava/lang/String;

    iget-object v3, p0, Lokhttp3/Cookie;->path:Ljava/lang/String;

    .line 582
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-wide v2, v0, Lokhttp3/Cookie;->expiresAt:J

    iget-wide v4, p0, Lokhttp3/Cookie;->expiresAt:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_1

    iget-boolean v2, v0, Lokhttp3/Cookie;->secure:Z

    iget-boolean v3, p0, Lokhttp3/Cookie;->secure:Z

    if-ne v2, v3, :cond_1

    iget-boolean v2, v0, Lokhttp3/Cookie;->httpOnly:Z

    iget-boolean v3, p0, Lokhttp3/Cookie;->httpOnly:Z

    if-ne v2, v3, :cond_1

    iget-boolean v2, v0, Lokhttp3/Cookie;->persistent:Z

    iget-boolean v3, p0, Lokhttp3/Cookie;->persistent:Z

    if-ne v2, v3, :cond_1

    iget-boolean v2, v0, Lokhttp3/Cookie;->hostOnly:Z

    iget-boolean v3, p0, Lokhttp3/Cookie;->hostOnly:Z

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 579
    :goto_0
    return v1
.end method

.method public expiresAt()J
    .locals 2

    .line 118
    iget-wide v0, p0, Lokhttp3/Cookie;->expiresAt:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 6

    .line 591
    const/16 v0, 0x11

    .line 592
    .local v0, "hash":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lokhttp3/Cookie;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 593
    .end local v0    # "hash":I
    .local v1, "hash":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lokhttp3/Cookie;->value:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 594
    .end local v1    # "hash":I
    .restart local v0    # "hash":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 595
    .end local v0    # "hash":I
    .restart local v1    # "hash":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lokhttp3/Cookie;->path:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 596
    .end local v1    # "hash":I
    .restart local v0    # "hash":I
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lokhttp3/Cookie;->expiresAt:J

    const/16 v4, 0x20

    ushr-long v4, v2, v4

    xor-long/2addr v2, v4

    long-to-int v3, v2

    add-int/2addr v1, v3

    .line 597
    .end local v0    # "hash":I
    .restart local v1    # "hash":I
    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Lokhttp3/Cookie;->secure:Z

    xor-int/lit8 v2, v2, 0x1

    add-int/2addr v0, v2

    .line 598
    .end local v1    # "hash":I
    .restart local v0    # "hash":I
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lokhttp3/Cookie;->httpOnly:Z

    xor-int/lit8 v2, v2, 0x1

    add-int/2addr v1, v2

    .line 599
    .end local v0    # "hash":I
    .restart local v1    # "hash":I
    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Lokhttp3/Cookie;->persistent:Z

    xor-int/lit8 v2, v2, 0x1

    add-int/2addr v0, v2

    .line 600
    .end local v1    # "hash":I
    .restart local v0    # "hash":I
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lokhttp3/Cookie;->hostOnly:Z

    xor-int/lit8 v2, v2, 0x1

    add-int/2addr v1, v2

    .line 601
    .end local v0    # "hash":I
    .restart local v1    # "hash":I
    return v1
.end method

.method public hostOnly()Z
    .locals 1

    .line 132
    iget-boolean v0, p0, Lokhttp3/Cookie;->hostOnly:Z

    return v0
.end method

.method public httpOnly()Z
    .locals 1

    .line 157
    iget-boolean v0, p0, Lokhttp3/Cookie;->httpOnly:Z

    return v0
.end method

.method public matches(Lokhttp3/HttpUrl;)Z
    .locals 3
    .param p1, "url"    # Lokhttp3/HttpUrl;

    .line 170
    iget-boolean v0, p0, Lokhttp3/Cookie;->hostOnly:Z

    if-eqz v0, :cond_0

    .line 171
    invoke-virtual {p1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    .line 172
    invoke-static {p1, v0}, Lokhttp3/Cookie;->domainMatch(Lokhttp3/HttpUrl;Ljava/lang/String;)Z

    move-result v0

    :goto_0
    nop

    .line 173
    .local v0, "domainMatch":Z
    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 175
    :cond_1
    iget-object v2, p0, Lokhttp3/Cookie;->path:Ljava/lang/String;

    invoke-static {p1, v2}, Lokhttp3/Cookie;->pathMatch(Lokhttp3/HttpUrl;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    return v1

    .line 177
    :cond_2
    iget-boolean v2, p0, Lokhttp3/Cookie;->secure:Z

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->isHttps()Z

    move-result v2

    if-nez v2, :cond_3

    return v1

    .line 179
    :cond_3
    const/4 v1, 0x1

    return v1
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .line 95
    iget-object v0, p0, Lokhttp3/Cookie;->name:Ljava/lang/String;

    return-object v0
.end method

.method public path()Ljava/lang/String;
    .locals 1

    .line 149
    iget-object v0, p0, Lokhttp3/Cookie;->path:Ljava/lang/String;

    return-object v0
.end method

.method public persistent()Z
    .locals 1

    .line 105
    iget-boolean v0, p0, Lokhttp3/Cookie;->persistent:Z

    return v0
.end method

.method public secure()Z
    .locals 1

    .line 162
    iget-boolean v0, p0, Lokhttp3/Cookie;->secure:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 533
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lokhttp3/Cookie;->toString(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toString(Z)Ljava/lang/String;
    .locals 6
    .param p1, "forObsoleteRfc2965"    # Z

    .line 542
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 543
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lokhttp3/Cookie;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 544
    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 545
    iget-object v1, p0, Lokhttp3/Cookie;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    iget-boolean v1, p0, Lokhttp3/Cookie;->persistent:Z

    if-eqz v1, :cond_1

    .line 548
    iget-wide v1, p0, Lokhttp3/Cookie;->expiresAt:J

    const-wide/high16 v3, -0x8000000000000000L

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    .line 549
    const-string v1, "; max-age=0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 551
    :cond_0
    const-string v1, "; expires="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/util/Date;

    iget-wide v2, p0, Lokhttp3/Cookie;->expiresAt:J

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-static {v1}, Lokhttp3/internal/http/HttpDate;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    :cond_1
    :goto_0
    iget-boolean v1, p0, Lokhttp3/Cookie;->hostOnly:Z

    if-nez v1, :cond_3

    .line 556
    const-string v1, "; domain="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    if-eqz p1, :cond_2

    .line 558
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 560
    :cond_2
    iget-object v1, p0, Lokhttp3/Cookie;->domain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    :cond_3
    const-string v1, "; path="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lokhttp3/Cookie;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    iget-boolean v1, p0, Lokhttp3/Cookie;->secure:Z

    if-eqz v1, :cond_4

    .line 566
    const-string v1, "; secure"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    :cond_4
    iget-boolean v1, p0, Lokhttp3/Cookie;->httpOnly:Z

    if-eqz v1, :cond_5

    .line 570
    const-string v1, "; httponly"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public value()Ljava/lang/String;
    .locals 1

    .line 100
    iget-object v0, p0, Lokhttp3/Cookie;->value:Ljava/lang/String;

    return-object v0
.end method
