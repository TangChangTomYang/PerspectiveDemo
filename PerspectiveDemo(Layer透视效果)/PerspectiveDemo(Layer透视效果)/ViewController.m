//
//  ViewController.m
//  PerspectiveDemo(Layer透视效果)
//
//  Created by yangrui on 2018/10/13.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
#define animateShowTime 2
@interface ViewController (){
    
    UIButton * yellowButton;
    UIView *blueView;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    blueView = [[UIView alloc]initWithFrame:CGRectMake(30, 30, screenWidth-60, screenHeight-60)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.layer.borderColor = [UIColor orangeColor].CGColor;
    blueView.layer.borderWidth = 2.0;
    [self.view addSubview:blueView];
    
    yellowButton = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 250, 100, 60)];
    yellowButton.backgroundColor = [UIColor yellowColor];
    [yellowButton addTarget:self action:@selector(showAnimate) forControlEvents:UIControlEventTouchUpInside];
    
    [blueView addSubview:yellowButton];
    
}



- (void)showAnimate{
    [self showViewAnimate1];
    //    [self showViewAnimate2];
}

//显示动画
- (void)showViewAnimate1{
    
    [UIView animateWithDuration: animateShowTime animations:^{
        //第一步
        blueView.layer.transform = [self PerspectiveTransform];
        
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration: 2 * animateShowTime animations:^{
            blueView.layer.transform = [self PerspectiveTransform2];
            
            
        }completion:^(BOOL finished) {
            [self showViewAnimate1];
        }];
        
    }];
}

//显示动画
- (void)showViewAnimate2{
    
    [UIView animateWithDuration: animateShowTime animations:^{
        //第一步
        blueView.layer.transform = [self PerspectiveTransform];
        
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration: 2 * animateShowTime animations:^{
            //            blueView.layer.transform = [self PerspectiveTransform2];
            
            
        }];
        
    }];
}




/**
 透视效果 通过 CATransform3D 的.m34 来实现,
 但是透视效果要被看见需要设置CATransform3DRotate 才会明显
 */
-(CATransform3D)PerspectiveTransform{
    
    //让transform1为单位矩阵
    CATransform3D transform = CATransform3DIdentity;
    //z轴纵深的3D效果和CATransform3DRotate配合使用才能看出效果
    transform.m34 = 1.0/-1900;
    //x和y都缩小为原来的0.9,z不变
    //    transform = CATransform3DScale(transform, 0.9, 0.9, 1);
    //绕x轴向内旋转30度
    transform = CATransform3DRotate(transform,45.0f * M_PI/180.0f, 1, 0, 0);
    return transform;
    
}

/**
 透视效果 通过 CATransform3D 的.m34 来实现,
 但是透视效果要被看见需要设置CATransform3DRotate 才会明显
 */
-(CATransform3D)PerspectiveTransform2{
    
    //让transform1为单位矩阵
    CATransform3D transform = CATransform3DIdentity;
    //z轴纵深的3D效果和CATransform3DRotate配合使用才能看出效果
    transform.m34 = 1.0/-1900;
    //x和y都缩小为原来的0.9,z不变
    //    transform = CATransform3DScale(transform, 0.9, 0.9, 1);
    //绕x轴向内旋转30度
    transform = CATransform3DRotate(transform,-45.0f * M_PI/180.0f, 1, 0, 0);
    return transform;
    
}


@end
