//
//  ViewController.m
//  SDWebImageAndFaceAware
//
//  Created by ml_better on 2018/10/15.
//  Copyright © 2018年 ml_better. All rights reserved.
//

#import "ViewController.h"
#import "SDWebImageAndFaceAware-Swift.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "FaceTableViewCell.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) BOOL isUsedSDWebImage;
@property (nonatomic, weak) UIButton *useButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.separatorColor = [UIColor grayColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    
    /*
     * I just want to have a test, do not affect other.
     */
//    _tableView.scrollEnabled = NO;

    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:_tableView];
    
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    UIButton *clearCacheButton = [[UIButton alloc] initWithFrame:CGRectMake(width -120, height - 120, 80, 80)];
    [clearCacheButton addTarget:self action:@selector(clearMemory) forControlEvents:UIControlEventTouchUpInside];
    [clearCacheButton setTitle:@"Cls Cache" forState:UIControlStateNormal];
    clearCacheButton.titleLabel.font = [UIFont systemFontOfSize:12];
    clearCacheButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:clearCacheButton];
    
    UIButton *useButton = [[UIButton alloc] initWithFrame:CGRectMake(width -160, height - 220, 140, 80)];
    [useButton addTarget:self action:@selector(useButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    useButton.titleLabel.font = [UIFont systemFontOfSize:12];
    useButton.backgroundColor = [UIColor redColor];
    _useButton = useButton;
    [self.view addSubview:useButton];
    
    [self useLocalImage];
}

- (void)clearMemory {
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    [_tableView reloadData];
}

- (void)useButtonAction:(id)sender {
    if ( _isUsedSDWebImage ) {
        [self useLocalImage];
    } else {
        [self useWebImage];
    }
}

- (void)useLocalImage {
    [self.dataArray removeAllObjects];
    _isUsedSDWebImage = NO;
    for (NSInteger i = 0; i < 12; i++) {
        NSString *imageName = [NSString stringWithFormat:@"photo%@.jpg", @(i+1)];
        [self.dataArray addObject:[UIImage imageNamed:imageName]];
    }
    [_tableView reloadData];
    
    [_useButton setTitle:@"UseLocalImage" forState:UIControlStateNormal];
}

- (void)useWebImage {
    [self.dataArray removeAllObjects];
    _isUsedSDWebImage = YES;
    self.dataArray = @[
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156947&di=a30aab36bed5a48374c1bafed483ef46&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fd01373f082025aaf1b1a6c3ff1edab64034f1a1d.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156947&di=47d9fc82e851f0b49acad68dad8d5578&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F6c224f4a20a44623db9dcfab9222720e0df3d7a0.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156947&di=419b36dd3cc82c93a2786284aa023f58&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0dd7912397dda14499da748fb9b7d0a20cf4863f.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156946&di=77992742cc8fab6f76a5998466897ba5&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F810a19d8bc3eb1355567bf81ad1ea8d3fd1f4463.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156946&di=b1897308f8f29f5e383c76ae4f532e16&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F35a85edf8db1cb1312fd33e5d754564e93584bab.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156945&di=7fe8dfab41b5595be1d2758d103aee45&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Da8df288504f41bd5ce5ee0b739b3ebbe%2Fac6eddc451da81cbec1a4c635866d016082431a4.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156945&di=f8dd1d1163230a08ad9feb34f48d9bee&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F314e251f95cad1c82416e5d2753e6709c83d5191.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156944&di=6deba1df96798db3ed17f10ff6fa83dc&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fd1a20cf431adcbefa17dda3da7af2edda3cc9f44.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156980&di=2c6431e7e0547d6b10d83e7b614aaf56&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dpixel_huitu%252C0%252C0%252C294%252C40%2Fsign%3D5027833107d79123f4ed9c34c44c3cee%2Fe4dde71190ef76c63d4828129616fdfaaf516775.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156979&di=39b8e3ba26ab045b2093a758e5a79567&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F4e4a20a4462309f7f67554e1780e0cf3d7cad62f.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156979&di=4b85684c535bef0e62f4957c92b6765a&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Da2dfb418b0a1cd1111bb7a63d17ba289%2F738b4710b912c8fc99cda6e5f6039245d68821df.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539607156979&di=f57055257a07b0a2f9591fb9358e706c&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F37d12f2eb9389b5077c897a68f35e5dde7116e0a.jpg"
                       
                       ].mutableCopy;
    
    [_tableView reloadData];
    
    [_useButton setTitle:@"UseWebImage" forState:UIControlStateNormal];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    FaceTableViewCell *cell = (FaceTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if( !cell ) {
        cell = [[FaceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.row = row;
    cell.nameLabel.text = [NSString stringWithFormat:@"row %@", @(row)];
    
    if ( _isUsedSDWebImage ) {
        [cell setInfo:_dataArray[row]];
    } else {
        [cell setLocalImage:_dataArray[row]];
    }
    return cell;
}

- (NSMutableArray *)dataArray {
    if ( !_dataArray ) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
