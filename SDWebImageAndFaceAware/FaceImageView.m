//
//  FaceImageView.m
//  SDWebImageAndFaceAware
//
//  Created by ml_better on 2018/10/15.
//  Copyright © 2018年 ml_better. All rights reserved.
//

#import "FaceImageView.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "SDWebImageAndFaceAware-Swift.h"

@implementation FaceImageView

- (void)setOrigUrl:(NSString *)origUrl {
    _origUrl = origUrl;
    
    __weak typeof(self) weakself = self;
    [self sd_setImageWithURL:[NSURL URLWithString:_origUrl] placeholderImage:nil options:0 completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        weakself.image = image;

        [weakself handleImageFaceAware:image];
//        [weakself handleGetImage:image error:error url:[NSURL URLWithString:weakself.origUrl]];
    }];
}

- (void)setLocalImage:(UIImage *)image cacheKey:(NSString *)key {
    self.image = image;
    
    self.debugFaceAware = YES;
    self.focusOnFaces = YES;
    
    [self handleImageFaceAware:image];
//    [self handleGetImage:image error:nil url:[NSURL URLWithString:key]];
}

- (void)handleImageFaceAware:(UIImage *)origImage {
    
    [self setImageAndFocusOnFacesWithImage:origImage];
}

- (void)handleGetImage:(UIImage *)image error:(NSError *)error url:(NSURL *)url {
    
    /* TOTO: ml
     * In the future，add a FaceViewTool to Cache the ImageView has FaceAwared info, Then when scroll TableView,
     * load info from Cache. In order to scroll smoothly.
     */
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
