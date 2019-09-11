.class public Lio/socket/parser/Parser$Decoder;
.super Lio/socket/emitter/Emitter;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Decoder"
.end annotation


# static fields
.field public static EVENT_DECODED:Ljava/lang/String;


# instance fields
.field reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 140
    const-string v0, "decoded"

    sput-object v0, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 144
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 145
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    .line 146
    return-void
.end method

.method private static decodeString(Ljava/lang/String;)Lio/socket/parser/Packet;
    .locals 9
    .param p0, "str"    # Ljava/lang/String;

    .line 174
    new-instance v0, Lio/socket/parser/Packet;

    invoke-direct {v0}, Lio/socket/parser/Packet;-><init>()V

    .line 175
    .local v0, "p":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 176
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 178
    .local v2, "length":I
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v4

    iput v4, v0, Lio/socket/parser/Packet;->type:I

    .line 179
    iget v4, v0, Lio/socket/parser/Packet;->type:I

    if-ltz v4, :cond_d

    iget v4, v0, Lio/socket/parser/Packet;->type:I

    sget-object v5, Lio/socket/parser/Parser;->types:[Ljava/lang/String;

    array-length v5, v5

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    if-le v4, v5, :cond_0

    goto/16 :goto_9

    .line 181
    :cond_0
    const/4 v4, 0x5

    iget v5, v0, Lio/socket/parser/Packet;->type:I

    if-eq v4, v5, :cond_1

    const/4 v4, 0x6

    iget v5, v0, Lio/socket/parser/Packet;->type:I

    if-ne v4, v5, :cond_4

    .line 182
    :cond_1
    const-string v4, "-"

    invoke-virtual {p0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_c

    add-int/lit8 v4, v1, 0x1

    if-gt v2, v4, :cond_2

    goto/16 :goto_8

    .line 183
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .local v4, "attachments":Ljava/lang/StringBuilder;
    :goto_0
    add-int/2addr v1, v6

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x2d

    if-eq v5, v7, :cond_3

    .line 185
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 187
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Lio/socket/parser/Packet;->attachments:I

    .line 190
    .end local v4    # "attachments":Ljava/lang/StringBuilder;
    :cond_4
    add-int/lit8 v4, v1, 0x1

    if-le v2, v4, :cond_7

    const/16 v4, 0x2f

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v4, v5, :cond_7

    .line 191
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .local v4, "nsp":Ljava/lang/StringBuilder;
    :goto_1
    add-int/2addr v1, v6

    .line 194
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 195
    .local v5, "c":C
    const/16 v7, 0x2c

    if-ne v7, v5, :cond_5

    goto :goto_2

    .line 196
    :cond_5
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 197
    add-int/lit8 v7, v1, 0x1

    if-ne v7, v2, :cond_6

    .line 199
    .end local v5    # "c":C
    :goto_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 200
    .end local v4    # "nsp":Ljava/lang/StringBuilder;
    goto :goto_3

    .line 198
    .restart local v4    # "nsp":Ljava/lang/StringBuilder;
    :cond_6
    goto :goto_1

    .line 201
    .end local v4    # "nsp":Ljava/lang/StringBuilder;
    :cond_7
    const-string v4, "/"

    iput-object v4, v0, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 204
    :goto_3
    add-int/lit8 v4, v1, 0x1

    if-le v2, v4, :cond_a

    .line 205
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    .line 206
    .local v4, "next":Ljava/lang/Character;
    invoke-virtual {v4}, Ljava/lang/Character;->charValue()C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v5

    const/4 v7, -0x1

    if-le v5, v7, :cond_a

    .line 207
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .local v5, "id":Ljava/lang/StringBuilder;
    :goto_4
    add-int/2addr v1, v6

    .line 210
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 211
    .local v7, "c":C
    invoke-static {v7}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v8

    if-gez v8, :cond_8

    .line 212
    add-int/lit8 v1, v1, -0x1

    .line 213
    goto :goto_5

    .line 215
    :cond_8
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 216
    add-int/lit8 v8, v1, 0x1

    if-ne v8, v2, :cond_9

    .line 219
    .end local v7    # "c":C
    :goto_5
    :try_start_0
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v0, Lio/socket/parser/Packet;->id:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    goto :goto_6

    .line 220
    :catch_0
    move-exception v3

    .line 221
    .local v3, "e":Ljava/lang/NumberFormatException;
    invoke-static {}, Lio/socket/parser/Parser;->access$100()Lio/socket/parser/Packet;

    move-result-object v6

    return-object v6

    .line 217
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    :cond_9
    goto :goto_4

    .line 226
    .end local v4    # "next":Ljava/lang/Character;
    .end local v5    # "id":Ljava/lang/StringBuilder;
    :cond_a
    :goto_6
    add-int/lit8 v4, v1, 0x1

    if-le v2, v4, :cond_b

    .line 228
    add-int/lit8 v1, v1, 0x1

    :try_start_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 229
    new-instance v4, Lorg/json/JSONTokener;

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v0, Lio/socket/parser/Packet;->data:Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 233
    goto :goto_7

    .line 230
    :catch_1
    move-exception v3

    .line 231
    .local v3, "e":Lorg/json/JSONException;
    invoke-static {}, Lio/socket/parser/Parser;->access$000()Ljava/util/logging/Logger;

    move-result-object v4

    sget-object v5, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v6, "An error occured while retrieving data from JSONTokener"

    invoke-virtual {v4, v5, v6, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 232
    invoke-static {}, Lio/socket/parser/Parser;->access$100()Lio/socket/parser/Packet;

    move-result-object v4

    return-object v4

    .line 236
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_b
    :goto_7
    invoke-static {}, Lio/socket/parser/Parser;->access$000()Ljava/util/logging/Logger;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p0, v5, v3

    aput-object v0, v5, v6

    const-string v3, "decoded %s as %s"

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 237
    return-object v0

    .line 182
    :cond_c
    :goto_8
    invoke-static {}, Lio/socket/parser/Parser;->access$100()Lio/socket/parser/Packet;

    move-result-object v3

    return-object v3

    .line 179
    :cond_d
    :goto_9
    invoke-static {}, Lio/socket/parser/Parser;->access$100()Lio/socket/parser/Packet;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .locals 5
    .param p1, "obj"    # Ljava/lang/String;

    .line 149
    invoke-static {p1}, Lio/socket/parser/Parser$Decoder;->decodeString(Ljava/lang/String;)Lio/socket/parser/Packet;

    move-result-object v0

    .line 150
    .local v0, "packet":Lio/socket/parser/Packet;
    iget v1, v0, Lio/socket/parser/Packet;->type:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x5

    if-eq v4, v1, :cond_1

    const/4 v1, 0x6

    iget v4, v0, Lio/socket/parser/Packet;->type:I

    if-ne v1, v4, :cond_0

    goto :goto_0

    .line 157
    :cond_0
    sget-object v1, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p0, v1, v3}, Lio/socket/parser/Parser$Decoder;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_1

    .line 151
    :cond_1
    :goto_0
    new-instance v1, Lio/socket/parser/Parser$BinaryReconstructor;

    invoke-direct {v1, v0}, Lio/socket/parser/Parser$BinaryReconstructor;-><init>(Lio/socket/parser/Packet;)V

    iput-object v1, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    .line 153
    iget-object v1, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    iget-object v1, v1, Lio/socket/parser/Parser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    iget v1, v1, Lio/socket/parser/Packet;->attachments:I

    if-nez v1, :cond_2

    .line 154
    sget-object v1, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p0, v1, v3}, Lio/socket/parser/Parser$Decoder;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 159
    :cond_2
    :goto_1
    return-void
.end method

.method public add([B)V
    .locals 4
    .param p1, "obj"    # [B

    .line 162
    iget-object v0, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    if-eqz v0, :cond_1

    .line 165
    invoke-virtual {v0, p1}, Lio/socket/parser/Parser$BinaryReconstructor;->takeBinaryData([B)Lio/socket/parser/Packet;

    move-result-object v0

    .line 166
    .local v0, "packet":Lio/socket/parser/Packet;
    if-eqz v0, :cond_0

    .line 167
    const/4 v1, 0x0

    iput-object v1, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    .line 168
    sget-object v1, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {p0, v1, v2}, Lio/socket/parser/Parser$Decoder;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 171
    .end local v0    # "packet":Lio/socket/parser/Packet;
    :cond_0
    return-void

    .line 163
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "got binary data when not reconstructing a packet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public destroy()V
    .locals 1

    .line 241
    iget-object v0, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    if-eqz v0, :cond_0

    .line 242
    invoke-virtual {v0}, Lio/socket/parser/Parser$BinaryReconstructor;->finishReconstruction()V

    .line 244
    :cond_0
    return-void
.end method
