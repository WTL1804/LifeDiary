//
//  Camera.h
//  LifeDiary
//
//  Created by 王天亮 on 2020/1/18.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Camera : NSObject
//捕获设备，通常是前置摄像头，后置摄像头，麦克风（音频输入）
@property (nonatomic, strong) AVCaptureDevice *device;
//输入设备
@property (nonatomic, strong) AVCaptureInput *input;

//输出图片
@property (nonatomic, strong) AVCaptureStillImageOutputInternal *imageOutput;
//session：由他把输入输出结合在一起，并开始启动捕获设备（摄像头）
@property (nonatomic, strong) AVCaptureSession *session;
//图像预览层，实时显示捕获的图像
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

@end

NS_ASSUME_NONNULL_END
