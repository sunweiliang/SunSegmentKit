//
//  mainViewController.m
//  SunSegmentViewDemo
//
//  Created by Sun SQ on 14-4-25.
//  Copyright (c) 2014年 yusen. All rights reserved.
//

#import "mainViewController.h"




@interface mainViewController ()

@end

@implementation mainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    SunSegmentView *segmentView=[[SunSegmentView alloc] initWithFrame:CGRectMake(0, 100, 320, 100) withViewCount:4 withNormalColor:[UIColor blueColor] withSelectColor:[UIColor redColor] withNormalTitleColor:[UIColor blackColor] withSelectTitleColor:[UIColor whiteColor]];
    segmentView.titleArray=@[@"btn1",@"btn2",@"btn3",@"btn4"];
    segmentView.selectIndex=1;
    segmentView.backgroundColor=[UIColor purpleColor];
    segmentView.titleFont=[UIFont boldSystemFontOfSize:30.0];
    segmentView.segmentDelegate=self;
    [self.view addSubview:segmentView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---
-(void)SunSegmentClick:(NSInteger)index{
    
    NSLog(@"%d",index);
}

@end
