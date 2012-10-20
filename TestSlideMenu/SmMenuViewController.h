//
//  SmMenuViewController.h
//  TestSlideMenu
//
//  Created by Masamoto Miyata on 2012/10/20.
//  Copyright (c) 2012年 Masamoto Miyata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmMenuViewController : UIViewController
{
    @private
    BOOL isRevealed;
    UIViewController *contentController;
}

-(void)toggleMenuController;

@end
