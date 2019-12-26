//
//  ViewController.m
//  ShadowView
//
//  Created by apple on 2019/12/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CYBTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 150, 180, 60)];
        view.backgroundColor = [UIColor blueColor];
        view.shadowEnabel = YES;
        
        view.layer.cornerRadius = 15;
        view.clipsToBounds = YES;
        view.layer.borderColor = [[UIColor redColor] CGColor];
        view.layer.borderWidth = 1;
        
        [self.view addSubview:view];
    }
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 230, 180, 60)];
        view.backgroundColor = [UIColor redColor];
        view.shadowEnabel = YES;
        view.shadowColor = [UIColor blackColor];
        
        view.layer.cornerRadius = 15;
        view.clipsToBounds = YES;
        view.layer.borderColor = [[UIColor redColor] CGColor];
        view.layer.borderWidth = 1;
        
        [self.view addSubview:view];
    }
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 310, 180, 60)];
        view.backgroundColor = [UIColor greenColor];
        view.shadowEnabel = YES;
        view.shadowColor = [UIColor blackColor];
        view.shadowRadius = 5;
        
        view.layer.cornerRadius = 15;
        view.clipsToBounds = YES;
        view.layer.borderColor = [[UIColor redColor] CGColor];
        view.layer.borderWidth = 1;
        
        [self.view addSubview:view];
    }
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 390, 180, 60)];
        view.backgroundColor = [UIColor yellowColor];
        view.shadowEnabel = YES;
        view.shadowColor = [UIColor blackColor];
        
        view.layer.cornerRadius = 15;
        view.clipsToBounds = YES;
        view.layer.borderColor = [[UIColor redColor] CGColor];
        view.layer.borderWidth = 1;
        
        [self.view addSubview:view];
    }
    
    
    
}


@end
