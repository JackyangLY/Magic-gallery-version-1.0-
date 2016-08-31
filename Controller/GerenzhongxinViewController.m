//
//  GerenzhongxinViewController.m
//  ShowSmile
//
//  Created by 洋洋 on 16/7/8.
//  Copyright © 2016年 Jack_yangyang. All rights reserved.
//个人中心控制器

#import "GerenzhongxinViewController.h"
#import "LYLoginViewController.h"
@interface GerenzhongxinViewController ()
@property (weak, nonatomic) IBOutlet UIButton *BtnInfo;
@property (weak, nonatomic) IBOutlet UIButton *BtnVer;
@property (weak, nonatomic) IBOutlet UIButton *BtnExit;

@end

@implementation GerenzhongxinViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadBasicSetting];
    self.title = @"个人中心";
}
#pragma mark 加载默认设置
-(void)loadBasicSetting;
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    

}
- (IBAction)BtnAction:(UIButton *)button
{
    NSInteger indexTag = button.tag;
    if (indexTag == 111)
    {
        NSString *strIfon = @"内容包含:笑话段子,幽默图片,搞笑视频";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"应用说明" message:strIfon preferredStyle:  UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                          {
                              //点击按钮的响应事件；
                          }]];
        
        /**弹出提示框*/
        [self presentViewController:alert animated:true completion:nil];

    }
    else if(indexTag == 112)
    {
        
        NSString *strBar = @"如您有好的建议或意见请联系:jackyang_ly@foxmail.com";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:strBar preferredStyle:  UIAlertControllerStyleAlert];
        
               [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                    {
                        //点击按钮的响应事件；
                    }]];
        
                /**弹出提示框*/
                [self presentViewController:alert animated:true completion:nil];
        

    }
    else if (indexTag == 113)
    {
        exit(0);
        
    }
    else return;
    
}

#pragma mark 在内存中销毁
-(void)dealloc
{
    //NSlog(@"%s",__func__);
}
@end
