//
//  ReleaseViewController.m
//  PhotpShow
//
//  Created by FLYang on 16/2/26.
//  Copyright © 2016年 Fynn. All rights reserved.
//

#import "ReleaseViewController.h"

@interface ReleaseViewController ()

@end

@implementation ReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setNavViewUI];
    
    [self.view addSubview:self.doneImageView];
    
    [self.view addSubview:self.saveBtn];
}

- (void)setNavViewUI {
    self.navView.backgroundColor = [UIColor blackColor];
    [self addNavViewTitle:@"编辑完成"];
    self.navTitle.textColor = [UIColor whiteColor];
    [self addBackButton];
}

#pragma mark - 编辑完成的图片
- (UIImageView *)doneImageView {
    if (!_doneImageView) {
        _doneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH/4, SCREEN_WIDTH, SCREEN_WIDTH)];
    }
    return _doneImageView;
}

#pragma mark - 保存图片按钮
- (UIButton *)saveBtn {
    if (!_saveBtn) {
        _saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 100, SCREEN_HEIGHT * 0.8, 200, 50)];
        [_saveBtn setTitle:@"保存到相册" forState:(UIControlStateNormal)];
        _saveBtn.backgroundColor = [UIColor redColor];
        _saveBtn.layer.cornerRadius = 10;
        _saveBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_saveBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_saveBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveBtn;
}
/**
 * 弹出保存成功, 并且进行保存
 */
- (void)buttonAction
{
    
    [self alertActionWithTitle:@"保存成功" action:^() {
        
        UIImageWriteToSavedPhotosAlbum(_doneImageView.image, nil, nil, nil);
        
    }];
    
}




// 提示框
- (void)alertActionWithTitle:(NSString *)title action:(void(^)())action
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    
    /**
     * 弹出提示框并保存图片
     */
    [self presentViewController:alertC animated:YES completion:^{
        
        if (action) {
            action();
        }
        
    }];
    
    /**
     * 添加延迟线程让视图消失
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alertC dismissViewControllerAnimated:YES completion:nil];
        
    });
}

@end
