//
//  FaceTableViewCell.h
//  SDWebImageAndFaceAware
//
//  Created by ml_better on 2018/10/15.
//  Copyright © 2018年 ml_better. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, assign) NSInteger row;

- (void)setInfo:(NSString *)urlString;

- (void)setLocalImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
