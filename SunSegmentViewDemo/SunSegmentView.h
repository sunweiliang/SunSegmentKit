//
//  SunSegmentView.h
//  SupperModle
//
//  Created by Sun SQ on 14-4-25.
//  Copyright (c) 2014年 yusen. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SunSegmentViewDelegate <NSObject>

@required
- (void)SunSegmentClick:(NSInteger)index;
@optional



@end



@interface SunSegmentView : UIView{
    
    
}


- (id)initWithFrame:(CGRect)frame withViewCount:(NSInteger)viewCount withNormalColor:(UIColor *)normal_color withSelectColor:(UIColor *)select_color withNormalTitleColor:(UIColor *)normal_titlecolor  withSelectTitleColor:(UIColor *)select_titlecolor;

@property(nonatomic,assign) NSInteger selectIndex;
@property(nonatomic,strong) NSArray *titleArray;


@property(nonatomic,strong) UIFont *titleFont;



@property (weak) NSObject <SunSegmentViewDelegate> *segmentDelegate;

@end




