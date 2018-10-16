//
//  FaceTableViewCell.m
//  SDWebImageAndFaceAware
//
//  Created by ml_better on 2018/10/15.
//  Copyright © 2018年 ml_better. All rights reserved.
//

#import "FaceTableViewCell.h"
#import "FaceImageView.h"

@interface FaceTableViewCell ()
@property (nonatomic, strong)FaceImageView *faceImageView;

@end
@implementation FaceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if( self ) {
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        _faceImageView = [[FaceImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
        _faceImageView.contentMode = UIViewContentModeScaleAspectFit;
        _faceImageView.clipsToBounds = YES;
        [self.contentView addSubview:_faceImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.height +20, self.frame.size.height/2 -20, self.frame.size.width - (self.frame.size.height +20), 40)];
        _nameLabel.font = [UIFont systemFontOfSize:11];
        _nameLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_nameLabel];
    }
    return self;
}

- (void)setInfo:(NSString *)urlString {
    _faceImageView.origUrl = urlString;
}

- (void)setLocalImage:(UIImage *)image {
    NSString *key = [NSString stringWithFormat:@"%@", @(self.row)];
    [_faceImageView setLocalImage:image cacheKey:key];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _faceImageView.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    _nameLabel.frame = CGRectMake(self.frame.size.height +20, self.frame.size.height/2 -20, self.frame.size.width - (self.frame.size.height +20), 40);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
