.method protected updateSizeForScreenSizeChange()V
    .registers 6

    .line 221
    iget-boolean v0, p0, Lcom/android/keyguard/charge/container/MiuiChargeAnimationView;->mIsPadChargeVideo:Z

    if-eqz v0, :cond_9

    const/16 v0, 0xc1

    .line 222
    iput v0, p0, Lcom/android/keyguard/charge/container/MiuiChargeAnimationView;->mIconPaddingTop:I

    return-void

    .line 225
    :cond_9
    iget-object v0, p0, Lcom/android/keyguard/charge/container/MiuiChargeAnimationView;->mScreenSize:Landroid/graphics/Point;

    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000  # 1.0f

    mul-float v2, v0, v1

    const/high16 v3, 0x44870000  # 1080.0f

    div-float/2addr v2, v3

    .line 227
    iget-boolean v4, p0, Lcom/android/keyguard/charge/container/MiuiChargeAnimationView;->mIsFoldChargeVideo:Z

    if-eqz v4, :cond_26

    cmpl-float v4, v2, v1

    if-lez v4, :cond_24

    goto :goto_25

    :cond_24
    move v1, v2

    :goto_25
    move v2, v1

    .line 230
    :cond_26
    invoke-static {}, Lcom/android/keyguard/utils/MiuiKeyguardUtils;->isLiteChargeAnimationPad()Z

    move-result v1

    if-eqz v1, :cond_32

    const v1, 0x3f19999a  # 0.6f

    mul-float/2addr v0, v1

    div-float v2, v0, v3

    :cond_32
    const v0, 0x43898000  # 275.0f

    mul-float/2addr v2, v0

    float-to-int v0, v2

    .line 233
    iput v0, p0, Lcom/android/keyguard/charge/container/MiuiChargeAnimationView;->mIconPaddingTop:I

    return-void
.end method
