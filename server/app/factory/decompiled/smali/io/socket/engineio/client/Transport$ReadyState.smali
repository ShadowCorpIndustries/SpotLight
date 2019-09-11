.class public final enum Lio/socket/engineio/client/Transport$ReadyState;
.super Ljava/lang/Enum;
.source "Transport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/engineio/client/Transport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401c
    name = "ReadyState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/socket/engineio/client/Transport$ReadyState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/socket/engineio/client/Transport$ReadyState;

.field public static final enum CLOSED:Lio/socket/engineio/client/Transport$ReadyState;

.field public static final enum OPEN:Lio/socket/engineio/client/Transport$ReadyState;

.field public static final enum OPENING:Lio/socket/engineio/client/Transport$ReadyState;

.field public static final enum PAUSED:Lio/socket/engineio/client/Transport$ReadyState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 18
    new-instance v0, Lio/socket/engineio/client/Transport$ReadyState;

    const/4 v1, 0x0

    const-string v2, "OPENING"

    invoke-direct {v0, v2, v1}, Lio/socket/engineio/client/Transport$ReadyState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/socket/engineio/client/Transport$ReadyState;->OPENING:Lio/socket/engineio/client/Transport$ReadyState;

    new-instance v0, Lio/socket/engineio/client/Transport$ReadyState;

    const/4 v2, 0x1

    const-string v3, "OPEN"

    invoke-direct {v0, v3, v2}, Lio/socket/engineio/client/Transport$ReadyState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    new-instance v0, Lio/socket/engineio/client/Transport$ReadyState;

    const/4 v3, 0x2

    const-string v4, "CLOSED"

    invoke-direct {v0, v4, v3}, Lio/socket/engineio/client/Transport$ReadyState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/socket/engineio/client/Transport$ReadyState;->CLOSED:Lio/socket/engineio/client/Transport$ReadyState;

    new-instance v0, Lio/socket/engineio/client/Transport$ReadyState;

    const/4 v4, 0x3

    const-string v5, "PAUSED"

    invoke-direct {v0, v5, v4}, Lio/socket/engineio/client/Transport$ReadyState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/socket/engineio/client/Transport$ReadyState;->PAUSED:Lio/socket/engineio/client/Transport$ReadyState;

    .line 17
    const/4 v0, 0x4

    new-array v0, v0, [Lio/socket/engineio/client/Transport$ReadyState;

    sget-object v5, Lio/socket/engineio/client/Transport$ReadyState;->OPENING:Lio/socket/engineio/client/Transport$ReadyState;

    aput-object v5, v0, v1

    sget-object v1, Lio/socket/engineio/client/Transport$ReadyState;->OPEN:Lio/socket/engineio/client/Transport$ReadyState;

    aput-object v1, v0, v2

    sget-object v1, Lio/socket/engineio/client/Transport$ReadyState;->CLOSED:Lio/socket/engineio/client/Transport$ReadyState;

    aput-object v1, v0, v3

    sget-object v1, Lio/socket/engineio/client/Transport$ReadyState;->PAUSED:Lio/socket/engineio/client/Transport$ReadyState;

    aput-object v1, v0, v4

    sput-object v0, Lio/socket/engineio/client/Transport$ReadyState;->$VALUES:[Lio/socket/engineio/client/Transport$ReadyState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 17
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/socket/engineio/client/Transport$ReadyState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 17
    const-class v0, Lio/socket/engineio/client/Transport$ReadyState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/socket/engineio/client/Transport$ReadyState;

    return-object v0
.end method

.method public static values()[Lio/socket/engineio/client/Transport$ReadyState;
    .locals 1

    .line 17
    sget-object v0, Lio/socket/engineio/client/Transport$ReadyState;->$VALUES:[Lio/socket/engineio/client/Transport$ReadyState;

    invoke-virtual {v0}, [Lio/socket/engineio/client/Transport$ReadyState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/socket/engineio/client/Transport$ReadyState;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 22
    invoke-super {p0}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
