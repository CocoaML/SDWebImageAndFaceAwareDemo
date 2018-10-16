//
//  FaceImageView.h
//  SDWebImageAndFaceAware
//
//  Created by ml_better on 2018/10/15.
//  Copyright © 2018年 ml_better. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceImageView : UIImageView

@property (nonatomic, strong) NSString *origUrl;

@property (nonatomic, strong) UIImage *origImage;

- (void)setLocalImage:(UIImage *)image cacheKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
