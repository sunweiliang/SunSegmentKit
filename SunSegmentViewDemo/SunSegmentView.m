//
//  SunSegmentView.m
//  SupperModle
//
//  Created by Sun SQ on 14-4-25.
//  Copyright (c) 2014年 yusen. All rights reserved.
//

#import "SunSegmentView.h"



//@interface RTLabelButton : UIButton
//{
//@private
//	int componentIndex;
//	NSURL *url;
//}
//@property (nonatomic, assign) int componentIndex;
//@property (nonatomic, retain) NSURL *url;
//@end
//
//@implementation RTLabelButton
//
//@synthesize componentIndex;
//@synthesize url;
//
//- (void)dealloc
//{
//
//
//    [super dealloc];
//}
//
//@end




@interface SunSegmentView(){
    
    
    NSInteger ViewCount;
    
    
    
    
    UIColor *normalColor;
    UIColor *selectColor;
    
    UIImage *normalImage;
    UIImage *selectImage;
    
    UIButton *selectBtn;
    
    UIColor * normalTitleColor;
    UIColor * selectTitleColor;
    
    
    
    
}//定义私有的

//@property (nonatomic, retain) NSString *_text;
//- (void)extractTextStyle:(NSString*)text;





@end


@implementation SunSegmentView
@synthesize selectIndex;
@synthesize titleArray;
@synthesize titleFont;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)view_frame withViewCount:(NSInteger)view_count withNormalColor:(UIColor *)normal_color withSelectColor:(UIColor *)select_color withNormalTitleColor:(UIColor *)normal_titlecolor withSelectTitleColor:(UIColor *)select_titlecolor{
    
    self = [self init];
    if (self) {
        
        ViewCount=view_count;
        self.frame=view_frame;
        if (normal_color) {
            normalColor=[normal_color copy];
        }else{
            normalColor=[UIColor whiteColor];
        }
        if (select_color) {
            selectColor=[select_color copy];
        }else{
            selectColor=[UIColor blackColor];
        }
        if (normal_titlecolor) {
            normalTitleColor=[normal_titlecolor copy];
        }else{
            normalTitleColor=[UIColor blueColor];
        }
        if (select_titlecolor) {
            selectTitleColor=[select_titlecolor copy];
        }else{
            selectTitleColor=[UIColor redColor];
        }
        
        
        
        [self initBtnOnView];
        
        
        
    }
    return self;
}




-(void)initBtnOnView{
    
    
    
    
    for ( int i=0; i<ViewCount; i++) {
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0+((float)self.frame.size.width/(float)ViewCount*i), 0, (float)self.frame.size.width/(float)ViewCount, self.frame.size.height);
        
        
        if (normalColor) {
            [button setBackgroundColor:normalColor];
        }
        
        if (normalImage) {
            [button setBackgroundImage:normalImage forState:UIControlStateNormal];
        }
        
        if (normalTitleColor) {
            [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
        }
        
        
        button.tag=10+i;
        [button addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    
    
    
    
}


-(void)clickBtnAction:(UIButton *)sender{
    
    if (!selectBtn) {
        UIButton *btn=(UIButton *)[self viewWithTag:10+selectIndex];
        if (selectColor) {
            [btn setBackgroundColor:normalColor];
        }
        if (selectImage) {
            [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
        }
        [btn setTitleColor:normalTitleColor forState:UIControlStateNormal];
        btn.enabled=YES;
        
        
        if (normalColor) {
            [sender setBackgroundColor:selectColor];
        }
        if (normalImage) {
            [sender setBackgroundImage:selectImage forState:UIControlStateNormal];
        }
        [sender setTitleColor:selectTitleColor forState:UIControlStateNormal];
        sender.enabled=NO;
        selectBtn=sender;
        
    }else{
        if (normalColor) {
            [selectBtn setBackgroundColor:normalColor];
        }
        if (normalImage) {
            [selectBtn setBackgroundImage:normalImage forState:UIControlStateNormal];
        }
        [selectBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
        selectBtn.enabled=YES;
        
        if (selectColor) {
            [sender setBackgroundColor:selectColor];
        }
        if (selectImage) {
            [sender setBackgroundImage:selectImage forState:UIControlStateNormal];
        }
        [sender setTitleColor:selectTitleColor forState:UIControlStateNormal];
        sender.enabled=NO;
        selectBtn=sender;
    }
    
    
    
    if (self.segmentDelegate && [self.segmentDelegate respondsToSelector:@selector(SunSegmentClick:)]) {
        [self.segmentDelegate SunSegmentClick:sender.tag-10];
    }
    
}


-(void)setTitleArray:(NSArray *)title_Array{
    
    if (titleArray != title_Array) {
        titleArray=nil;
        titleArray = [title_Array copy];
    }
    
    [self changeBtnTitle];
    
}

-(void)changeBtnTitle{
    
    
    for (int i=0; i<ViewCount; i++) {
        
        UIButton *btn=(UIButton *)[self viewWithTag:10+i];
        
        [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        
    }
    
    
}






-(void)setTitleFont:(UIFont *)title_Font{
    
    if (titleFont != title_Font) {
        titleFont=nil;
        titleFont =title_Font;
    }
    
    [self changeTitleFont];
    
}

-(void)changeTitleFont{
    
    
    for (int i=0; i<ViewCount; i++) {
        
        UIButton *btn=(UIButton *)[self viewWithTag:10+i];
        
        [btn.titleLabel setFont:titleFont];
        
    }
    
    
    
}








-(void)setSelectIndex:(NSInteger)select_Index{
    
    if (selectIndex != select_Index) {
        
        selectIndex =select_Index;
    }
    
    [self changeSelectIndex];
    
}

-(void)changeSelectIndex{
    
    
    
    UIButton *btn=(UIButton *)[self viewWithTag:10+selectIndex];
    
    
    if (selectColor) {
        [btn setBackgroundColor:selectColor];
    }
    if (selectImage) {
        [btn setBackgroundImage:selectImage forState:UIControlStateNormal];
    }
    
    [btn setTitleColor:selectTitleColor forState:UIControlStateNormal];
    btn.enabled=NO;
    
}









-(void)dealloc{
    
    normalColor=nil;
    selectColor=nil;
    normalImage=nil;
    selectImage=nil;
    selectBtn=nil;
    normalTitleColor=nil;
    selectTitleColor=nil;
    
    titleArray=nil;
    titleFont=nil;
    self.segmentDelegate=nil;
    
    
}







@end
