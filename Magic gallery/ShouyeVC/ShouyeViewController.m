//
//  ViewController.m
//  Magic gallery
//
//  Created by 洋洋 on 16/8/16.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//首页控制器

#import "ShouyeViewController.h"
#import "LeftVC/LeftVC.h"
#import "PictureToolViewController.h"
#import "GerenzhongxinViewController.h"
#define LYScreenHeight [UIScreen mainScreen].bounds.size.height
#define LYScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ShouyeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@end

@implementation ShouyeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadBasicSetting];
    
}
#pragma mark 加载默认设置
-(void)loadBasicSetting
{
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
}
-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *Userdefaults = [NSUserDefaults standardUserDefaults];
    NSInteger index = [Userdefaults integerForKey:@"backimageIndex"];
    [self changeBackView:index];
}
-(void)viewDidDisappear:(BOOL)animated
{
    
}
- (IBAction)backIamgeviewBtnAction:(id)sender
{
    NSInteger index = arc4random_uniform(11);
    [self changeBackView:index];
}
-(void)changeBackView:(NSInteger )index
{
    NSUserDefaults *Userdefaults = [NSUserDefaults standardUserDefaults];
    [Userdefaults setInteger:index forKey:@"backimageIndex"];
    [Userdefaults synchronize];
    NSString *strImage = [NSString stringWithFormat:@"back%ld",index];
    self.backImageView.image = [UIImage imageNamed:strImage];

}
- (IBAction)nextBtnAction:(id)sender
{
    GerenzhongxinViewController *gerenVC =[[GerenzhongxinViewController alloc]init];
    [self.navigationController pushViewController:gerenVC animated:YES];
}

#pragma mark 左边按钮的点击事件
- (IBAction)leftBtnAction:(UIButton *)button
{
    /**打印此方法*/
    NSLog(@"%s",__func__);
    PictureToolViewController * pictureNVC = [[PictureToolViewController alloc] init];
    [self presentViewController:pictureNVC animated:YES completion:^{
        pictureNVC.view.backgroundColor = [UIColor grayColor];
        UIButton *backbuttn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backbuttn setImage:[UIImage imageNamed:@"主页"] forState:UIControlStateNormal];
        [backbuttn setFrame:CGRectMake(LYScreenWidth-48, LYScreenHeight-48, 0, 0)];
        [backbuttn sizeToFit];
        [pictureNVC.view addSubview:backbuttn];
        [backbuttn addTarget:self action:@selector(dismissPictuerVC) forControlEvents:UIControlEventTouchUpInside];
    }];
    //  [self pushViewController:pictureNVC animated:YES];
    
}
#pragma mark 右边按钮的点击事件
- (IBAction)rightBtnAction:(UIButton *)button
{
    /**打印此方法*/
    NSLog(@"%s",__func__);
    LeftVC *leftvc =[[LeftVC alloc]init];
    [self.navigationController pushViewController:leftvc animated:YES];

}
-(void)dismissPictuerVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
