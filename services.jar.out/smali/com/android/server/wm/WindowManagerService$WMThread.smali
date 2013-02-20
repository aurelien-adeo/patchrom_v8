.class Lcom/android/server/wm/WindowManagerService$WMThread;
.super Ljava/lang/Thread;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wm/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WMThread"
.end annotation


# instance fields
.field private final mAllowBootMessages:Z

.field private final mContext:Landroid/content/Context;

.field private final mHaveInputMethods:Z

.field private final mPM:Lcom/android/server/PowerManagerService;

.field mService:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZ)V
    .locals 1
    .parameter "context"
    .parameter "pm"
    .parameter "haveInputMethods"
    .parameter "allowBootMsgs"

    .prologue
    .line 699
    const-string v0, "WindowManager"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 700
    iput-object p1, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mContext:Landroid/content/Context;

    .line 701
    iput-object p2, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mPM:Lcom/android/server/PowerManagerService;

    .line 702
    iput-boolean p3, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mHaveInputMethods:Z

    .line 703
    iput-boolean p4, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mAllowBootMessages:Z

    .line 704
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 707
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 708
    new-instance v0, Lcom/android/server/wm/WindowManagerService;

    iget-object v1, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mPM:Lcom/android/server/PowerManagerService;

    iget-boolean v3, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mHaveInputMethods:Z

    iget-boolean v4, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mAllowBootMessages:Z

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/wm/WindowManagerService;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZLcom/android/server/wm/WindowManagerService$1;)V

    .line 710
    .local v0, s:Lcom/android/server/wm/WindowManagerService;
    const/4 v1, -0x4

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 712
    const/4 v1, 0x0

    invoke-static {v1}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 714
    monitor-enter p0

    .line 715
    :try_start_0
    iput-object v0, p0, Lcom/android/server/wm/WindowManagerService$WMThread;->mService:Lcom/android/server/wm/WindowManagerService;

    .line 716
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 717
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 720
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 721
    const-string v1, "WindowManager"

    const-string v2, "Enabled StrictMode logging for WMThread\'s Looper"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    :cond_0
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 725
    return-void

    .line 717
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
